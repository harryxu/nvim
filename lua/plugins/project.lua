return {
  {
    "ahmedkhalf/project.nvim",
    opts = {},
    event = "VeryLazy",
    config = function(_, opts)
      require("project_nvim").setup(opts)
      require("telescope").load_extension("projects")
    end,
    keys = {
      { "<leader>fp", "<Cmd>Telescope projects<CR>", desc = "Projects" },
    },
  },

  -- nvim tree
  {
    'nvim-tree/nvim-tree.lua',
    version = '*',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
      sort_by = 'case_sensitive',
      sync_root_with_cwd = true,
      respect_buf_cwd = true,
    },
    config = function(_, opts)
      require('nvim-tree').setup(opts)
      vim.keymap.set({'n', 'i', 'v'}, '<F3>', '<ESC>:NvimTreeFindFileToggle<CR>')
    end,
  },

}
