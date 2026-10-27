{ pkgs, utils, ... }:

{
  boot = {
    initrd = {
      systemd = {
        services.reset = {
          description = "reset root filesystem";
          unitConfig.DefaultDependencies = false;
          serviceConfig.Type = "oneshot";
          wantedBy = [ "initrd.target" ];
          after = [ "${utils.escapeSystemdPath "/dev/mapper/cryptroot"}.device" ];
          before = [ "sysroot.mount" ];
          script = ''
            mkdir -p /tmp/fs
            mount /dev/mapper/cryptroot /tmp/fs

            btrfs subvolume delete -R /tmp/fs/root

            btrfs subvolume create /tmp/fs/root

            umount /tmp/fs
            rmdir /tmp/fs
          '';
        };
      };
    };

    kernelPackages = pkgs.linuxPackages_latest;

    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
  };
}
