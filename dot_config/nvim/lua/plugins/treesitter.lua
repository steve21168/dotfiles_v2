return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "VeryLazy" },
  config = function()
    require'nvim-treesitter.configs'.setup {
      ensure_installed = "all",
      ignore_install = {},
      highlight = {
        enable = true,
        disable = { 'yaml' },
        additional_vim_regex_highlighting = { 'org' },
      },
      indent = {
        enable = true,
        disable = { 'yaml', 'ruby' }
      },
      matchup = {
        enable = true,
      },
      playground = {
        enable = true,
        disable = {},
        updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
        persist_queries = false, -- Whether the query persists across vim sessions
        keybindings = {
          toggle_query_editor = 'o',
          toggle_hl_groups = 'i',
          toggle_injected_languages = 't',
          toggle_anonymous_nodes = 'a',
          toggle_language_display = 'I',
          focus_language = 'f',
          unfocus_language = 'F',
          update = 'R',
          goto_node = '<cr>',
          show_help = '?',
        },
      }
    }
  end
}
