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
  ]) ++ (with pkgs.gnome; [
    cheese # webcam tool
    gnome-music
    epiphany # web browser
    geary # email reader
    gnome-characters
  ]);

  environment.systemPackages = with pkgs; [
    gnome.eog
  ];

  programs = {
    gnome-terminal.enable = true;
  };

  security.pam.services.rom1.enableGnomeKeyring = true;


  i18n.inputMethod = {
    enabled = "ibus";
    ibus.engines = with pkgs.ibus-engines; [ mozc ];
  };

  environment.sessionVariables = {
    MOZC_IBUS_CANDIDATE_WINDOW = "ibus";
  };

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
            num-workspaces = 6;
            resize-with-right-button = true;
            action-middle-click-titlebar= "lower";
            button-layout = "appmenu:minimize,maximize,close";
          };
          "org/gnome/shell/app-switcher" = {
            current-workspace-only = false;
          };
          "org/gnome/shell/keybindings" = {
            toggle-overview = [ "<Super>o" ];
          };
          "org/gnome/desktop/wm/keybindings" = {
            begin-move = [ "<Shift><Super>r" ];
            begin-resize = [ "<Super>r" ];
            close = [ "<Shift><Super>Delete" ];
            minimize = [ "<Super>h" ];
            show-desktop = [ "<Super>d" ];

            switch-to-workspace-1 = [ "<Super>1" ];
            switch-to-workspace-2 = [ "<Super>2" ];
            switch-to-workspace-3 = [ "<Super>3" ];
            switch-to-workspace-4 = [ "<Super>4" ];
            switch-to-workspace-5 = [ "<Super>5" ];
            switch-to-workspace-6 = [ "<Super>6" ];
            switch-to-workspace-7 = [ "<Super>7" ];
            switch-to-workspace-8 = [ "<Super>8" ];
            switch-to-workspace-9 = [ "<Super>9" ];
            switch-to-workspace-10 = [ "<Super>0" ];
            move-to-workspace-1 = [ "<Shift><Super>1" ];
            move-to-workspace-2 = [ "<Shift><Super>2" ];
            move-to-workspace-3 = [ "<Shift><Super>3" ];
            move-to-workspace-4 = [ "<Shift><Super>4" ];
            move-to-workspace-5 = [ "<Shift><Super>5" ];
            move-to-workspace-6 = [ "<Shift><Super>6" ];
            move-to-workspace-7 = [ "<Shift><Super>7" ];
            move-to-workspace-8 = [ "<Shift><Super>8" ];
            move-to-workspace-9 = [ "<Shift><Super>9" ];
            move-to-workspace-10 = [ "<Shift><Super>0" ];
          };
          "org/gnome/settings-daemon/plugins/media-keys" = {
            calculator = [ "<Super>c" ];
            email = [ "<Super>t" ];
            home = [ "<Super>e" ];
            www = [ "<Super>f" ];
            terminal = [ "<Super>Return" ];
          };
          "org/gnome/terminal/legacy/keybindings" = {
            find = "<Primary>f";
            paste = "<Primary>v";
          };
          "org/gnome/terminal/legacy/profiles:" = {
            list = [ "b1dcc9dd-5262-4d8d-a863-c897e6d979b9" ];
          };
          "org/gnome/terminal/legacy/profiles:/:b1dcc9dd-5262-4d8d-a863-c897e6d979b9" = {
            visible-name = "Default";
            audible-bell = false;
            cursor-blink-mode = "off";
            cursor-shape = "ibeam";
            use-system-font = true;
          };
          "org/gnome/desktop/background" = {
            picture-uri = "file:///run/current-system/sw/share/backgrounds/gnome/blobs-l.svg";
            picture-uri-dark = "file:///run/current-system/sw/share/backgrounds/gnome/blobs-d.svg";
          };
          "org/gnome/system/location" = {
            enable = true;
          };
          "org/gnome/desktop/privacy" = {
            remove-old-trash-files = true;
            remove-old-temp-files = true;
            old-files-age = 30;
            recent-files-max-age = 30;
          };
          "org/gnome/settings-daemon/plugins/power" = {
            power-button-action = "interactive";
          };
          "org/gnome/settings-daemon/plugins/color" = {
            night-light-enabled=true;
          };
        };
      };
    };
  };

}
 
 
 