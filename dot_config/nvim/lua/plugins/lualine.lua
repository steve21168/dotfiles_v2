return {
  "nvim-lualine/lualine.nvim",
  config = function()
    require('lualine').setup {
      sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch', 'diff', 'diagnostics'},
        lualine_c = {'filename'},
        lualine_x = {'encoding', 'fileformat', 'filetype'},
        lualine_y = {'progress'},
        lualine_z = {'location'}
      },
      options = {
        theme = "catppuccin"
      }
    }
  end
}
