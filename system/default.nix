{ config, diskDevice, hostName, lib, pkgs, theme, ... }:

{
  imports = [
    ./disk.nix
    ./boot.nix
    ./memory.nix
    ./networking.nix
    ./bluetooth.nix
    ./audio.nix
    ./printing.nix
    ./users.nix
  ];

  hardware.i2c.enable = true;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  time.timeZone = "Europe/Madrid";

  environment.systemPackages = with pkgs; [
    brightnessctl
    git
    helix
    jq
    wl-clipboard
  ];

  environment.variables.EDITOR = "hx";

  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;
  users.users.root.shell = pkgs.zsh;
  programs.niri.enable = true;

  services.udev.packages = [ pkgs.vial ];

  console = {
    earlySetup = true;
    packages = with pkgs; [
      terminus_font
    ];
    font = "ter-v24b";
    colors = theme.colors;
  };

  environment.persistence."/persist" = {
    directories = [
      "/var/lib/nixos"
    ];
  };

  system.stateVersion = "26.05";
}
