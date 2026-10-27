{ config, lib, pkgs, ... }:

{
  imports = [
    ./disko.nix
  ];

  hardware.graphics.enable = true;
  services.qemuGuest.enable = true;
  services.spice-vdagentd.enable = true;
}
