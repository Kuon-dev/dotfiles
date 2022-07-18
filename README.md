# dotfiles
Here are the files that I used to setup my coding environment

## setup
---
### Initial Installation

#### For Windows: 
To setup nvim, first clone this project, then go to `user/appdata/local`, then paste the `nvim` folder into the `local` directory. 
The path should be something like `user/appdata/local/nvim`

#### For Linux
Go to home `~/`, clone this project, then move `nvim` folder to `~/.config`.

Either use GUI to move the file or use this command line
```
cd dotfiles
touch nvim
mv nvim ~/.config/
```
make sure you are in `.config` folder upon executing the commands above.

### Nvim config setup
in the `nvim` folder, type `nvim` will start off the project with errors. So you will have to type `:PlugInstall`. If you do not have vim plug installed, refer the installation on here https://github.com/junegunn/vim-plug . After installation remember to enter vim by typing `nvim`, then type `:PlugInstall`.

For Linux, additional steps will be required by saving all the files into UNIX ending. The method I used is by saving each file through opening vim then type `:w ++ff=unix`. 
