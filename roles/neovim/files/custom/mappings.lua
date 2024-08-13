local M = {}

-- In order to disable a default keymap, use
M.disabled = {
  i = {
    -- Disable these as the tmux navigator plugin controls them
    ["<C-h>"] = "",
    ["<C-l>"] = "",
    ["<C-j>"] = "",
    ["<C-k>"] = "",
  },
  n = {
    -- Disable these as the tmux navigator plugin controls them
    ["<C-h>"] = "",
    ["<C-l>"] = "",
    ["<C-j>"] = "",
    ["<C-k>"] = "",
  },
}

-- Telescope custom mappings
M.telescope = {
  n = {
    -- Add follow=true to ff command to follow symbolic links. It's better than
    -- <leader>fa which also looks at hidden files
    ["<leader>ff"] = { "<cmd> Telescope find_files follow=true <CR>", "Find files" },
  }
}

-- Your custom mappings
M.custom = {
  v = {
    -- Yank to clipboard in visual mode
    ["<leader>y"] = { '"+y', "Yank to clipboard" },
  },
  n = {
    -- Yank to clipboard in normal mode
    ["<leader>y"] = { '"+y', "Yank to clipboard" },
    -- Paste from clipboard in normal mode
    ["<leader>p"] = { '"+p', "Paste from clipboard" },
    ["<leader>P"] = { '"+P', "Paste from clipboard but line above" },
  },
}

M.tabufline = {
  n = {
    ["<leader>X"] = {
      function()
        require("nvchad.tabufline").closeAllBufs()
      end,
      "Close ALL buffers",
    },
  },
}


-- Key bindings for debugging
M.debugger = {
  n = {
    ["<F5>"] = {
      function()
        require("dapui") -- Trigger lazy load
        require("dap").continue()
      end,
      "Debug: Run/Continue"
    },
    ["<F10>"] = {
      function() require("dap").step_over() end,
      "Debug: Step Over"
    },
    ["<F11>"] = {
      function() require("dap").step_into() end,
      "Debug: Step Into"
    },
    ["<F12>"] = {
      function() require("dap").step_out() end,
      "Debug: Step Out ('End')"
    },
    ["<leader>db"] = {
      function() require("dap").toggle_breakpoint() end,
      "Debug: Toggle Breakpoint"
    },
    ["<leader>dx"] = {
      function() require("dap").repl.open() end,
      "Debug: Open REPL"
    },
    ["<leader>dO"] = {
      function() require("dapui").toggle() end,
      "Toggle DAP UI Explicitly"
    },
  },
}

-- C# / Omnisharp
-- See https://github.com/Hoffs/omnisharp-extended-lsp.nvim
M.omnisharp = {
  n = {
    ["gd"] = {
      function() require('omnisharp_extended').lsp_definition() end,
      "Omnisharp: Go to definition",
    },
    ["<leader>D"] = {
      function() require('omnisharp_extended').lsp_type_definition() end,
      "Omnisharp: Go to type definition",
    },
    ["gr"] = {
      function() require('omnisharp_extended').lsp_references() end,
      "Omnisharp: Go to references",
    },
    ["gi"] = {
      function() require('omnisharp_extended').lsp_implementation() end,
      "Omnisharp: Go to implementation",
    },
  },
}

return M
