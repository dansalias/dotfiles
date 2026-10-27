{ theme, ... }:

{
  programs.foot = {
    enable = true;
    settings = {
      main = {
        font = "Hack:size=11";
        line-height = "16";
        pad = "4x4";
      };
      colors-dark = {
        background = builtins.elemAt theme.colors 0;
        foreground = builtins.elemAt theme.colors 7;
      } //
      builtins.listToAttrs (
        builtins.genList (i: {
          name = if i < 8 then "regular${toString i}" else "bright${toString (i - 8)}";
          value = builtins.elemAt theme.colors i;
        }) 16
      );
    };
  };
}
