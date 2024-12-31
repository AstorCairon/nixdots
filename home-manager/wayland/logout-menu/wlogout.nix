{ pkgs, ...}: 
{
  programs.wlogout = {
    enable = true;

    layout = [
      
      {
     label = "lock";
     action = "hyprlock";
     text = "Lock";
     keybind = "l";
}
{
     label = "hibernate";
     action = "systemctl hibernate";
     text = "Hibernate";
     keybind = "h";
}
{
     label = "logout";
     action = "loginctl terminate-user $USER";
     text = "Logout";
     keybind = "e";
}
{
     label = "shutdown";
     action = "systemctl poweroff";
     text = "Shutdown";
     keybind = "s";
}
{
     label = "suspend";
     action = "systemctl suspend";
     text = "Suspend";
     keybind = "u";
}
{
     label = "reboot";
     action = "systemctl reboot";
     text  = "Reboot";
     keybind = "r";
}
    ];

    style = ''
	* {
		background-image: none;
		box-shadow: none;
	}

	window {
		background-color: rgba(12, 12, 12, 0.9);
	}

	button {
    		border-radius: 20;
    		border-color: #0E1F2F;
		text-decoration-color: #FFFFFF;
    		color: #FFFFFF;
		background-color: #2A2E4B;
		border-style: solid;
		border-width: 4px;
		background-repeat: no-repeat;
		background-position: center;
		background-size: 32%;
	}

	button:focus, button:active, button:hover {
		background-color: #523549;
		outline-style: none;
	}

	#lock {
    	background-image: image(url("/etc/nixos/pix/icon-pngs/lock.png"));
	}

	#logout {
    	background-image: image(url("/etc/nixos/pix/icon-pngs/logout.png"));
	}

	#suspend {
    	background-image: image(url("/etc/nixos/pix/icon-pngs/low-battery.png"));
	}

	#hibernate {
    	background-image: image(url("/etc/nixos/pix/icon-pngs/hibernate.png"));
	}

	#shutdown {
    	background-image: image(url("/etc/nixos/pix/icon-pngs/standby.png"));
	}

	#reboot {
    	background-image: image(url("/etc/nixos/pix/icon-pngs/reset.png"));
	}
    '';
  };
}
