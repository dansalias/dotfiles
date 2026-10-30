{ pkgs, ... }:

{
  services.awww.enable = true;

  systemd.user.services.wallpaper = {
    Unit = {
      Description = "Set wallpaper";
      After = ["graphical-session.target"];
      PartOf = ["graphical-session.target"];
    };

    Service = {
      Type = "oneshot";
      StateDirectory = "wallpaper";

      ExecStart = let
        placeholder = pkgs.runCommand
          "wallpaper.placeholder.png"
          { nativeBuildInputs = with pkgs; [ resvg ]; }
          ''
            resvg --use-fonts-dir ${pkgs.hack-font}/share/fonts/truetype \
              ${./wallpaper.svg} $out
          '';
        script = pkgs.writeShellApplication {
          name = "set-wallpaper";
          runtimeInputs = with pkgs; [ awww resvg ];
          text = ''
            wp="$STATE_DIRECTORY/wallpaper.png"

            declare -xA versions=(
              ['kernel']="linux $(uname -r)"
              ['distro']="nixos $(nixos-version)"
              ['wm']="$(niri --version)"
            )

            declare -xA masks

            for i in "''${!versions[@]}"; do
              masks[$i]=$(echo "''${versions[$i]}" | sed -r 's/./-/g')
            done

            eval "cat <<EOF
            $(cat ${./wallpaper.svg})
            EOF" | resvg --resources-dir ./ - "$wp"

            awww img "$wp"
          '';
        };
      in "${script}/bin/set-wallpaper";
    };

    Install.WantedBy = [ "graphical-session.target" ];
  };
}
