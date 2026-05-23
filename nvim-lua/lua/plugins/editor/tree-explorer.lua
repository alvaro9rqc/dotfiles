return {
  "nvim-tree/nvim-tree.lua",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  lazy = true,
  cmd = { "NvimTreeToggle", "NvimTreeFindFile", "NvimTreeFocus" },
  opts = function()
    local function custom_mapping_nvim_tree(bufnr)
      local api = require("nvim-tree.api")
      api.map.on_attach.default(bufnr)
      local function opts(desc)
        return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
      end
      -- Delete some maps
      vim.keymap.del("n", "[e", { buffer = bufnr })
      vim.keymap.del("n", "]e", { buffer = bufnr })
      vim.keymap.del("n", "[c", { buffer = bufnr })
      vim.keymap.del("n", "]c", { buffer = bufnr })
      vim.keymap.del("n", "<C-e>", { buffer = bufnr })

      -- Customs maps
      vim.keymap.set("n", "]d", api.node.navigate.diagnostics.next, opts("Next Diagnostic"))
      vim.keymap.set("n", "[d", api.node.navigate.diagnostics.prev, opts("Prev Diagnostic"))
      vim.keymap.set("n", "]g", api.node.navigate.git.next, opts("Next Git"))
      vim.keymap.set("n", "[g", api.node.navigate.git.prev, opts("Prev Git"))

      -- Git Stage/Unstage
      local function git_stage()
        local node = api.tree.get_node_under_cursor()
        if node == nil then
          return
        end
        vim.fn.system("git add " .. vim.fn.shellescape(node.absolute_path))
        api.tree.reload()
      end

      local function git_unstage()
        local node = api.tree.get_node_under_cursor()
        if node == nil then
          return
        end
        vim.fn.system("git restore --staged " .. vim.fn.shellescape(node.absolute_path))
        api.tree.reload()
      end

      vim.keymap.set("n", "gs", git_stage, opts("Git Stage File"))
      vim.keymap.set("n", "gu", git_unstage, opts("Git Unstage File"))
    end

    return {
      sort = { sorter = "case_sensitive" },
      diagnostics = {
        enable = true,
        show_on_dirs = true, -- Muestra el icono de diagnóstico en la carpeta si un archivo dentro tiene errores
        show_on_open_dirs = true,
        debounce_delay = 50,
        severity = {
          min = vim.diagnostic.severity.HINT,
          max = vim.diagnostic.severity.ERROR,
        },
        icons = {
          hint = Pacha.icons.diagnostics.Hint,
          info = Pacha.icons.diagnostics.Info,
          warning = Pacha.icons.diagnostics.Warn,
          error = Pacha.icons.diagnostics.Error,
        },
      },
      view = {
        number = true,
        width = 40,
        signcolumn = "yes",
        relativenumber = true,
      },
      renderer = {
        indent_markers = {
          enable = true,
        },
        icons = {
          git_placement = "right_align",
          diagnostics_placement = "before",
          modified_placement = "right_align",
          glyphs = {
            default = Pacha.icons.kinds.File,
            git = {
              unstaged = Pacha.icons.git.modified,
              deleted = Pacha.icons.git.removed,
              untracked = Pacha.icons.git.untracked,
              staged = Pacha.icons.git.staged,
              unmerged = Pacha.icons.git.unmerged,
              renamed = Pacha.icons.git.renamed,
              ignored = Pacha.icons.git.ignored,
            },
          },
        },
      },
      actions = {
        open_file = { quit_on_open = true },
      },
      filters = { dotfiles = true },
      on_attach = custom_mapping_nvim_tree,
    }
  end,
  keys = {
    { "<leader>te", "<cmd>NvimTreeFindFile!<cr>", mode = "n", desc = "Toggle NvimTree" },
  },
  config = function(_, opts)
    require("nvim-tree").setup(opts)
  end,
}
