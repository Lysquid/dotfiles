{ inputs, config, pkgs, ... }:

{
  services = {
    xserver = {
      enable = true;
      desktopManager.gnome.enable = true;
      displayManager.gdm.enable = true;
    };
    gnome = {
      core-utilities.enable = true;
      gnome-keyring.enable = true;
    };
  };
  
  environment.gnome.excludePackages = (with pkgs; [
    gnome-photos
    gnome-tour
    cheese # webcam tool
    epiphany # web browser
    geary # email reader
  ]) ++ (with pkgs.gnome; [
    gnome-music
    gnome-characters
  ]);

  environment.systemPackages = (with pkgs; [
    gedit
    eog
  ]) ++ (with pkgs.gnomeExtensions; [
    disable-workspace-animation
    clipboard-indicator
    focus-changer
  ]);

  programs = {
    gnome-terminal.enable = true;
  };

  security.pam.services.rom1.enableGnomeKeyring = true;


  i18n.inputMethod = {
    type = "ibus";
    ibus.engines = with pkgs.ibus-engines; [ mozc ];
  };

  environment.sessionVariables = {
    MOZC_IBUS_CANDIDATE_WINDOW = "ibus";
  };

  # To see dconf config:
  # dconf dump /

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      rom1 = {
        dconf.settings = {
          "system/locale" = {
            region = "fr_FR.UTF-8";
          };
          "org/gnome/desktop/interface" = {
            color-scheme = "prefer-dark";
            monospace-font-name = "JetBrainsMono Nerd Font 11";
          };
          "org/gnome/desktop/input-sources" = {
            show-all-sources = true;
            sources = [
                ( pkgs.lib.gvariant.mkTuple [ "xkb" "fr" ] )
                ( pkgs.lib.gvariant.mkTuple [ "ibus" "mozc-on" ] )
                ( pkgs.lib.gvariant.mkTuple [ "xkb" "us" ] )
              ];
          };
          "org/gnome/desktop/wm/preferences" = {
            resize-with-right-button = true;
          };
          "org/gnome/nautilus/preferences" = {
            default-folder-viewer = "list-view";
          };
          "org/gnome/shell" = {
            enabled-extensions = [
              "disable-workspace-animation@ethnarque"
              "clipboard-indicator@tudmotu.com"
              "focus-changer@heartmire"
            ];
            favorite-apps = [
              "firefox.desktop"
              "org.gnome.Nautilus.desktop"
              "org.gnome.Terminal.desktop"
              "codium.desktop"
            ];
          };
          "org/gnome/shell/extensions/clipboard-indicator" = {
            toggle-menu = [ "<Super>Menu" ];
          };
          "org/gnome/shell/extensions/focus-changer" = {
            focus-down = [ "" ];
            focus-left = [ "<Super>BackSpace" ];
            focus-right = [ "<Super>Delete" ];
            focus-up = [ "" ];
          };
          "org/gnome/shell/keybindings" = {
            toggle-overview = [ "<Super>Return" ];
            switch-to-application-1 = [ "" ];
            switch-to-application-2 = [ "" ];
            switch-to-application-3 = [ "" ];
            switch-to-application-4 = [ "" ];
            switch-to-application-5 = [ "" ];
            switch-to-application-6 = [ "" ];
            switch-to-application-7 = [ "" ];
            switch-to-application-8 = [ "" ];
            switch-to-application-9 = [ "" ];
          };
          "org/gnome/desktop/wm/keybindings" = {
            switch-to-workspace-1 = [ "<Super>1" ];
            switch-to-workspace-2 = [ "<Super>2" ];
            switch-to-workspace-3 = [ "<Super>3" ];
            switch-to-workspace-4 = [ "<Super>4" ];
            move-to-workspace-1 = [ "<Shift><Super>1" ];
            move-to-workspace-2 = [ "<Shift><Super>2" ];
            move-to-workspace-3 = [ "<Shift><Super>3" ];
            move-to-workspace-4 = [ "<Shift><Super>4" ];
          };
          "org/gnome/settings-daemon/plugins/media-keys" = {
            custom-keybindings = [
              "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/"
              "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/"
            ];
            email = [ "<Super>h" ];
            home = [ "<Super>e" ];
            www = [ "<Super>f" ];
          };
          "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
            binding = "<Super>t";
            command = "gnome-terminal";
            name = "Launch Console";
          };
          "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1" = {
            binding = "<Super>c";
            command = "codium";
            name = "Launch Code";
          };
          "org/gnome/settings-daemon/plugins/power" = {
            sleep-inactive-ac-type = "nothing";
          };
          "org/gnome/terminal/legacy/profiles:" = {
            list = [ "b1dcc9dd-5262-4d8d-a863-c897e6d979b9" ];
          };
          "org/gnome/terminal/legacy/profiles:/:b1dcc9dd-5262-4d8d-a863-c897e6d979b9" = {
            visible-name = "Default";
            audible-bell = false;
            cursor-blink-mode = "off";
            use-system-font = true;
          };
          "org/gnome/desktop/background" = {
            picture-uri = "file:///run/current-system/sw/share/backgrounds/gnome/blobs-l.svg";
            picture-uri-dark = "file:///run/current-system/sw/share/backgrounds/gnome/blobs-d.svg";
          };
          "org/gnome/system/location" = {
            enabled = true;
          };
          "org/gnome/desktop/privacy" = {
            remove-old-trash-files = true;
            remove-old-temp-files = true;
          };
          "org/gnome/settings-daemon/plugins/power" = {
            power-button-action = "interactive";
          };
          "org/gnome/settings-daemon/plugins/color" = {
            night-light-enabled = true;
          };
        };
      };
    };
  };

}
 
 
 