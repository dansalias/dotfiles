{
  programs.zsh = {
    enable = true;
    autocd = true;
    history = {
      append = true;
      expireDuplicatesFirst = true;
      ignoreAllDups = true;
      size = 1000;
    };
    historySubstringSearch = {
      enable = true;
    };
    initContent = "";
    localVariables = {
      PROMPT = "%F{blue}%~: %F{reset_color}";
      LC_COLLATE = "C";
    };
    shellAliases = {
      c = "clear";
      q = "exit";
      e = "$EDITOR";
      gui = "niri-session";
    };
    siteFunctions = {
      mkcd = ''
        mkdir -p "$1"
        cd "$1"
      '';
    };
  };
}
