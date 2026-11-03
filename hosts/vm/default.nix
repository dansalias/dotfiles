{ config, lib, pkgs, ... }:

{
  hardware.graphics.enable = true;
  services.qemuGuest.enable = true;
  services.spice-vdagentd.enable = true;

  fileSystems."/media/host" = {
    device = "host";
    fsType = "virtiofs";
  };
}
