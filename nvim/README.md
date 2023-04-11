# Nvim setup

First of all, NvChad installation is mandatory as this entire nvim setup is based off NvChad

Here's a quick installation of NvChad
```bash
git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1 && nvim
```

After that, copy `custom/` and paste it under `nvim/lua`, the `ftplugin/` folder will be placed at `nvim/ftplugin`. 

Remember to run `:PackerSync` to install the plugins.

### LSP
For the LSP, there are some installation are slightly different than other LSP. For example, clang and lua-language-server is not installed through `Mason`,
it is installed with `Scoop`

```bash
scoop install clangd lua-language-server
```
