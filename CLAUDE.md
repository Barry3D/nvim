# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

Personal Neovim configuration with remappings for the [Engram keyboard layout](https://engram.dev/). Uses lazy.nvim as the plugin manager.

## Architecture

### Entry Point & Loading Order

`init.lua` loads modules in this order:
1. `lua/keymaps.lua` — leader key, Engram remappings, LSP/diagnostic bindings
2. `lua/config.lua` — vim options
3. `lua/lazyvim.lua` — bootstraps lazy.nvim and imports all `lua/plugins/*.lua`
4. Manual `mini.cursorword` and `esqueleto` setup (workaround; see TODO in init.lua)

### Keyboard Layout Abstraction

`lua/layout.lua` is a single return table mapping logical directions to physical keys. The active layout is **Engram**: `hjkl` → `shtn`, `n` → `k`, etc. Keymaps in `keymaps.lua` and plugin configs consume `require("layout")` to stay layout-agnostic. To switch back to QWERTY, swap which block is active in `layout.lua`.

### Plugin Structure

Each file in `lua/plugins/` returns a lazy.nvim plugin spec (or a list of specs). Plugins are lazy-loaded by default via `event`, `cmd`, or `keys` triggers. Notable conventions:
- Mason plugins pinned to `^1.0.0` due to Ubuntu's older Neovim version (update comment in `lsp.lua` when nvim ≥ 0.11 is available)
- `lsp.lua` configures mason, mason-lspconfig, and all individual LSP servers in one file

### Formatter Configuration

`lua/plugins/formatting.lua` (conform.nvim) — formatters by filetype:
- JS/TS/Vue/CSS/HTML/JSON/YAML → `prettierd`
- PHP → `php_cs_fixer` (auto-detects config at `app/.php-cs-fixer.php` or `.php-cs-fixer.php`)
- Python → `black`
- Twig files are intentionally skipped

Format keybinding: `<leader>c`

### Auto-save Behavior

`lua/plugins/autosave.lua` triggers `idev .` (an external tool) on every save via `vim.uv.spawn`. This is an external dependency — `idev` must be available in `$PATH` for the callback to work (failures are silently ignored).

### File Templates

`skeletons/` contains templates for PHP, Vue, Python, and YAML. Loaded automatically by `esqueleto.nvim` when a new file matching those extensions is created.

## Key Bindings Reference

All movement bindings go through `layout.lua`. With the current Engram layout:

| Action | Key (Engram) |
|--------|-------------|
| Left/Down/Up/Right | `s`/`h`/`t`/`n` |
| Window navigation | `<C-s>/<C-h>/<C-t>/<C-n>` |
| Next search result | `k` |
| Substitute (plugin) | `j` |
| Leap forward/back | `l`/`L` |
| LSP hover | `T` |
| LSP code action | `<C-a>` |
| Go to definition | `gd` |
| Go to declaration | `gD` |
| Rename | `rn` |
| References | `gr` |
| Format | `<leader>c` |
| File browser | `<leader>.` |
| Find files | `<leader>f` |
| Grep | `<leader>sf` |
| System clipboard yank/paste | `<leader>y/Y/p/P` |
| Close all buffers except current | `<C-b>` |
| Diagnostic float | `<leader>do` |

## Adding a New Plugin

1. Create `lua/plugins/<name>.lua` returning a valid lazy.nvim spec.
2. lazy.nvim auto-discovers all files in `lua/plugins/` — no manual registration needed.
3. If the plugin needs layout-aware keys, import `require("layout")` and use the layout table.

## LSP Servers (auto-installed via Mason)

`lua_ls`, `volar`, `intelephense` (PHP 8.2), `ts_ls` (with Vue plugin), `psalm`, `twiggy`, `typos_lsp`, `html`, `cssls`, `eslint`, `bashls`, `pyright` (strict mode), `sourcekit` (Swift)
