{ config, pkgs, lib, inputs, ...}:
{
  home.username = "astor";
  home.homeDirectory = "/home/astor";

  #xresources.properties = {
   #"Xcursor.size" = 15;
   #"Xft.dpi" = 172;
  #};

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
   nerd-fonts.wine-fonts 
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
   rofi
   swww
   hyprcursor
   nautilus
   ags

   grim
   slurp
];

  wayland.windowManager.hyprland.enable = true;
    #wayland.windowManager.hyprland.plugins = [ pkgs.hyprlandPlugins.hyprbars];

  wayland.windowManager.hyprland.settings = {

     exec-once = [
      # finalize startup
      "zsh"
      # set cursor for HL itself
      "swww-daemon"
      "sleep 1 && swww img /path/to/your/desired/wallpaper.jpg --transition-type fade --transition-duration 1
"
      "ags"    
    ];

    "$mod" = "SUPER";

    general = {
      gaps_in = "6";
      gaps_out = "21";
      border_size = "0";
      layout = "dwindle";
    };

    decoration = {
      rounding = "16";
       
      active_opacity = "1.0";
      inactive_opacity = "1.0";

      #lib.mkDefault "col.shadow" = "rgba(00000099)";

      blur = {
        enabled = "true";
	brightness = 1.0;
	contrast = 1.0;
	noise = 0.01;
	size = "2";
	passes = "6";
	vibrancy = "1.1"; #"0.1696";
	vibrancy_darkness = 0.5;
	popups = true;
	popups_ignorealpha = 0.2;
      };
        shadow = {
	  enabled = true;
	  offset = "0 15";
	  range = 100;
	  render_power = 2;
	  scale = 0.97;
	};
    };

    animations = {
      enabled = true;

      bezier = "myBezier, 0.25, 1.1, 0.05, 1.01"; #last num: how much the window pops out first when opened
      						#third num: how slow the neighboring window fills the space when a
						#window has been closed
						#second num: how fast a window pops in

      animation = [
        "windows, 1, 7, myBezier" 
	"windowsOut, 1, 7, default, popin 60%"
	"border, 1, 10, default"
	"borderangle, 1, 8, default"
	"fade, 1, 6, default"
	"workspaces, 1, 7, default"
	];


    };

    dwindle = {
      pseudotile = "true";
      preserve_split = "true";
    };

    #master = {
    #  new_status = "master";
    #};

    misc = {
      force_default_wallpaper = "0";
      disable_hyprland_logo = "true";
    };

    input = {
      kb_layout = "gb,de,ru";
      #kb_variant =
      #kb_model =
      kb_options = "grp:alt_shift_toggle";
      #kb_rules =

      follow_mouse = "1";
      sensitivity = "0.5";

      #touchpad = {
       # natural_scroll = "false"; uncomment if you have a touchpad
      #};
    };

    gestures = {
      workspace_swipe = "false";
    };

    windowrulev2 = "suppressevent maximize, class:.*";

    bindm = [
      "$mod, mouse:272, movewindow"
      "$mod, mouse:273, resizewindow"
    ];

    bind = [
        "$mod, B, exec, hyprctl switchxkblayout logitech-k800 next"
        "$mod, left, movefocus, l"
	"$mod, right, movefocus, r"
	"$mod, up, movefocus, u"
	"$mod, down, movefocus, d"

        "$mod, S, togglespecialworkspace, magic"
	"$mod SHIFT, S, movetoworkspace, special:magic"
	"$mod, J, togglesplit"
	"$mod, C, killactive"
	"$mod, M, exit"
	"$mod, E, exec, nautilus"
	"$mod, R, exec, rofi"
	"$mod, P, pseudo"
	"$mod, V, togglefloating"
        "$mod, F, exec, firefox"
	"$mod, Q, exec, kitty"
	"$mod, D, exec, vesktop"
	"$mod, Y, exec, spotify"
	"ALT, S, exec, grim -g \"$(slurp)\" "
	"ALT, C, exec, grim -g \"$(slurp -d)\" - | wl-copy"
	
      ]
      ++ (
        # workspaces
        # binds $mod + [shift +] {1..10} to [move to] workspace {1..10}
        builtins.concatLists (builtins.genList (
            x: let
              ws = let
                c = (x + 1) / 10;
              in
                builtins.toString (x + 1 - (c * 10));
            in [
              "$mod, ${ws}, workspace, ${toString (x + 1)}"
              "$mod SHIFT, ${ws}, movetoworkspace, ${toString (x + 1)}"
            ]
          )
          10)
      );
  };

  programs.kitty = lib.mkForce {
    enable = true;
    settings = {
      font_family = "agave";
      font_size = 13;
      confirm_os_window_close = 0;
      dynamic_background_opacity = true;
    enable_audio_bell = true;
    mouse_hide_wait = "-1.0";
    window_padding_width = 23;
    background_opacity = "0.55";
    background_blur = 5;
    symbol_map = let
      mappings = [
        "U+23FB-U+23FE"
        "U+2B58"
        "U+E200-U+E2A9"
        "U+E0A0-U+E0A3"
        "U+E0B0-U+E0BF"
        "U+E0C0-U+E0C8"
        "U+E0CC-U+E0CF"
        "U+E0D0-U+E0D2"
        "U+E0D4"
        "U+E701-U+E7C5"
        "U+F000-U+F2E0"
        "U+2665"
        "U+26A1"
        "U+F400-U+F4A8"
        "U+F67C"
        "U+E000-U+E00A"
        "U+F300-U+F313"
        "U+E5FA-U+E62B"
      ];
    in
      (builtins.concatStringsSep "," mappings) + " Symbols Nerd Font";
    };
  };

  programs.btop.enable = true;
            
  programs.git = {
   enable = true;
   userName = "Astor Cairon";
   userEmail = "galako.irina@gmail.com";
  };

  programs.bat.enable = true;

    programs.zsh = {
      
      ## all options: https://rycee.gitlab.io/home-manager/options.html#opt-programs.zsh.enable

      enable = true;
      autosuggestion.enable = true;
      enableCompletion = true;
            
      oh-my-zsh = {

        enable = true;
        theme =  "agnoster";
        plugins = [ # List of plugins: https://github.com/ohmyzsh/ohmyzsh/wiki/Plugins
          "fzf" # fuzzy auto-completion and key bindings https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/fzf
          # conflicts with thefuck binding: "sudo" # Easily prefix your current or previous commands with sudo by pressing esc twice. https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/sudo
          "systemd" # useful aliases for systemd. https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/systemd
          "thefuck" # corrects your previous console command. https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/thefuck
          "tmux" # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/tmux
          "z"# https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/z 
	  "compleat" 
	  "extract"
	  "eza"
	  "genpass"
	  "gitfast"
	  "lol" 
	  "rust"
	  "zoxide"
	  
        ];
                    };

          history = {
        share = true; # 
        size = 9999999; 
        save = 9999999; 
        ignoreDups = true; # Do not enter command lines into the history list if they are duplicates of the previous event.
        extended = true; # Save timestamp into the history file.
      };

      ## dirHashes → https://rycee.gitlab.io/home-manager/options.html#opt-programs.zsh.dirHashes
      dirHashes = {
      };

      ## shellAliases → https://rycee.gitlab.io/home-manager/options.html#opt-programs.zsh.shellAliases
      shellAliases = {
        #"ls" = "lsd";
        #"l" = "lsd -la";
        #"any" = "ps xauwww|grep -v grep|grep";
        "dl" = "ls -lhtr --color=always ~/Downloads | tail -n 10"; # Show the 10 newest Downloads
        "o" = "less";
        "gg" = "git grep";
        "m" = "mpv";
        "s" = "tmux a"; 
        "open" = "xdg-open";
        #"plvolleyball" = "grep ':ID: 2015-09-28-PL-Volleyball' -A 17  ~/org/notes.org | tail -n 16";
        #"j" = "echo \"https://meet.rise-world.com/$(tr -dc A-Za-z0-9 </dev/urandom | head -c 30; echo)\" | xclip -selection clipboard -out";   generates random jitsi meet URLs
      };

      # extra entries for .zshrc 
      initExtra = ''
			export PATH="/home/astor/.nix-profile/bin:$PATH"

             '';
      
    };

   programs.firefox = { 
     enable = true;
     profiles.astor = {

       search.engines = {};

       userChrome = ''

         /* insert css */
       '';

       settings = {
         "identity.fxaccounts.enabled" = false;
         "browser.download.panel.shown" = true;
	 "dom.security.https_only_mode" = true;
	 "signon.rememberSignons" = false;
       }; 
		

       bookmarks = [
         {
            name = "wikipedia";
	    tags = [ "wiki" ];
	    keyword = "wiki";
	    url = "https://en.wikipedia.org/wiki/Special:Search?search=%s&go=Go";
         }
       ];
 
     };

    
   };

   programs.lf = {
     enable = true;
     commands = {
       dragon-out = ''%${pkgs.xdragon}/bin/xdragon -a -x "$fx"'';
       editor-open = ''$$EDITOR $f'';
      mkdir = ''
      ''${{
        printf "Directory Name: "
        read DIR
        mkdir $DIR
      }}
      '';
     };

      keybindings = {

      "\\\"" = "";
      o = "";
      c = "mkdir";
      "." = "set hidden!";
      "`" = "mark-load";
      "\\'" = "mark-load";
      "<enter>" = "open";
      
      do = "dragon-out";
      
      "g~" = "cd";
      gh = "cd";
      "g/" = "/";

      ee = "editor-open";
      V = ''$${pkgs.bat}/bin/bat --paging=always --theme=gruvbox "$f"'';

      # ...
    };

    settings = {
      preview = true;
      hidden = true;
      drawbox = true;
      icons = true;
      ignorecase = true;
    };

    extraConfig = 
    let 
      previewer = 
        pkgs.writeShellScriptBin "pv.sh" ''
        file=$1
        w=$2
        h=$3
        x=$4
        y=$5
        
        if [[ "$( ${pkgs.file}/bin/file -Lb --mime-type "$file")" =~ ^image ]]; then
            ${pkgs.kitty}/bin/kitty +kitten icat --silent --stdin no --transfer-mode file --place "''${w}x''${h}@''${x}x''${y}" "$file" < /dev/null > /dev/tty
            exit 1
        fi
        
        ${pkgs.pistol}/bin/pistol "$file"
      '';
      cleaner = pkgs.writeShellScriptBin "clean.sh" ''
        ${pkgs.kitty}/bin/kitty +kitten icat --clear --stdin no --silent --transfer-mode file < /dev/null > /dev/tty
      '';
    in
    ''
      set cleaner ${cleaner}/bin/clean.sh
      set previewer ${previewer}/bin/pv.sh
    '';

   };

    home.stateVersion = "24.05";
  programs.home-manager.enable = true;
}
