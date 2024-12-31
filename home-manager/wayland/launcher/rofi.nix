{pkgs, ...}:
{
  programs.rofi = {
    enable = true;
  };

  xdg.configFile."rofi/config.rasi".text = ''
   
configuration {
	modi:                       "drun,filebrowser,window";
    show-icons:                 true;
    display-drun:               "";
    display-run:                "";
    display-filebrowser:        "";
    display-window:             "";
	drun-display-format:        "{name}";
	window-format:              "{w}: {c}";
}


* {
    font:                        "JetBrains Mono Nerd Font 10";
    background:                  #903749;
    background-alt:              #db7e6d;
    foreground:                  #FFFFFF;
    selected:                    #b7455c;
    active:                      #E9CC9D;
    urgent:                      #FEA861;
}


window {
    /* properties for window widget */
    transparency:                "real";
    location:                    center;
    anchor:                      center;
    fullscreen:                  false;
    width:                       700px;
    x-offset:                    0px;
    y-offset:                    0px;

    /* properties for all widgets */
    enabled:                     true;
    border-radius:               20px;
    cursor:                      "default";
    background-color:            @background;
}


mainbox {
    enabled:                     true;
    spacing:                     0px;
    background-color:            transparent;
    orientation:                 vertical;
    children:                    [ "inputbar", "listbox" ];
}

listbox {
    spacing:                     20px;
    padding:                     25px;
    background-color:            transparent;
    orientation:                 vertical;
    children:                    [ "message", "listview" ];
}


inputbar {
    enabled:                     true;
    spacing:                     12px;
    padding:                     80px 80px;
    background-color:            transparent;
    background-image:            url("/etc/nixos/pix/kurzgesagt-space-blurred.jpg", width);
    text-color:                  @foreground;
    orientation:                 horizontal;
    children:                    [ "textbox-prompt-colon", "entry", "dummy", "mode-switcher" ];
}
textbox-prompt-colon {
    enabled:                     true;
    expand:                      false;
    str:                         "";
    padding:                     12px 15px;
    border-radius:               100%;
    background-color:            @background-alt;
    text-color:                  inherit;
}
entry {
    enabled:                     true;
    expand:                      false;
    width:                       250px;
    padding:                     12px 16px;
    border-radius:               100%;
    background-color:            @background-alt;
    text-color:                  inherit;
    cursor:                      text;
    placeholder:                 "Search";
    placeholder-color:           inherit;
}
dummy {
    expand:                      true;
    background-color:            transparent;
}


mode-switcher{
    enabled:                     true;
    spacing:                     10px;
    background-color:            transparent;
    text-color:                  @foreground;
}
button {
    width:                       45px;
    hight:                       30px;
    padding:                     12px;
    border-radius:               100%;
    background-color:            @background-alt;
    text-color:                  inherit;
    cursor:                      pointer;
}
button selected {
    background-color:            @selected;
    text-color:                  @foreground;
}


listview {
    enabled:                     true;
    columns:                     3;
    lines:                       2;
    cycle:                       true;
    dynamic:                     true;
    scrollbar:                   false;
    layout:                      vertical;
    reverse:                     false;
    fixed-height:                true;
    fixed-columns:               true;
    
    spacing:                     10px;
    background-color:            transparent;
    text-color:                  @foreground;
    cursor:                      "default";
}


element {
    enabled:                     true;
    spacing:                     15px;
    padding:                     35px 10px;
    border-radius:               25px;
    background-color:            transparent;
    text-color:                  @foreground;
    cursor:                      pointer;
    orientation:                 vertical;
}
element normal.normal {
    background-color:            inherit;
    text-color:                  inherit;
}
element normal.urgent {
    background-color:            @urgent;
    text-color:                  @foreground;
}
element normal.active {
    background-color:            @active;
    text-color:                  @foreground;
}
element selected.normal {
    background-color:            @selected;
    text-color:                  @foreground;
}
element selected.urgent {
    background-color:            @urgent;
    text-color:                  @foreground;
}
element selected.active {
    background-color:            @urgent;
    text-color:                  @foreground;
}
element-icon {
    background-color:            transparent;
    text-color:                  inherit;
    size:                        95px;
    cursor:                      inherit;
}
element-text {
    background-color:            transparent;
    text-color:                  inherit;
    cursor:                      inherit;
    vertical-align:              0.5;
    horizontal-align:            0.5;
}


message {
    background-color:            transparent;
}
textbox {
    padding:                     12px;
    border-radius:               100%;
    background-color:            @background-alt;
    text-color:                  @foreground;
    vertical-align:              0.5;
    horizontal-align:            0.0;
}
error-message {
    padding:                     12px;
    border-radius:               0px;
    background-color:            @background;
    text-color:                  @foreground;
}
  '';


  xdg.configFile."rofi/rofi.sh".text = ''
    #!/usr/bin/env bash

dir="$HOME/.config/rofi"

rofi \
    -show drun \
    -theme ./config.rasi

  '';

  xdg.configFile."rofi/rofi.sh".executable = true; 
}
