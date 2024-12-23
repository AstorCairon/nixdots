{ pkgs, ... }:
  {
    stylix.enable = true;
    stylix.image = ../../pix/forest1.jpg;
    stylix.polarity = "dark";

    stylix.base16Scheme = {
    base00 = "#12241C"; ##051835
    base01 = "#274B39";
    base02 = "#376A51";
    base03 = "#468666";
    base04 = "#539E78";
    base05 = "#62BA8E";
    base06 = "#6DD09F";
    base07 = "#7AE8B1";
    base08 = "#AFD55C";
    base09 = "#B4D769";
    base0A = "#B6D572";
    base0B = "#BBD77D";
    base0C = "#BED788";
    base0D = "#C1D792";
    base0E = "#C5D79E";
    base0F = "#CAD9AB";
  };

  
  stylix.fonts = {
    serif = {
      package = pkgs.dejavu_fonts;
      name = "Dejavu fonts";
    };

    sansSerif = {
      package = pkgs.dejavu_fonts;
      name = "Dejavu fonts";
    };

    monospace = {
      package = pkgs.dejavu_fonts;
      name = "Dejavu fonts";
    };

    emoji = {
      package = pkgs.noto-fonts-emoji;
      name = "Noto Color Emoji";
    };
  };


  }
