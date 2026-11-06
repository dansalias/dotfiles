{
  programs.gh = {
    enable = true;
    settings = {
      git_protocol = "ssh";
    };
    hosts = {
      "github.com" = {
        user = "dansalias";
      };
    };
  };
}
