# or move to system config? (for root too)

{
  programs.helix = {
    enable = true;
    settings = {
      theme = "custom";
    };
    themes.custom = {
      "ui.cursor" = { fg = "black"; bg = "white"; };
      "ui.linenr" = "gray";
      "ui.linenr.selected" = "white";
      "ui.selection" = { fg = "white"; bg = "gray"; };
      "ui.statusline" = { bg = "white"; fg = "black"; };
      "ui.menu.selected" = { bg = "gray"; modifiers = [ "bold" ]; };

      "diagnostic.underline" = { color = "blue"; style = "curl"; };
      "diagnostic.warning.underline" = { color = "light-yellow"; style = "curl"; };
      "diagnostic.error.underline" = { color = "light-red"; style = "curl"; };

      "diff.delta" = "yellow";
      "diff.plus" = "green";
      "diff.minus" = "red";

      "warning" = "light-yellow";
      "error" = "light-red";
      "info" = "light-blue";
      "hint" = "light-green";

      "attribute" = "yellow";
      "type" = "yellow";
      "constructor" = "yellow";
      "constant" = "blue";
      "string" = "light-green";
      "comment" = { fg = "gray"; modifiers = ["italic"]; };
      "variable" = "cyan";
      "variable.builtin" = "magenta";
      "variable.other.member" = "light-cyan";
      "label" = "light-magenta";
      "punctuation" = "light-cyan";
      "keyword" = "magenta";
      "function" = "light-blue";
      "tag" = "cyan";
      "namespace" = "magenta";
      "special" = "magenta";
    };
  };
}
