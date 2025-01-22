{ self, pkgs, ...}:
  {
    programs.nixvim = { 
    enable = true;

     globalOpts = {
    # Line numbers
    number = true;
    relativenumber = true;

    # Always show the signcolumn, otherwise text would be shifted when displaying error icons
    signcolumn = "yes";

    # Enable mouse
    mouse = "a";

    # Search
    ignorecase = true;
    smartcase = true;
  
    # Configure how new splits should be opened
    splitright = true;
    splitbelow = true;

    list = true;
    # NOTE: .__raw here means that this field is raw lua code
    listchars.__raw = "{ tab = '» ', trail = '·', nbsp = '␣' }";

    # Tab defaults (might get overwritten by an LSP server)
    tabstop = 4;
    shiftwidth = 4;
    softtabstop = 0;
    expandtab = true;
    smarttab = true;

    # System clipboard support, needs xclip/wl-clipboard
    
    # Save undo history
    undofile = true;


    # Highlight the current line for cursor
    cursorline = true;

    # Show line and column when searching
    ruler = true;

    # Global substitution by default
    gdefault = true;

    # Start scrolling when the cursor is X lines away from the top/bottom
    scrolloff = 5;
  };

  

 

  autoCmd = [
    {
      event = [ "VimEnter" ];
      callback = { __raw = "function() if vim.fn.argv(0) == '' then require('telescope.builtin').find_files() end end"; };
    }
  ];

    keymaps = [ #TODO: further configure keymaps!
      {
        action = "<cmd>Telescope live_grep<CR>";
	key = "<leader>t";
      }
      {
        action = ":CHADopen<CR>";
	key = "<leader>e";
      }
    ];

    highlight = {
      Comment.fg = "#b3e3e2";
      Comment.bg = "#3a6160";
      Comment.underline = false;
      Comment.bold = true;
    };

    clipboard.providers.wl-copy.enable = true;
 
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
    barbar.enable = true;
    alpha.enable = true;
    #avante.enable  = true;
    alpha.theme = "dashboard";
    nvim-colorizer.enable = true;
    neocord.enable = true; #FIXME: !!!! neocord cannot find discord to apply itself! It is crying! :'((
    chadtree.enable = true;
    ccc.enable = true;
    comment-box.enable = true;
    sandwich.enable = true;
    illuminate.enable = true;

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
