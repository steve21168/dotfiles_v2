local M = {}

M.setup = function(dap)
  dap.set_log_level = 'DEBUG'
  dap.adapters.ruby = function(callback, config)
    if config.request == 'attach' then
      callback {
        type = "server",
        host = "0.0.0.0",
        port = config.port
      }
    else
      callback {
        type = "server",
        host = "127.0.0.1",
        port = config.port,
        executable = {
          command = "rdbg",
          args = { "--open", "--port", config.port,
            "-c", "--", config.command, config.script,
          },
        }
      }
    end
  end

  dap.configurations.ruby = {
    {
      type = "ruby",
      name = "Attach",
      request = "attach",
      port = 9797,
      options = {
        source_filetype = 'ruby';
      };
    },
    {
      type = "ruby",
      name = "Attch docker (connect)",
      request = "attach",
      port = 9797,
      localfsMap =  '/opt/app-root/src/:/Users/stevengoodstein/stella',
      options = {
        source_filetype = 'ruby';
      };
      command = "ruby",
      script = "${file}",
    },
    {
      type = "ruby",
      name = "RSpec",
      request = "launch",
      port = 9898,
      command = "rspec",
      script = "${file}",
    },
    {
      type = "ruby",
      name = "Run file",
      request = "launch",
      port = 9899,
      command = "ruby",
      script = "${file}",
    },
  }
end

return M
