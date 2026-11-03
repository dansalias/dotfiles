{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    impermanence = {
      url = "github:nix-community/impermanence";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, disko, home-manager, impermanence, ... }:
    let
      theme = import ./theme.nix;
      mkHost = { diskDevice, hostName }: nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit diskDevice hostName theme; };
        modules = [
          disko.nixosModules.disko
          ./hosts/${hostName}
          ./hosts/${hostName}/hardware.nix
          ./system
          home-manager.nixosModules.home-manager
          impermanence.nixosModules.impermanence
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = { inherit theme; };
            home-manager.users.daniel = ./home;
          }
        ];
      };
    in {
      nixosConfigurations = {
        laptop = mkHost {
          hostName = "laptop";
          diskDevice = "/dev/nvme0n1";
        };
        vm = mkHost {
          hostName = "vm";
          diskDevice = "/dev/vda";
        };
      };
      apps.x86_64-linux.install = {
        type = "app";
        program = "${
          nixpkgs.legacyPackages.x86_64-linux.writeShellApplication {
            name = "install";
            text = ''
              set -x

              git clone https://github.com/dansalias/dotfiles /tmp/dotfiles
              cd /tmp/dotfiles

              export NIX_CONFIG="experimental-features = nix-command flakes"

              host_name="''${1:?usage: install <hostname>}"

              nixos-generate-config \
                --no-filesystems \
                --show-hardware-config \
                > "./hosts/''${host_name}/hardware.nix"

              git add -N ./hosts

              disk_device=$(nix eval --raw \
                ".#nixosConfigurations.''${host_name}.config.disko.devices.disk.main.device"
              )

              nix \
                --experimental-features "nix-command flakes" \
                run github:nix-community/disko/latest -- \
                --mode destroy,format,mount \
                "./system/disk.nix" \
                --argstr diskDevice "''${disk_device}"

              nixos-install \
                --flake ".#''${host_name}" \
                --root /mnt \
                --no-root-passwd

              mkdir -p /mnt/persist/passwords
              mkpasswd -m sha-512 > /mnt/persist/passwords/root
              mkpasswd -m sha-512 > /mnt/persist/passwords/daniel
              chmod 600 /mnt/persist/passwords/*

              cp -r /tmp/dotfiles /home/daniel
            '';
          }
        }/bin/install";
      };
  };
}
