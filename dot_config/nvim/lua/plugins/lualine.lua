return {
  "nvim-lualine/lualine.nvim",
  config = function()
    require('lualine').setup {
      sections = {
        lualine_a = {'mode'},
        lualine_b = {'filename'},
        lualine_c = {'branch', 'diff', 'diagnostics'},
        lualine_x = {'filetype'},
        lualine_y = {'progress'},
        lualine_z = {'location' }
      },
      options = {
        theme = "catppuccin"
      }
    }
  end
}
