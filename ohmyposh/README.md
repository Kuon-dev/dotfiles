# Info
### version1.json
- A copy of anotrher theme with minimal configurations

### version2.json
- Has no Git status
- Faster

### latest.json
- My current theme

# Installation
This section will cover installation part of my personal ohmyposh theme. It will assume that you have already have prior experience to basic folder and file structure knowledge

## prerequisites

Make sure you have these programs installed
- Neovim
- Powershell (not windows Powershell)
- OhMyPosh

If you don't have any of these apps, please Google them and install it on your own.

Set a powershell userprofile

```sh
nvim .config/powershell/<your file name>.ps1
```

Your file location should be on `user/.config/powershell/`

inside the user profile, add these line

```powershell
Import-Module posh-git
Import-Module Terminal-Icons
Import-module oh-my-posh
Set-PoshPrompt -Theme  ~/.config/<your file name>.json
```

Make sure you put the file in `.config` folder. 


> Note:
> If you do not possess the knowledge of exiting on neovim, here are some details.
>
> `:w` - save, no exit
> `:e` - reset changes, no exit
> `:q` - exit (type `:q!` to exit without save
> 
> Make sure you are in `COMMAND MODE` before typing these commands. If you don't know whether you are in `command mode`, press `<ESC>` key then type the commands


Afterwards, run this command to set your powershell script to automatically boot on start.

```sh
nvim $PROFILE.CurrentUserCurrentHost
```

In the file, add this line

```Powershell
$env:USERPROFILE\.config\powershell\<your file name>.ps1
```

Afterwards, restart your powershell then you should be able to see the theme.
