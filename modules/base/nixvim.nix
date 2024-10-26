{ self, pkgs, ...}:
  {
    programs.nixvim = { 
    enable = true;

    globals.mapleader = " ";

    keymaps = [ #TODO: further configure keymaps!
      {
        action = "<cmd>Telescope live_grep<CR>";
	key = "<leader>t";
      }
      {
        action = ":NvimTreeToggle<CR>";
	key = "<leader>e";
      }
    ];

    highlight = {
      Comment.fg = "#b3e3e2";
      Comment.bg = "#3a6160";
      Comment.underline = false;
      Comment.bold = true;
    };
 
    plugins = {

    lsp = {
      enable = true;
      servers = {
        rust_analyzer = {
	  enable = true;
	  installRustc = true;
	  installCargo = true;

	};	

	lua_ls.enable = true;

	};
    };

    cmp = {
      enable = true;
      autoEnableSources = true;
    };

    bufferline.enable = true;
    lightline.enable = true;
    lualine.enable = true;
    fzf-lua.enable = true;
    telescope.enable = true;
    oil.enable = true;
    treesitter.enable = true;
    luasnip.enable = true;
    web-devicons.enable = true;
    arrow.enable = true;
    alpha.enable = true;
    #avante.enable  = true;
    alpha.theme = "dashboard";
    nvim-colorizer.enable = true;
    neocord.enable = true; #FIXME: !!!! neocord cannot find discord to apply itself! It is crying! :'((
    nvim-tree.enable = true;

    #airline = {
    #  enable = true;
    # 
    #  settings = {
    #    theme = "base16";
    #    symbols = {
    #       branch = "ᛘ";
    #       colnr = " ℅:";
    #       readonly = "🔒";
    #       maxlinenr = "☰ ";
    #       dirty= "⚡";
    #    };
    #  };
    #};
      
      };
    };
  }
