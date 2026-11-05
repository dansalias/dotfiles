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

  programs.dircolors = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      OTHER_WRITABLE = "30;43";
    };
  };
}
