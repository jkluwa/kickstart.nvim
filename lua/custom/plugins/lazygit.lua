return {
  'kdheepak/lazygit.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  -- Lazy-loading: wtyczka ładuje się dopiero, gdy wciśniesz skrót
  keys = {
    { '<leader>gg', '<cmd>LazyGit<cr>', desc = 'Otwórz [G]it [G]UI (LazyGit)' },
  },
}
