{ config, pkgs, ... }:

{
  imports = [
    ./foot.nix
    ./niri.nix
    ./waybar.nix
    ./zsh.nix
    ./helix.nix
    ./wallpaper
  ];

  systemd.user.tmpfiles.rules = [
    "d %h/tmp/downloads 0755 - - -"
    "d %h/tmp/screenshots 0755 - - -"
  ];

  home.username = "daniel";
  home.homeDirectory = "/home/daniel";
  home.persistence."/persist" = {
    directories = [
      # wallpaper
      ".cache/awww"
      ".local/state/wallpaper"

      # other
      "archive"
      "blog"
      "books"
      "inbox"
      "lab"
      "notes"
      "photos"
      "projects"
      "resources"
      "scratch"
      "scripts"
    ];
  };

  home.packages = with pkgs; [
    # gui
    hack-font
    phinger-cursors

    # browser
    ungoogled-chromium

    # utility
    ddcutil
    fastfetch
    pass
    ycwd
  ];

  home.stateVersion = "26.05";
}
