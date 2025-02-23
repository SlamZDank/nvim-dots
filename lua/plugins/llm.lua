return {
  "Kurama622/llm.nvim",
  dependencies = { "nvim-lua/plenary.nvim", "MunifTanjim/nui.nvim" },
  lazy = false,
  cmd = { "LLMSelectedTextHandler", "LLMAppHandler" },
  config = function()
    local tools = require "llm.tools"
    require("llm").setup {
      prompt = "You are a helpful chinese assistant.",

      prefix = {
        user = { text = "😃 ", hl = "Title" },
        assistant = { text = "⚡ ", hl = "Added" },
      },

      style = "float", -- right | left | above | below | float
      -- [[deepseek]]
      url = "http://localhost:11343/api/chat",
      model = "deepseek-r1:14b",
      api_type = "ollama",

      max_tokens = 1024,
      save_session = true,
      max_history = 15,
      history_path = "/tmp/history", -- where to save history
      temperature = 0.3,
      top_p = 0.7,

      spinner = {
        text = {
          "󰧞󰧞",
          "󰧞󰧞",
          "󰧞󰧞",
          "󰧞󰧞",
        },
        hl = "Title",
      },

      display = {
        diff = {
          layout = "vertical", -- vertical|horizontal split for default provider
          opts = { "internal", "filler", "closeoff", "algorithm:patience", "followwrap", "linematch:120" },
          provider = "mini_diff", -- default|mini_diff
        },
      },
      app_handler = {
        Completion = {
          handler = tools.completion_handler,
          opts = {
            -------------------------------------------------
            ---                   ollama
            -------------------------------------------------
            url = "http://localhost:11434/v1/completions",
            model = "qwen2.5-coder:7b",
            api_type = "ollama",
            ------------------- end ollama ------------------

            n_completions = 3,
            context_window = 512,
            max_tokens = 256,

            -- A mapping of filetype to true or false, to enable completion.
            filetypes = { sh = false },

            -- Whether to enable completion of not for filetypes not specifically listed above.
            default_filetype_enabled = true,

            auto_trigger = true,

            -- just trigger by { "@", ".", "(", "[", ":", " " } for `style = "nvim-cmp"`
            only_trigger_by_keywords = true,

            style = "virtual_text", -- nvim-cmp or blink.cmp

            timeout = 10, -- max request time

            -- only send the request every x milliseconds, use 0 to disable throttle.
            throttle = 1000,
            -- debounce the request in x milliseconds, set to 0 to disable debounce
            debounce = 400,

            --------------------------------
            ---   just for virtual_text
            --------------------------------
            keymap = {
              virtual_text = {
                accept = {
                  mode = "i",
                  keys = "<A-a>",
                },
                next = {
                  mode = "i",
                  keys = "<A-j>",
                },
                prev = {
                  mode = "i",
                  keys = "<A-k>",
                },
                toggle = {
                  mode = "n",
                  keys = "<leader>cp",
                },
              },
            },
          },
        },
      },
    }
  end,
}
