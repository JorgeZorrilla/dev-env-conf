# Neovim Dev Setup

Setup reproducible para desarrollo profesional terminal-first con:

- Neovim + lazy.nvim
- tmux + TPM + resurrect + continuum
- Zsh
- C/C++: clangd, clang-format, clang-tidy, CMake/Ninja/GDB
- Rust: rust-analyzer
- Python: basedpyright, ruff
- Ada: Ada Language Server (ALS)
- Markdown: render-markdown.nvim + Marksman
- Web: TypeScript/vtsls, ESLint, Tailwind, HTML/CSS/JSON
- Git: gitsigns + lazygit
- AI local/cloud: CodeCompanion (Ollama/OpenAI-compatible adapters configurable)
- Telescope, Treesitter, Aerial, Trouble, DAP, Conform, blink.cmp
- Keymaps alternables para teclado EN/ES

## Instalación rápida

```bash
git clone <tu-repo> ~/dotfiles
cd ~/dotfiles
./scripts/setup.sh
```

Luego abre:

```bash
nvim
```

Lazy instalará los plugins declarados en la configuración.

## Layout de teclado

Por defecto se usa `en`. Puedes cambiarlo de tres formas:

```bash
export NVIM_KEYBOARD_LAYOUT=es
nvim
```

O en `~/.zshrc`:

```bash
export NVIM_KEYBOARD_LAYOUT=es
```

O dentro de Neovim:

```vim
:KeyboardLayout es
:KeyboardLayout en
```

La capa de layout está en `nvim/lua/config/keyboard.lua`.

### Filosofía

Los comandos principales son deliberadamente iguales en ambos layouts siempre que sea práctico:

- `<leader>f...` búsqueda
- `<leader>c...` código/LSP
- `<leader>b...` build
- `<leader>t...` tests
- `<leader>d...` debug
- `<leader>g...` Git
- `<leader>a...` AI

En layout español se añaden aliases ergonómicos para teclas afectadas por la distribución y se evita depender de símbolos incómodos.

## Dependencias recomendadas

Ubuntu/Debian:

```bash
sudo apt install -y git curl unzip tar gzip build-essential cmake ninja-build gdb clang clangd clang-format clang-tidy ripgrep fd-find fzf tmux zsh python3 python3-venv
```

Herramientas adicionales recomendadas:

- `lazygit`
- `lazydocker`
- `zoxide`
- `direnv`
- `just`
- `bat`
- `delta`
- `ollama`

## C++

Genera compile commands:

```bash
cmake -S . -B build -G Ninja -DCMAKE_EXPORT_COMPILE_COMMANDS=ON
```

`clangd` descubrirá `build/compile_commands.json`.

## AI / Ollama

La configuración de CodeCompanion incluye un adapter Ollama de ejemplo. Arranca Ollama:

```bash
ollama serve
```

Y ajusta el modelo en `nvim/lua/plugins/ai.lua`.

## tmux

Prefix configurado a `Ctrl-a`.

Atajos útiles:

- `Ctrl-a c`: nueva window
- `Ctrl-a 1..9`: cambiar de window
- `Ctrl-a |`: split vertical
- `Ctrl-a -`: split horizontal
- `Ctrl-a z`: zoom pane
- `Ctrl-h/j/k/l`: navegación pane/Neovim transparente (requiere vim-tmux-navigator)

## Estructura

```text
nvim-dev-setup/
├── nvim/
│   ├── init.lua
│   └── lua/
│       ├── config/
│       │   ├── options.lua
│       │   ├── keymaps.lua
│       │   └── keyboard.lua
│       └── plugins/
│           ├── lsp.lua
│           ├── completion.lua
│           ├── telescope.lua
│           ├── treesitter.lua
│           ├── ui.lua
│           ├── git.lua
│           ├── format.lua
│           ├── debug.lua
│           ├── markdown.lua
│           └── ai.lua
├── tmux/tmux.conf
├── zsh/.zshrc
└── scripts/setup.sh
```

## Versiones reproducibles

Tras el primer arranque, `lazy.nvim` genera `nvim/lazy-lock.json`. **Haz commit de ese archivo**: en el siguiente ordenador se restaurarán exactamente los mismos commits de plugins. Consulta `VERSIONS.md`.

## Persistencia tmux

Se incluyen TPM, tmux-resurrect y tmux-continuum. Tras instalar TPM (`Ctrl-a` + `I`), continuum guarda periódicamente el layout y resurrect permite reconstruir sesiones tras un reboot.
