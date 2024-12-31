{pkgs, ...}: 
{ 
  xdg.configFile."hypr/hyprlock.conf".text = ''

    background {
    monitor =
    path = /etc/nixos/pix/kurzgesagt-space.jpg  # only png supported for now
    color = $color7

    # all these options are taken from hyprland, see https://wiki.hyprland.org/Configuring/Variables/#blur for explanations
    blur_size = 5
    blur_passes = 5 # 0 disables blurring
    noise = o.o5
    contrast = 1.1500 # Vibrant!!!
    brightness = 0.8000
    vibrancy = 0.2100
    vibrancy_darkness = 0.0
}

input-field {
    monitor =
    size = 280, 70
    rounding = 25
    outline_thickness = 5
    dots_size = 0.18 # Scale of input-field height, 0.2 - 0.8
    dots_spacing = 2.00 # Scale of dots' absolute size, 0.0 - 1.0
    dots_rounding = 5
    dots_center = true
    outer_color = rgba(39,77,107,1) 
    inner_color = $color0
    font_color = rgba(39,77,107,1) 
    fade_on_empty = true
    placeholder_text = <i>Password plz ...</i> # Text rendered in the input box when it's empty.
    hide_input = false
    position = 0, 50
    halign = center
    valign = bottom 
}




# Current time
label {
    monitor =
    text = cmd[update:1000] echo "<b><big> $(date +"%H") </big></b>"
    color = rgba(252,170,123,1) 
    font_size = 160
    font_family = Eurofurence
    position = -30, 160
    halign = center
    valign = center
}

label {
    monitor =
    text = cmd[update:1000] echo "<b><big> $(date +"%H") </big></b>"
    color = rgba(252,170,123,0.5) 
    font_size = 160
    font_family = Eurofurence
    position = -37, 158
    halign = center
    valign = center
}

label {
    monitor =
    text = cmd[update:1000] echo "<b><big> $(date +"%H") </big></b>"
    color = rgba(252,170,123,0.3) 
    font_size = 160
    font_family = Eurofurence
    position = -42, 156
    halign = center
    valign = center
}


label {
    monitor =
    text = cmd[update:1000] echo "<b><big> $(date +"%M") </big></b>"
    color = rgba(252,95,145,1) 
    font_size = 160
    font_family = IBM Plex Sans Medium 10
    position = 30, -10
    halign = center
    valign = center
}

label {
    monitor =
    text = cmd[update:1000] echo "<b><big> $(date +"%M") </big></b>"
    color = rgba(252,95,145,0.5) 
    font_size = 160
    font_family = IBM Plex Sans Medium 10
    position = 23, -12
    halign = center
    valign = center
}

label {
    monitor =
    text = cmd[update:1000] echo "<b><big> $(date +"%M") </big></b>"
    color = rgba(252,95,145,0.3) 
    font_size = 160
    font_family = IBM Plex Sans Medium 10
    position = 16, -14
    halign = center
    valign = center
}









label {
    monitor =
    text = cmd[update:1000] echo "<b><big> $(date +"%d %b") </big></b>"
    color = rgba(252,116,138,1)
    font_size = 26
    font_family = IBM Plex Sans Medium 10
    position = 0, -190 
    halign = center
    valign = center
}
label {
    monitor =
    text = cmd[update:1000] echo "<b><big> $(date +"%A") </big></b>"
    color =  
    font_size = 18
    font_family = IBM Plex Sans Medium 10
    position = 0, -230
    halign = center
    valign = center
}





label {
    monitor =
    text = cmd[update:86400000] echo "<b><big> (don't) guess the password </big></b>"
    color = rgba(0,200,255,0.4)
    font_size = 16
    font_family = SF Pro Rounded
    position = 0, -80
    halign = center
    valign = top
}
  '';
}

