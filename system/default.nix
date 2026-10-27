{ config, lib, pkgs, theme, ... }:

{
  imports = [
    ./hardware.nix
    ./boot.nix
    ./memory.nix
    ./networking.nix
    ./audio.nix
    ./printing.nix
    ./users.nix
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  time.timeZone = "Europe/Madrid";

  environment.systemPackages = with pkgs; [
    git
    helix
  ];

  environment.variables.EDITOR = "hx";

  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;
  users.users.root.shell = pkgs.zsh;
  programs.niri.enable = true;

  console = {
    earlySetup = true;
    packages = with pkgs; [
      terminus_font
    ];
    font = "ter-v24b";
    colors = theme.colors;
  };

  system.stateVersion = "26.05";
}
