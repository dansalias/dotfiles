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
          "wallpaper-placeholder.png"
          { nativeBuildInputs = with pkgs; [ resvg ]; }
          ''
            resvg --use-fonts-dir ${pkgs.hack-font}/share/fonts/truetype \
              ${./wallpaper.svg} $out 
          '';
        script = pkgs.writeShellApplication {
          name = "set-wallpaper";
          runtimeInputs = with pkgs; [ resvg awww ];
          text = ''
            wp="$STATE_DIRECTORY/wallpaper.png"

            awww img ${placeholder}

            eval "cat <<EOF
            $(sed 's/amp;//' < ${./wallpaper.svg})
            EOF" | resvg --resources-dir ./ - "$wp"

            awww img "$wp"
          '';
        };
      in "${script}/bin/set-wallpaper";
    };

    Install.WantedBy = [ "graphical-session.target" ];
  };
}
