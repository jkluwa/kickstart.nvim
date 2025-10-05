local dap = require 'dap'
local dapui = require 'dapui'

vim.keymap.set('n', '<F5>', dap.continue, { desc = 'Start/Continue debug' })
vim.keymap.set('n', '<F10>', dap.step_over, { desc = 'Step over' })
vim.keymap.set('n', '<F11>', dap.step_into, { desc = 'Step into' })
vim.keymap.set('n', '<F12>', dap.step_out, { desc = 'Step out' })
vim.keymap.set('n', '<Leader>b', dap.toggle_breakpoint, { desc = 'Toggle breakpoint' })
vim.keymap.set('n', '<Leader>B', function()
  dap.set_breakpoint(vim.fn.input 'Breakpoint condition: ')
end, { desc = 'Set conditional breakpoint' })
vim.keymap.set('n', '<Leader>du', dapui.toggle, { desc = 'Toggle DAP UI' })
