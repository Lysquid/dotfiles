# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running `nixos-help`).

{ inputs, config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      inputs.home-manager.nixosModules.default
    ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 30d";
  };

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  

  networking.hostName = "nixos"; # Define your hostname.
  # Pick only one of the below networking options.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.
  systemd.network.wait-online.enable = false;

  # Set your time zone.
  time.timeZone = "Europe/Paris";

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "fr_FR.UTF-8";
    LC_IDENTIFICATION = "fr_FR.UTF-8";
    LC_MEASUREMENT = "fr_FR.UTF-8";
    LC_MONETARY = "fr_FR.UTF-8";
    LC_NAME = "fr_FR.UTF-8";
    LC_NUMERIC = "fr_FR.UTF-8";
    LC_PAPER = "fr_FR.UTF-8";
    LC_TELEPHONE = "fr_FR.UTF-8";
    LC_TIME = "fr_FR.UTF-8";
  };


  console = {
  #   font = "Lat2-Terminus16";
    keyMap = "fr";
    # useXkbConfig = true; # use xkbOptions in tty.
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.rom1 = {
    isNormalUser = true;
    description = "Romain";
    extraGroups = [ 
      "wheel"
      "networkmanager"
    ];
  };
  users.defaultUserShell = pkgs.fish;

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      rom1.imports = [./home.nix ];
    };
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    bat
    bottom
    delta
    du-dust
    fastfetch
    fd
    fishPlugins.done
    fishPlugins.sponge
    fishPlugins.tide
    fishPlugins.z
    fzf
    gcc
    gnumake
    htop
    lf
    lsd
    navi
    ntfs3g
    perl536Packages.FileMimeInfo
    ripgrep
    rsync
    tealdeer
    trash-cli
    tree
    unzip
    vimPlugins.packer-nvim
    wget
    xdg-utils
    yt-dlp
    zip
    zoxide
  ];

  # TODO: remove
  nixpkgs.config.allowUnfree = true;

  environment.shells = [ pkgs.fish ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  programs = {
    mtr.enable = true;
    npm.enable = true;
    git.enable = true;
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
    fish = {
      enable = true;
      shellAbbrs = {
        nr = "sudo nixos-rebuild switch";
        ns = "sudo nixos-rebuild --flake ~/.config/nixos#sway switch";
        ng = "sudo nixos-rebuild --flake ~/.config/nixos#gnome switch";
      };
      # TODO: remove environment.fish (conflicts with nix config, ex: ibus) 
    };
    neovim = {
      enable = true;
      defaultEditor = true;
    };
  };


  xdg.mime.defaultApplications = {
    "text/*" = "nvim.desktop";
  };


  documentation.man.generateCaches = false;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  networking.firewall.enable = false;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It's perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?

}

