{
  programs.git = {
    enable = true;
    lfs.enable = true;
    settings = {
      init.defaultBranch = "trunk";
      pull.rebase = true;
      url."ssh://git@github.com".insteadOf = "https://github.com";
      user = {
        name = "dansalias";
        email = "danyoungnz@gmail.com";
      };
    };
  };
}
