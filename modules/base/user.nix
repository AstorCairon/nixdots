{ config, lib, pkgs, ...}:
{
  users.users.astor = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    packages = with pkgs; [
      tree
    ];
  };
}
