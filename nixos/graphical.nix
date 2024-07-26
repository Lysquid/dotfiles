{ inputs, config, pkgs, ... }:

{

  # Enable the X11 windowing system.
  # services.xserver.enable = true;


  # Configure keymap in X11
  # services.xserver.layout = "us";
  # services.xserver.xkbOptions = "eurosign:e,caps:escape";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound.
  hardware.bluetooth.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  services = {
    libinput.enable = true;
    xserver.xkb = {
      layout = "fr,us";
    };
  };

  environment.systemPackages = with pkgs; [
    ctpv
    mpv
    nautilus
    udiskie
    vscodium-fhs
    wshowkeys
  ];

  programs = {
    firefox.enable = true;
    thunderbird.enable = true;
    dconf.enable = true;
  };

  # List services that you want to enable:
  services.dbus.enable = true;

  services.languagetool = {
    enable = true;
  };


  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    cantarell-fonts
    jetbrains-mono
    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
  ];

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      rom1 = {
        gtk = {
          enable = true;
          theme = {
            name = "Orchis-Dark";
            package = pkgs.orchis-theme;
          };
          iconTheme = {
            name = "Tela-dark";
            package = pkgs.tela-icon-theme;
          };
          font = {
            name = "Cantarell";
            package = pkgs.cantarell-fonts;
            size = 11;
          };
          gtk3.extraConfig = { gtk-cursor-blink = false; };
          gtk4.extraConfig = { gtk-cursor-blink = false; };
        };

        home.pointerCursor = {
          gtk.enable = true;
          # x11.enable = true;
          name = "Bibata-Modern-Ice";
          package = pkgs.bibata-cursors;
          size = 18;
        };

        # TODO: remove
        nixpkgs.config.allowUnfree = true;

        programs.vscode = {
          enable = true;
          package = pkgs.vscodium-fhs;
          extensions = with pkgs.vscode-extensions; [
            jnoortheen.nix-ide
            mhutchie.git-graph
            # github.copilot
            # github.copilot-chat
            ms-python.python
            ms-python.vscode-pylance
            ms-python.isort
            # davidlday.languagetool-linter     # out of date
          ];
        };

        # tried to fix vscode not appearing in gnome 
        xdg.mime.enable = true;
        # xdg.systemDirs.data = [ "${config.home.homeDirectory}/.nix-profile/share/applications" ];
        xdg.systemDirs.data = [ "/home/rom1/.nix-profile/share/applications" ];


        # Now symlink the `~/.config/gtk-4.0/` folder declaratively:
        # xdg.configFile = {
        #   "gtk-4.0/assets".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/assets";
        #   "gtk-4.0/gtk.css".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/gtk.css";
        #   "gtk-4.0/gtk-dark.css".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/gtk-dark.css";
        # };

      };
    };
  };

}