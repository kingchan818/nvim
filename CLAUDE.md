# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a Neovim configuration based on **NvChad v2.5**. NvChad itself is loaded as a lazy.nvim plugin — this repo only contains the user's customization layer on top of it. The user is a Neovim beginner.

## Architecture

**Entry point**: `init.lua` bootstraps lazy.nvim, sets `<Space>` as leader key, loads the theme cache, then requires `options`, `autocmds`, and (deferred) `mappings`.

**Load order**:
1. `init.lua` → bootstraps lazy.nvim, loads `configs/lazy.lua`
2. lazy.nvim loads NvChad (v2.5 branch) as a plugin + user plugins from `lua/plugins/init.lua`
3. Theme cache applied from `vim.g.base46_cache`
4. `lua/options.lua` → imports `nvchad.options`, then adds custom vim options
5. `lua/autocmds.lua` → imports `nvchad.autocmds`
6. `lua/mappings.lua` → imports `nvchad.mappings`, then adds custom keymaps

**Key files**:
- `lua/chadrc.lua` — NvChad UI/theme config (currently: `onedark` theme)
- `lua/plugins/init.lua` — all plugin specs for lazy.nvim (add new plugins here)
- `lua/configs/lspconfig.lua` — LSP server setup (currently: `html`, `cssls`)
- `lua/configs/conform.lua` — formatter config (currently: `stylua` for Lua)
- `lua/configs/lazy.lua` — lazy.nvim bootstrap settings, disables built-in vim plugins for performance

**Pattern**: each `lua/configs/*.lua` file configures a specific plugin. Plugin specs in `lua/plugins/init.lua` reference these configs via `opts` or by requiring them in a `config` function.

## Current Setup

- **Plugin manager**: lazy.nvim (auto-bootstrapped)
- **LSP servers**: `html`, `cssls` (via nvim-lspconfig + mason.nvim)
- **Formatter**: stylua for Lua files (via conform.nvim; format-on-save is disabled)
- **Completion**: nvim-cmp with LuaSnip snippets (from NvChad defaults)
- **File explorer**: nvim-tree (`<leader>e`)
- **Fuzzy finder**: telescope.nvim (`<leader>ff` for files, `<leader>fw` for grep)
- **Custom keymaps**: `;` → `:` (normal mode), `jk` → `<ESC>` (insert mode)

## Lua Style

Follows `.stylua.toml`: 120 column width, 2-space indentation, double quotes, no call parentheses. Run `stylua` to format.

## How to Add Things

- **New plugin**: add a spec table to `lua/plugins/init.lua`
- **New LSP server**: add the server name to the list in `lua/configs/lspconfig.lua` and call `vim.lsp.enable()`
- **New formatter**: add to the `formatters_by_ft` table in `lua/configs/conform.lua`
- **New keybinding**: add to `lua/mappings.lua` using `vim.keymap.set()` or the `map` helper
- **Change theme**: edit the `theme` field in `lua/chadrc.lua`

## Important NvChad Notes

- NvChad modules (`nvchad.options`, `nvchad.mappings`, etc.) provide sensible defaults — custom files extend them, not replace them
- `:Lazy` opens the plugin manager UI; `:Mason` opens the LSP/tool installer
- NvChad keybinding cheatsheet: `<leader>ch`
- Theme switcher: `<leader>th`
