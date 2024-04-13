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
    gnome.gnome-terminal
    gnome.eog
  ];

  security.pam.services.rom1.enableGnomeKeyring = true;

}
 
 
 