return {
  'kyazdani42/nvim-tree.lua',
  dependencies = {
    "nord.nvim",
    'kyazdani42/nvim-web-devicons',
  },
  config = function()
    require'nvim-tree'.setup {
      respect_buf_cwd = true,
      actions = {
        open_file = {
          quit_on_open = true,
        },
      },
      renderer = {
        highlight_opened_files = 'all',
        highlight_git = true,
        add_trailing = true,
        group_empty = true,
        icons = {
          symlink_arrow = ' >> ',
          show = {
            git = true,
            folder = true,
            file = true,
            folder_arrow = true,
          },
          glyphs = {
            default = "",
            symlink = "",
            folder = {
              arrow_open = "",
              arrow_closed = "",
              default = "",
              open = "",
              empty = "",
              empty_open = "",
              symlink = "",
              symlink_open = "",
            },
            git = {
              unstaged = "✗",
              staged = "✓",
              unmerged = "",
              renamed = "➜",
              untracked = "★",
              deleted = "",
              ignored = "◌"
            },
          },
        },
        special_files = { "README.md", "Makefile", "MAKEFILE" } -- List of filenames that gets highlighted with NvimTreeSpecialFile
      }
    }
  end
}
