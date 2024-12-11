local options = {
  base46 = {
    theme = "radium",
    hl_add = {},
    hl_override = {
      Comment = { italic = true },
      ["@comment"] = { italic = true },
      NvDashAscii = { fg = "#60ffbf", bg = "#161616" },
      NvDashButtons = { fg = "#ffffff", bg = "#000000" },
      TblineFill = {},
      NvimTreeRootFolder = { link = "NvimTreeFolderName" },
    },
    integrations = {},
    changed_themes = {},
    transparency = false,
    theme_toggle = { "radium", "one_light" },
  },

  ui = {
    cmp = {
      icons_left = false, -- only for non-atom styles!
      lspkind_text = true,
      style = "atom_colored", -- default/flat_light/flat_dark/atom/atom_colored
      format_colors = {
        tailwind = true, -- will work for css lsp too
        icon = "󱓻",
      },
    },

    telescope = { style = "borderless" }, -- borderless / bordered

    statusline = {
      theme = "default", -- default/vscode/vscode_colored/minimal
      -- default/round/block/arrow separators work only for default statusline theme
      -- round and block will work for minimal theme only
      separator_style = "default",
      order = nil,
      modules = nil,
    },

    mason = {
      cmd = true,
      pkgs = {
        "lua-language-server",
        "stylua",
        "bash-language-server",
        "bash-debug-adapter",
        "shellcheck",
        "codelldb",
        "clang-format",
        "clangd",
        "rust-analyser",
        "basedpyright",
      },
    },

    tabufline = {
      enabled = true,
      lazyload = true,
      order = { "treeOffset", "buffers", "tabs", "btns" },
      modules = nil,
    },
    -- this is broken on the latest ui update of nvchad
  },

  nvdash = {
    NvDashAscii = { fg = "#60ffbf", bg = "#161616" },
    NvDashButtons = { fg = "#ffffff", bg = "#000000" },
    load_on_startup = true,

    header = {
      "                                      ",
      "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀     ⠀⠀⣠⣤⣶⣶⣦⣄⣀              ",
      " ⠀⠀⠀⠀⠀⠀⠀⠀  ⠀⠀   ⢰⣿⣿⣿⣿⣿⣿⣿⣷⣦            ",
      "  ⠀⠀⠀⠀⠀⠀  ⠀   ⠀⢠⣷⣤⠀⠈⠙⢿⣿⣿⣿⣿⣿⣦⡀         ",
      "⠀  ⠀⠀⠀⠀  ⠀   ⠀⣠⣿⣿⣿⠆⠰⠶⠀⠘⢿⣿⣿⣿⣿⣿⣆        ",
      "⠀⠀  ⠀⠀     ⠀⢀⣼⣿⣿⣿⠏⠀⢀⣠⣤⣤⣀⠙⣿⣿⣿⣿⣿⣷       ",
      "⠀⠀       ⠀⠀⢠⠋⢈⣉⠉⣡⣤⢰⣿⣿⣿⣿⣿⣷⡈⢿⣿⣿⣿⣿⣷      ",
      "       ⠀⠀⠀⡴⢡⣾⣿⣿⣷⠋⠁⣿⣿⣿⣿⣿⣿⣿⠃⠀⡻⣿⣿⣿⣿⡇     ",
      "      ⠀⠀⢀⠜⠁⠸⣿⣿⣿⠟⠀⠀⠘⠿⣿⣿⣿⡿⠋⠰⠖⠱⣽⠟⠋⠉⡇     ",
      " ⠀  ⠀  ⡰⠉⠖⣀⠀⠀⢁⣀⠀⣴⣶⣦⠀⢴⡆⠀⠀⢀⣀⣀⣉⡽⠷⠶⠋      ",
      "    ⠀⠀⡰⢡⣾⣿⣿⣿⡄⠛⠋⠘⣿⣿⡿⠀⠀⣐⣲⣤⣯⠞⠉⠁          ",
      "   ⠀⢀⠔⠁⣿⣿⣿⣿⣿⡟⠀⠀⠀⢀⣄⣀⡞⠉⠉⠉⠉⠁             ",
      "    ⡜⠀⠀⠻⣿⣿⠿⣻⣥⣀⡀⢠⡟⠉⠉                   ",
      "   ⢰⠁⠀⡤⠖⠺⢶⡾⠃⠀⠈⠙⠋                      ",
      "   ⠈⠓⠾⠇                               ",
      "                                      ",
    },

    buttons = {
      { txt = " ", hl = "NvDashButtons", no_gap = false, rep = true },
      { txt = "  Find File", keys = "Spc f f", cmd = "Telescope find_files" },
      { txt = "  Recent Files", keys = "Spc f o", cmd = "Telescope oldfiles" },
      { txt = "  Find Project", keys = "Spc p p", cmd = "Telescope neovim-project discover" },
      { txt = "  Recent Sessions", keys = "Spc p o", cmd = "Telescope neovim-project history" },
      { txt = "  Find Word", keys = "Spc f w", cmd = "Telescope live_grep" },
      { txt = "  Bookmarks", keys = "Spc m a", cmd = "Telescope marks" },
      { txt = "  Themes", keys = "Spc t h", cmd = "Telescope themes" },
      { txt = "  Mappings", keys = "Spc c h", cmd = "NvCheatsheet" },

      { txt = " ", hl = "NvDashAscii", no_gap = true, rep = true },

      {
        txt = function()
          local stats = require("lazy").stats()
          local ms = math.floor(stats.startuptime) .. " ms"
          return "   Loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. " "
        end,
        hl = "NvDashAscii",
        no_gap = true,
      },

      { txt = " ", hl = "NvDashAscii", no_gap = true, rep = true },
    },
  },

  term = {
    winopts = { number = true, relativenumber = true },
    sizes = { sp = 0.3, vsp = 0.2, ["bo sp"] = 0.3, ["bo vsp"] = 0.2 },
    float = {
      relative = "editor",
      row = 0.3,
      col = 0.25,
      width = 0.5,
      height = 0.4,
      border = "single",
    },
  },

  lsp = { signature = true },

  cheatsheet = {
    theme = "grid", -- simple/grid
    excluded_groups = { "terminal (t)", "autopairs", "Nvim", "Opens" }, -- can add group name or with mode
  },

  colorify = {
    enabled = true,
    mode = "virtual", -- fg, bg, virtual
    virt_text = "󱓻 ",
    highlight = { hex = true, lspvars = true },
  },
}

return options
