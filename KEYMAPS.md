# Keymaps

`<leader>` = Space.

## Common EN + ES

| Action | Key |
|---|---|
| Definition | `gd` |
| Declaration | `gD` |
| References | `gr` |
| Hover docs/type | `K` |
| Rename symbol | `<leader>cr` |
| Code action | `<leader>ca` |
| Format | `<leader>cf` |
| Find file | `<leader>ff` |
| Grep project | `<leader>fg` |
| Buffers | `<leader>fb` |
| Document symbols | `<leader>fs` |
| Outline | `<leader>o` |
| Diagnostics | `<leader>xx` |
| LazyGit | `<leader>gg` |
| Git next/prev hunk | `]h` / `[h` |
| Stage/reset hunk | `<leader>gs` / `<leader>gr` |
| Debug breakpoint | `<leader>db` |
| Debug continue | `<leader>dc` |
| Step into/over | `<leader>di` / `<leader>do` |
| AI chat | `<leader>aa` |
| AI explain/refactor | `<leader>ae` / `<leader>ar` |

## Spanish layout mode

Set:

```bash
export NVIM_KEYBOARD_LAYOUT=es
```

The main leader mappings deliberately use letters, so they remain stable on both physical layouts. The ES profile adds aliases for punctuation-heavy Vim commands and is isolated in `lua/config/keyboard.lua`, so you can customize it without touching plugin configuration.

Use inside Neovim:

```vim
:KeyboardLayout es
:KeyboardLayout en
```
