{ pkgs, ... }:
  {
    stylix.enable = true;
    stylix.image = /home/astor/wallpapers/pattern2.png;
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
      name = "DejaVu Serif";
    };

    sansSerif = {
      package = pkgs.dejavu_fonts;
      name = "DejaVu Sans";
    };

    monospace = {
      package = pkgs.dejavu_fonts;
      name = "DejaVu Sans Mono";
    };

    emoji = {
      package = pkgs.noto-fonts-emoji;
      name = "Noto Color Emoji";
    };
  };


  }
