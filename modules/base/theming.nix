{ pkgs, ... }:
  {
    stylix.enable = true;
    stylix.image = ../../pix/kurzgesagt-space.jpg;
    stylix.polarity = "dark";

    stylix.base16Scheme = {
    base00 = "#0C1F2E"; ##051835
    base01 = "#133249";
    base02 = "#274d6b";
    base03 = "#336287";
    base04 = "#3e6fa0";
    base05 = "#4a89ba";
    base06 = "#84b4d8";
    base07 = "#90c5ed";
    base08 = "#fc5f91";
    base09 = "#fc748a";
    base0A = "#fc8874";
    base0B = "#fcaa7b";
    base0C = "#e07082";
    base0D = "#db7e6d";
    base0E = "#db9b76";
    base0F = "#dbb472";
  };

  
  stylix.fonts = {

   serif = {
    package = pkgs.prociono;
    name = "Prociono";
  };
  sansSerif = {
    package = pkgs.eurofurence;
    name = "EuroFurence";
  };
  monospace = {
    package = pkgs.nerd-fonts.monofur;
    name = "Monofur Nerd Font Mono";
    };

    emoji = {
      package = pkgs.noto-fonts-emoji;
      name = "Noto Color Emoji";
    };
  };


  }
