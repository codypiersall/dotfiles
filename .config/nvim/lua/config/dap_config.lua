local dap = require("dap")
dap.adapters.gdb = {
  type = "executable",
  command = "gdb",
  args = { "--interpreter=dap", "--eval-command", "set print pretty on" }
}

dap.configurations.c = {
  {

    name = "/home/cody/projects/horus/sw/ncmd/build_tests2/tests",
    type = "gdb",
    request = "launch",
    program = "/home/cody/projects/horus/sw/ncmd/build_tests2/tests",
    args = {}, -- provide arguments if needed
    cwd = "${workspaceFolder}",
    stopAtBeginningOfMainSubprogram = true,
    justMyCode = true,
  },
  {
    name = "Launch",
    type = "gdb",
    request = "launch",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    args = {}, -- provide arguments if needed
    cwd = "${workspaceFolder}",
    stopAtBeginningOfMainSubprogram = true,
  },
  {
    name = "Select and attach to process",
    type = "gdb",
    request = "attach",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    pid = function()
      local name = vim.fn.input('Executable name (filter): ')
      return require("dap.utils").pick_process({ filter = name })
    end,
    cwd = '${workspaceFolder}'
  },
  {
    name = 'Attach to gdbserver :1234',
    type = 'gdb',
    request = 'attach',
    target = 'localhost:1234',
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}'
  }
}

dap.configurations.cpp = dap.configurations.c
vim.keymap.set('n', '\'b', dap.toggle_breakpoint, {desc = "Toggle Breakpoint"})
vim.keymap.set('n', '\'c', dap.continue, {desc = "continue"})
vim.keymap.set('n', '\'r', dap.run_last, {desc = "Rerun last debugging command"})
vim.keymap.set('n', '\'o', dap.step_over, {desc = "step over line"})
vim.keymap.set('n', '\'s', dap.step_into, {desc = "step into function"})
vim.keymap.set('n', '\'u', dap.up, {desc = "go up in current trace without stepping"})
vim.keymap.set('n', '\'d', dap.down, {desc = "go down in current trace without stepping"})
vim.keymap.set('n', '\'l', dap.run_to_cursor, {desc = "set breakpoint at current line"})

local dapui = require("dapui")
dapui.setup()
dap.listeners.before.attach.dapui_config = function()
  dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
  dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
  dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
  dapui.close()
end
