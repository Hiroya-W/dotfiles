# nvim-dap settings

https://github.com/mfussenegger/nvim-dap

## Lua

https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation#neovim-lua
https://github.com/jbyuki/one-small-step-for-vimkind

### Usage

上手く動かない...。

https://github.com/jbyuki/one-small-step-for-vimkind#quickstart

- Launch the server in the debuggee using `require"osv".launch()`
- Open another Neovim instance with the source file
- Place breakpoint
- Connect using the DAP client
- Run your script/plugin in the debuggee

Alternaltively you can:

- Open a lua file
- Place breakpoint
- Invoke `require"osv".run_this()`

See osv.txt for more detailed instructions.

## Go

https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation#go-using-delve-directly
https://github.com/leoluz/nvim-dap-go

### Install delve

https://github.com/go-delve/delve

```bash
go install github.com/go-delve/delve/cmd/dlv@latest
```

### Usage

https://github.com/leoluz/nvim-dap-go#usage

Use nvim-dap as usual

- Call `:lua require('dap').continue()` to start debugging.
- All pre-configured debuggers will be displayed for you to choose from.
- See `:help dap-mappings` and `:help dap-api.`

Debugging individual tests

To debug the closest method above the cursor use you can run:

- `:lua require('dap-go').debug_test()`
