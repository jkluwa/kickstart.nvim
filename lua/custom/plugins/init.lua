return {
  -- Debug Adapter Protocol
  {
    'mfussenegger/nvim-dap',
    dependencies = {
      'rcarriga/nvim-dap-ui',
      'theHamsta/nvim-dap-virtual-text',
      'nvim-telescope/telescope-dap.nvim',
    },
    config = function()
      local dap = require 'dap'
      local dapui = require 'dapui'

      require('nvim-dap-virtual-text').setup()
      dapui.setup()
      dap.listeners.before.attach.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        dapui.open()
      end
      dap.listeners.after.event_initialized['dapui_config'] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated['dapui_config'] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited['dapui_config'] = function()
        dapui.close()
      end

      -- C++ Debug Adapter (lldb)
      dap.adapters.lldb = {
        type = 'executable',
        command = '/usr/bin/lldb-dap', -- or 'lldb-dap' if available
        name = 'lldb',
      }

      dap.configurations.cpp = {
        {
          name = 'Launch C++ program (with make)',
          type = 'lldb',
          request = 'launch',
          program = function()
            local result = vim.fn.system 'make'

            -- Print make output (optional)
            print(result)

            if vim.v.shell_error ~= 0 then
              error '❌ Build failed! Check your Makefile.'
            else
              print '✅ Build successful!'
            end

            return vim.fn.getcwd() .. '/main'
          end,
          cwd = '${workspaceFolder}',
          stopOnEntry = false,
          args = {},
        },
      }

      dap.configurations.c = dap.configurations.cpp
      dap.configurations.rust = dap.configurations.cpp
    end,
  },
}
