#{ pkgs }:

#pkgs.stdenv.mkDerivation rec {
#  pname = "sddm-eucalyptus-drop";
#  version = "1.2";
#  dontBuild = true;
#
#  propagatedUserEnvPkgs = [ pkgs.libsForQt5.qt5.qtgraphicaleffects ];
#
#  src = pkgs.fetchgit {
#    url = "https://gitlab.com/Matt.Jolly/sddm-eucalyptus-drop/";
#    rev = "0b82ca465b7dac6d7ff15ebaf1b2f26daba5d126";
#    sha256 = "sha256-dyIC84vCpBHrZEOhXWJduWZpGCeAmiY2MCk6uaK6dOQ=";
#  };
#
#  configOverride = builtins.readFile ./sddm-overrides.conf;

#  installPhase = ''
#    mkdir -p $out/share/sddm/themes/sddm-eucalyptus-drop
#   
#   echo "${configOverride}" > $out/share/sddm/themes/sddm-eucalyptus-drop/theme.conf 
# 
#    
#    cp -Rn $src/* $out/share/sddm/themes/sddm-eucalyptus-drop/
#  '';
#} #Credits to wasOnceABasilisk from discourse.nixos.org for the template







#{ pkgs, ... }: 

#let 
#  imglink = "https://github.com/AstorCairon/nixdots/blob/main/pix/kurzgesagt-space.jpg?raw=true";
#  image = {
#    url = imglink;
#    sha256 = "sha256-5e08f0f2a2351a43e5376c782105413daf586bbdae855f7fd02ee180cbe0b026";
#  };
#in
#  pkgs.stdenv.mkDerivation {
#    name = "sddm-theme";
#    src = pkgs.fetchFromGitHub {
#      owner = "Keyitdev";
#      repo = "sddm-astronaut-theme";
#      rev = "7123e3870baeeb58298abd80a4b4e1216872d1d9";
#      sha256 = "sha256-DOzsmXwFjG8GlD8TkXMCjCQzTU9Fc/S7MUGm5b8OWlY=";
#    };
#    installphase = '' 
#  mkdir -p $out/share/sddm/themes/my-theme
#  cp -R $src/* $out/share/sddm/themes/my-theme
#      '';
#  }

