return {
  'stevearc/oil.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('oil').setup {
      -- Podstawowa konfiguracja
      default_file_explorer = true, -- Zastępuje domyślnego Netrw (wbudowany explorer w Vima)

      -- Wygląd i kolumny
      columns = {
        'icon',
        -- "permissions",
        -- "size",
        -- "mtime",
      },

      -- Zachowanie buforów
      buf_options = {
        buflisted = false,
        bufhidden = 'hide',
      },

      -- Ukrywanie plików .gitignore
      view_options = {
        show_hidden = false, -- domyślnie nie pokazuj ukrytych plików (użyj g. aby przełączyć)
        is_hidden_file = function(name, bufnr)
          return vim.startswith(name, '.')
        end,
        is_always_hidden = function(name, bufnr)
          return name == '..'
        end,
      },

      -- Mapowania klawiszy wewnątrz Oil
      keymaps = {
        ['g?'] = 'actions.show_help',
        ['<CR>'] = 'actions.select',
        ['<C-s>'] = 'actions.select_vsplit', -- Otwórz w podziale pionowym
        ['<C-h>'] = 'actions.select_split', -- Otwórz w podziale poziomym
        ['<C-t>'] = 'actions.select_tab', -- Otwórz w nowej karcie
        ['<C-p>'] = 'actions.preview', -- Podgląd
        ['<C-c>'] = 'actions.close', -- Zamknij
        ['<C-l>'] = 'actions.refresh', -- Odśwież
        ['-'] = 'actions.parent', -- Przejdź katalog wyżej
        ['_'] = 'actions.open_cwd', -- Otwórz aktualny katalog roboczy
        ['`'] = 'actions.cd', -- Zmień aktualny katalog roboczy (CWD)
        ['~'] = 'actions.tcd', -- Zmień CWD tylko dla aktualnej karty
        ['gs'] = 'actions.change_sort', -- Zmień sortowanie
        ['gx'] = 'actions.open_external', -- Otwórz w zewnętrznym programie (np. obrazek w przeglądarce)
        ['g.'] = 'actions.toggle_hidden', -- Przełącz ukryte pliki
        ['g\\'] = 'actions.toggle_trash', -- Pokaż kosz
      },

      -- Gdzie używać kosza zamiast trwałego usunięcia (wymaga programu 'trash' w systemie)
      use_default_keymaps = true,
    }

    -- Mapowanie do otwierania Oil z dowolnego miejsca
    vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = 'Otwórz folder nadrzędny (Oil)' })
  end,
}
