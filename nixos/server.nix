{ inputs, config, pkgs, ... }:

{

  environment.systemPackages = with pkgs; [
    udiskie
    ngrok
    openssl
  ];

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # TODO: handle secrets (authtoken and basic auth)
  systemd.services.ngrok = {
    description = "ngrok";
    wantedBy = [ "multi-user.target" ];
    after = [ "network.target" ];
    serviceConfig = {
      User = "rom1";
      ExecStart = ''${pkgs.ngrok}/bin/ngrok start --all --config /home/rom1/.config/ngrok/ngrok.yml''; 
      ExecStopPost=''${pkgs.coreutils-full}/bin/sleep 1'';
      Restart = "always";
      RestartSec = 30;
    };
  };


  system.activationScripts = {
    nginxCertDir = {
      text = ''
        mkdir -p /var/lib/nginx/certs
        chown nginx:nginx /var/lib/nginx/certs
        chmod 700 /var/lib/nginx/certs
      '';
      deps = [];
    };
    generateSelfSignedCert = {
      text = ''
        if [ ! -f /var/lib/nginx/certs/cert.pem ] || [ ! -f /var/lib/nginx/certs/key.pem ]; then
          ${pkgs.openssl}/bin/openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
            -keyout /var/lib/nginx/certs/key.pem \
            -out /var/lib/nginx/certs/cert.pem \
            -batch
          chown nginx:nginx /var/lib/nginx/certs/cert.pem /var/lib/nginx/certs/key.pem
          chmod 600 /var/lib/nginx/certs/cert.pem /var/lib/nginx/certs/key.pem
        fi
      '';
      deps = ["nginxCertDir"];
    };
  };

  services.nginx = {
    enable = true;
    recommendedProxySettings = true;
    recommendedTlsSettings = true;
    virtualHosts = {
      "local" = {
        enableACME = false;
        forceSSL = true;
        sslCertificate = "/var/lib/nginx/certs/cert.pem";
        sslCertificateKey = "/var/lib/nginx/certs/key.pem";
        listen = [
          {
            addr = "0.0.0.0";
            port = 443;
            ssl = true;
          }
        ];
        locations = {
          "~ ^/(status|inspect|static|grpc)" = {
            proxyPass = "http://127.0.0.1:4040";
          };
          "/syncthing/" = {
            proxyPass = "http://127.0.0.1:8384/";
          };
          "/jellyfin/" = {
            proxyPass = "http://127.0.0.1:8096/";
          };
        };
      };
      "ngrok" = {
        listen = [
          {
            addr = "localhost";
            port = 80;
          }
        ];
        locations = {
          "~ ^/(status|static|grpc)" = {
            proxyPass = "http://127.0.0.1:4040";
          };
        };
      };
    };
  };

  services.syncthing = {
    enable = true;
    guiAddress = "0.0.0.0:8384";
    user = "rom1";
  };

  services.jellyfin = {
    enable = true;
    user = "rom1";
  };

  fileSystems."/mnt/Media" = {
   device = "/dev/disk/by-uuid/22EA2BBC39D6FF95";
   fsType = "ntfs-3g";
   options = [
      "defaults"
      "nofail" # Prevent system from failing if this drive doesn't mount
      "x-gvfs-show"
      "uid=1000"
      "gid=1000"
      "dmask=022"
      "fmask=133"
   ];
 };

}
