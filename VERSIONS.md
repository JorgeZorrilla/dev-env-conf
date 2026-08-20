# Version policy

This repository intentionally separates **compatibility constraints** from the exact plugin lock.

- Neovim: `>= 0.12.0` (required by current nvim-lspconfig)
- blink.cmp: `1.*`
- lazy.nvim: stable branch
- Other plugins: resolved by lazy.nvim and frozen to exact Git commits in `nvim/lazy-lock.json`

## Freezing exact plugin versions

On the first machine:

```bash
nvim
```

Let lazy.nvim finish installing, then commit:

```bash
git add nvim/lazy-lock.json
git commit -m "Lock Neovim plugins"
```

On every other machine, lazy.nvim will use that lockfile to reproduce those exact plugin commits.

This is preferable to hardcoding stale tags for plugins that publish irregularly.
