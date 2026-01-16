# 💤 LazyVim

- config for LazyVim pegged to the version installed on Desktop (Win11)
- contains specific lazy-lock.json file and additions to the config to fix specific versions of LazyVim and lazy.nvim
- Need to ensure that nvim-treesitter commit version does not change from the defined version in the lazy-lock.json file
- best to `chmod 400 lazy-lock.json` when copying config files over for install
- may need to delete cached versions of plug-ins to ensure that only the correct (historic) commit versions are installed:
  - `rm -rf ~/.local/share/LazyVim/lazy`
  - `rm -rf ~/.local/state/LazyVim`
  - `rm -rf ~/.cache/nvim`

- within LazyVim, may also need to run `:Lazy restore` and `:Lazy sync`
