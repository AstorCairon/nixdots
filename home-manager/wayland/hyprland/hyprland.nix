{config, pkgs, lib, inputs, ...}:
{
  wayland.windowManager.hyprland.enable = true;
    #wayland.windowManager.hyprland.plugins = [ pkgs.hyprlandPlugins.hyprbars];

  wayland.windowManager.hyprland.settings = {

     exec-once = [
      "zsh" 
      "swww-daemon"
      "waybar"    
    ];

    "$mod" = "SUPER";

    general = {
      gaps_in = "6";
      gaps_out = "21";
      border_size = "3";
      layout = "dwindle";
      "col.active_border" = lib.mkForce "rgba(249,227,222,0.87)";
      "col.inactive_border" = lib.mkForce "rgba(249,227,222,0.87)";
    };

    decoration = {
      rounding = "16";
       
      active_opacity = "1.0";
      inactive_opacity = "1.0";
 

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
        shadow = lib.mkForce {
        enabled = true;
        color = "rgba(252,83,83,0.95)";
        ignore_window = true;
        offset = "1 1";
        range = 15;
        render_power = 3;
        scale = 1.0;
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

}
