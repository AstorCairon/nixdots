{ pkgs, ... }:
  {
    stylix.enable = true;
    stylix.image = /home/astor/wallpapers/pattern2.png;
    stylix.polarity = "dark";

    stylix.base16Scheme = {
    base00 = "022733"; ##051835
    base01 = "1c4c5c";
    base02 = "316a7d";
    base03 = "3d849c";
    base04 = "70939e";
    base05 = "8bb7c4";
    base06 = "adcfd9";
    base07 = "c8ecf7";
    base08 = "D34140";
    base09 = "D45D5D";
    base0A = "F89203";
    base0B = "BBA79A";
    base0C = "A96E6D";
    base0D = "E0512C";
    base0E = "D6473D";
    base0F = "E33B47";
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
