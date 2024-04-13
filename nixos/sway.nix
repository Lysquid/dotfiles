{ inputs, config, pkgs, ... }:

{

  programs = {
    sway = {
      enable = true;
      wrapperFeatures.gtk = true;
      extraPackages = with pkgs; [

      ];
    };
    waybar.enable = true;
  };

  environment.systemPackages = with pkgs; [
    brightnessctl
    clipman
    hyprpicker
    rofi-wayland
    networkmanagerapplet
    playerctl
    swaybg
    swayidle
    swaylock
    sway-contrib.grimshot
    slurp
    udiskie
    viewnior
    wdisplays
    wl-clipboard
    wl-gammactl
  ];

  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "dbus-run-session sway > /dev/null 2> /dev/null";
        user = "rom1";
      };
    };
  };

  services.pipewire = {
    enable = true;
    wireplumber.enable = true;
    alsa.enable = true;
    pulse.enable = true;
  };

  xdg.portal = {
    enable = true;
    wlr.enable = true;
    # gtk portal needed to make gtk apps happy
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };

  i18n.inputMethod = {
    enabled = "fcitx5";
    fcitx5.addons = with pkgs; [ fcitx5-mozc ];
  };


}