{config, lib, pkgs, inputs, ...}:
{
      programs.zsh = {
      
      #all options: https://rycee.gitlab.io/home-manager/options.html#opt-programs.zsh.enable

      enable = true;
      autosuggestion.enable = true;
      enableCompletion = true; 
            
      oh-my-zsh = {

        enable = true;
        theme = ""; #"agnoster";
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
			source "${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
		export POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR=''  
    		export POWERLEVEL9K_RIGHT_SEGMENT_SEPARATOR='' 
   		export POWERLEVEL9K_LEFT_SUBSEGMENT_SEPARATOR='' # Rounded inner separator
   		export POWERLEVEL9K_RIGHT_SUBSEGMENT_SEPARATOR='' # Rounded inner separator
    		export POWERLEVEL9K_OS_ICON_CONTENT=''
    		export POWERLEVEL9K_OS_ICON_FOREGROUND=4    # Set the color (optional)
    		export POWERLEVEL9K_OS_ICON_BACKGROUND=6    # Set the background color (optional)
    		export POWERLEVEL9K_STATUS_OK=false
    		export POWERLEVEL9K_STATUS_VERBOSE_SIGNALS=false
     
     		export POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(time)
     		POWERLEVEL9K_MODE=nerdfont-complete
     		POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
     		#POWERLEVEL9K_MULTILINE=true
     		#POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX='%242F╭─'
     		#POWERLEVEL9K_MULTILINE_NEWLINE_PROMPT_PREFIX='%242F├─'
     		#POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX='%242F╰─'

     		POWERLEVEL9K_RIGHT_PROMPT_LAST_SEGMENT_END_SYMBOL=''
     		POWERLEVEL9K_LEFT_PROMPT_FIRST_SEGMENT_START_SYMBOL=''

    		
    		export POWERLEVEL9K_CONTEXT_TEMPLATE=""
    		POWERLEVEL9K_OS_ICON_FOREGROUND=232   
   		POWERLEVEL9K_OS_ICON_BACKGROUND=2  
    		export POWERLEVEL9K_TIME_FOREGROUND=232   
    		export POWERLEVEL9K_TIME_BACKGROUND=9
    		POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status command_execution_time nix_shell)
    		POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon vcs dir newline)
    		POWERLEVEL9K_DIR_WORK_NON_EXISTENT_VISUAL_IDENTIFIER_EXPANSION='⭐'
    		POWERLEVEL9K_STATUS_ERROR_VISUAL_IDENTIFIER_EXPANSION=''
    		POWERLEVEL9K_STATUS_ERROR_FOREGROUND=232
    		POWERLEVEL9K_STATUS_ERROR_BACKGROUND=1
    		POWERLEVEL9K_STATUS_ERROR_SIGNAL_VISUAL_IDENTIFIER_EXPANSION='󰞃'
    		POWERLEVEL9K_STATUS_ERROR_SIGNAL_FOREGROUND=232
    		POWERLEVEL9K_STATUS_ERROR_SIGNAL_BACKGROUND=1
    		POWERLEVEL9K_STATUS_OK_VISUAL_IDENTIFIER_EXPANSION=''
    		POWERLEVEL9K_STATUS_OK_FOREGROUND=232
    		POWERLEVEL9K_STATUS_OK_BACKGROUND=0
    		POWERLEVEL9K_STATUS_ERROR_PIPE_VISUAL_IDENTIFIER_EXPANSION='󰢉'
    		POWERLEVEL9K_STATUS_ERROR_PIPE_FOREGROUND=232
    		POWERLEVEL9K_STATUS_ERROR_PIPE_BACKGROUND=1
   		POWERLEVEL9K_COMMAND_EXECUTION_TIME_FOREGROUND=232
    		POWERLEVEL9K_COMMAND_EXECUTION_TIME_BACKGROUND=12
    		POWERLEVEL9K_COMMAND_EXECUTION_TIME_FORMAT='d h m s'
    		POWERLEVEL9K_RUST_VERSION_VISUAL_IDENTIFIER_EXPANSION=''

  

             '';
      
    };
}
