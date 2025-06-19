return {
  "nvim-tree/nvim-tree.lua",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  lazy = false;
  opts = function()
    -- Mapeos personalizados por buffer
    local function custom_mapping_nvim_tree(bufnr)
      local api = require("nvim-tree.api")

      local function opts(desc)
	return {
	  desc = "nvim-tree: " .. desc,
	  buffer = bufnr,
	  noremap = true,
	  silent = true,
	  nowait = true,
	}
      end

      -- Mapeos por defecto
      api.config.mappings.default_on_attach(bufnr)

      vim.keymap.del("n", "<C-e>", { buffer = bufnr })
    end

    return {
      sort = {
	sorter = "case_sensitive",
      },
      view = {
	number = true,
	relativenumber = true,
      },
      actions = {
	open_file = {
	  quit_on_open = true,
	},
      },
      filters = {
	dotfiles = true,
      },
      on_attach = custom_mapping_nvim_tree,
    }
  end,
  keys = {
    {
      "<leader>te", "<cmd>NvimTreeFindFile!<cr>",
      mode = "n",
      desc = "Toggle NvimTree",
    },
  },
  config = function(_, opts) 
    require("nvim-tree").setup(opts)
  end
}
