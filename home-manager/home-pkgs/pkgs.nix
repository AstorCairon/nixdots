{config, pkgs, lib, inputs, ...}:
{
   home.packages = with pkgs; [ 
   fastfetch                 #  All of the packages in the first chunk are basically useless. So, if you want to save that bit of space for something else, just delete this chunk outta this list.	
   nitch
   pfetch
   hyfetch
   cpufetch
   pokemonsay
   ponysay
   glava
   pipes-rs
   cmatrix
   figlet
   tty-clock 
   lolcat
   bat
   peaclock

   nerd-fonts.agave #try monofur, iosevka, zed-mono, lekton, departure-mono, recursive-mono, sauce-code-pro, daddy-time-mono, comic-shanns-mono
   nerd-fonts.mplus
   nerd-fonts.symbols-only 
   texlivePackages.kpfonts
   texlivePackages.tpslifonts
   texlivePackages.hebrew-fonts
   texlivePackages.fonts-churchslavonic
   texlivePackages.concmath-fonts

   oh-my-zsh
   zsh
   thefuck
   tmux 
     
   zoxide
   eza
   fzf
   
   zip
   xz
   unzip
   p7zip

   ripgrep
   wl-clipboard
   xdg-utils
   ffmpeg

   xorg.libX11
   libglvnd

   nmap
   dnsutils
   iperf3
   ipcalc

   file
   which
   tree
   gnused
   gnutar
   gawk
   zstd
   gnupg


   nh
   lf
   hexyl

   btop
   iotop
   iftop

   strace
   ltrace
   lsof

   gdb
   sysstat
   lm_sensors
   ethtool
   pciutils
   usbutils
   
   cargo
   rustc
   gcc

   brave 
   krita 
   libreoffice 
   obs-studio
   vlc 
   signal-desktop
   telegram-desktop
   vesktop
   spotify
   spicetify-cli
   celestia
   logisim-evolution
   osu-lazer-bin

   steam
   lutris
   bottles

   kitty
   hyprland
   hyprpicker 
   swww
   hyprcursor
   nautilus
   ags

   grim
   slurp
];

}
