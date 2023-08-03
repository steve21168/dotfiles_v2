local M = {}

M.setup = function(dap)
  dap.adapters["pwa-node"] = {
    type = "server",
    host = "localhost",
    port = "8123",
    executable = {
      command = "node",
      cwd = vim.fn.stdpath('data') .. "/mason/packages/js-debug-adapter/js-debug/src/",
      args = {"dapDebugServer.js", "8123"},
    }
  }

  for _, language in ipairs { "typescript", "javascript" } do
    dap.configurations[language] = {
      {
        type = "pwa-node",
        request = "launch",
        name = "Launch file",
        program = "${file}",
        cwd = "${workspaceFolder}",
      },
      {
        type = "pwa-node",
        request = "attach",
        name = "[node] Attach",
        processId = function()
          require("dap.utils").pick_process({filter = 'inspect-brk'})
        end,
        cwd = "${workspaceFolder}",
      },
      {
        type = "pwa-node",
        request = "launch",
        name = "Debug Jest Tests",
        -- trace = true, -- include debugger info
        runtimeExecutable = "node",
        runtimeArgs = {
          "./node_modules/jest/bin/jest.js",
          "--runInBand",
        },
        rootPath = "${workspaceFolder}",
        cwd = "${workspaceFolder}",
        console = "integratedTerminal",
        internalConsoleOptions = "neverOpen",
      },
    }
  end
end

return M
