{config, lib, pkgs, inputs, ...}:
{
      programs.zsh = {
      
      #all options: https://rycee.gitlab.io/home-manager/options.html#opt-programs.zsh.enable

      enable = true;
      autosuggestion.enable = true;
      enableCompletion = true;
            
      oh-my-zsh = {

        enable = true;
        theme =  "agnoster";
        plugins = [ # List of plugins: https://github.com/ohmyzsh/ohmyzsh/wiki/Plugins
          "fzf" 
          "systemd" # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/systemd
          "thefuck" # command correction. https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/thefuck
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
        ignoreDups = true; 
        extended = true; # Save timestamp
      };

      # https://rycee.gitlab.io/home-manager/options.html#opt-programs.zsh.dirHashes
      dirHashes = {
      };

      # https://rycee.gitlab.io/home-manager/options.html#opt-programs.zsh.shellAliases
      shellAliases = { 
        "o" = "less";
        "gg" = "git grep";
        "m" = "mpv";
        "s" = "tmux a"; 
        "open" = "xdg-open";
      };
 
      initExtra = ''
			export PATH="~/.nix-profile/bin:$PATH"

             '';
      
    };
}
