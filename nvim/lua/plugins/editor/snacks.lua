return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = function()
    -- Se evalúa en tiempo de ejecución, asegurando que Pacha.icons exista
    return {
      dashboard = { enabled = false },
      notifier = { enabled = true },

      picker = {
        icons = {
          files = {
            file = Pacha.icons.kinds.File,
          },
          git = {
            added = Pacha.icons.git.added,
            modified = Pacha.icons.git.modified,
            removed = Pacha.icons.git.removed,
            -- Estos no están en tu tabla, se mantienen estáticos
            commit = "󰜘 ",
            renamed = "➜ ",
            untracked = " ",
            ignored = "◌ ",
            staged = "✓ ",
            unmerged = " ",
          },
          diagnostics = {
            Error = Pacha.icons.diagnostics.Error,
            Warn  = Pacha.icons.diagnostics.Warn,
            Hint  = Pacha.icons.diagnostics.Hint,
            Info  = Pacha.icons.diagnostics.Info,
          },
          -- Inyectamos toda tu tabla de kinds directamente
          kinds = Pacha.icons.kinds,
        },
      },

      input = { enabled = true },
      indent = { enabled = false },
      -- scope = { enabled = true },
      -- scroll = { enabled = true },
      -- statuscolumn = { enabled = false },
      words = { enabled = true },
    }
  end,
  -- luacheck: globals Snacks
  keys = {
    -- command palete
    {
      "<leader>fcp",
      function() Snacks.picker.commands() end,
      desc = "Command Palette",
    },
    -- words
    {
      "]r",
      function() Snacks.words.jump(1) end,
      desc = "Next Reference",
      mode = { "n", "t" },
    },
    {
      "[r",
      function() Snacks.words.jump(-1) end,
      desc = "Prev Reference",
      mode = { "n", "t" },
    },
    -- explorer
    {
      "<leader>tE",
      function()
        require("snacks").picker.explorer({
          jump = { close = true },
          win = {
            list = {
              keys = {
                -- Navigation & Open
                ["<CR>"] = "confirm",
                ["o"] = "confirm",
                ["<C-t>"] = "edit_tab",
                ["<C-v>"] = "edit_vsplit",
                ["<C-s>"] = "edit_split",
                ["<Tab>"] = "toggle_preview",
                ["-"] = "explorer_up",
                ["<BS>"] = "explorer_close",
                ["W"] = "explorer_close_all",
                ["q"] = "close",

                -- File Operations
                ["a"] = "explorer_add",
                ["d"] = "explorer_del",
                ["r"] = "explorer_rename",
                ["c"] = "explorer_copy",
                ["p"] = "explorer_paste",
                ["y"] = { "explorer_yank", mode = { "n", "x" } },
                ["s"] = "explorer_open",   -- Matches nvim-tree "Run System"
                ["R"] = "explorer_update", -- Matches nvim-tree "Refresh"

                -- Toggles
                ["H"] = "toggle_hidden",
                ["I"] = "toggle_ignored",

                -- Diagnostics & Git Navigation (Matches your custom mappings)
                ["]d"] = "explorer_diagnostic_next",
                ["[d"] = "explorer_diagnostic_prev",
                ["]g"] = "explorer_git_next",
                ["[g"] = "explorer_git_prev",

                -- Git Stage/Unstage
                ["gs"] = "git_stage",
                ["gu"] = function(picker)
                  -- Custom action to mimic your nvim-tree git_unstage
                  local item = picker:current()
                  if item and item.file then
                    vim.fn.system("git restore --staged " .. vim.fn.shellescape(item.file))
                    picker:find() -- Refresh the picker
                  end
                end,
              }
            }
          },
        })
      end,
      desc = "Explorer",
    },
    {
      "<leader>ff",
      function() Snacks.picker.files() end,
      desc = "Find Files"
    },
    -- picker
    {
      "<leader>fg",
      function() Snacks.picker.git_files() end,
      desc = "Find Git Files"
    },
    {
      "<leader>fb",
      function() Snacks.picker.buffers() end,
      desc = "Find Buffers"
    },
    {
      "<leader>fm",
      function() Snacks.picker.grep() end,
      desc = "Grep"
    },
    {
      "<leader>fM",
      function() Snacks.picker.grep({ cwd = vim.fn.expand("%:p:h") }) end,
      desc = "Grep (Current Buffer Dir)"
    },
    {
      "<leader>fch",
      function() Snacks.picker.command_history() end,
      desc = "Command History"
    },
    {
      "<leader>gC",
      function() Snacks.picker.git_log() end,
      desc = "Git Commits"
    },
    {
      "<leader>fr",
      function() Snacks.picker.recent() end,
      desc = "Recent Files"
    },
    {
      "<leader>fh",
      function() Snacks.picker.help() end,
      desc = "Help Pages"
    },
    {
      "<leader>fk",
      function() Snacks.picker.keymaps() end,
      desc = "Keymaps"
    },
    {
      "<leader>fd",
      function() Snacks.picker.diagnostics() end,
      desc = "Diagnostics"
    },
    {
      "<leader>fw",
      function() Snacks.picker.grep_word() end,
      desc = "Visual selection or word",
      mode = { "n", "x" }
    },
    -- Notifier
    {
      "<leader>nh",
      "<cmd>Noice history<cr>",
      desc = "Noice History"
    },
    {
      "<leader>nd",
      function() Snacks.notifier.show_history() end,
      desc = "Notification History (Snacks)"
    },
  },
}
