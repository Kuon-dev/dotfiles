# Nvim setup

First of all, NvChad installation is mandatory as this entire nvim setup is based off NvChad.

Here's a quick installation of NvChad
```bash
git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1 && nvim
```

After that, copy `custom/` and paste it under `nvim/lua`, the `ftplugin/` folder will be placed at `nvim/ftplugin`. 

For NvChad 1.0, you have to run `:PackerSync` to install the plugins. For NvChad 2.0, you just start your nvim and it will auto install your plugins.

## Features
- All NvChad 2.0 features
- Tabnine autocomplete
- Vue / ESlint setup
- Nvim NavBuddy for easy navigation
- Nvim ufo for better folds
- LSP configs for Java

This setup is windows focused setup.

### LSP
The defualt LSP installation is focused on Mason. Type `:Mason` and search for the LSP you want to install.
Note that if you install Powershell from Microsoft Store, you may face some errors. If you do face errors, you
have to install powershell from their official Github page.
