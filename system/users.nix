{ pkgs, ... }:

{
  users = {
    mutableUsers = false;
    users = {
      root = {
        hashedPasswordFile = "/persist/passwords/root";
      };
      daniel = {
        hashedPasswordFile = "/persist/passwords/daniel";
        isNormalUser = true;
        extraGroups = [ "wheel" "networkmanager" "i2c" ];
        shell = pkgs.zsh;
      };
    };
  };
}
