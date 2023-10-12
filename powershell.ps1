#Prompt
macchina
Import-Module posh-git
Import-Module Terminal-Icons
# import-module C:\Users\User\WorkProjects\Terminal-Icons\Output\Terminal-Icons\0.11.0\Terminal-Icons.psd1
# Import-module oh-my-posh
# Set-PoshPrompt -Theme  ~/.config/ohmyposh/latest.json

# edit $PROFILE
function Invoke-Starship-PreCommand {
  $host.ui.Write("`e]0; PS> Kuon`a")
}

# starship
function Invoke-Starship-TransientFunction {
  &starship module character
}
 Invoke-Expression (&starship init powershell)
 Enable-TransientPrompt
 $ENV:STARSHIP_CONFIG = "$HOME\.config\starship.toml"

#Aliases
Set-Alias vi nvim
Set-Alias g git
Set-Alias lg lazygit
Set-Alias grep findstr

function lsLinux {ls | Format-Wide -Column 5}

function gs { git status }
function gaa { git add .}
function gpl { git pull }
function gph { git push }

function pam { php artisan migrate }
function pas { php artisan serve }

function lint { npx lint-staged }

Set-Alias fz fzSearch
Set-Alias lls lsLinux
Set-Alias lll lsLinux
# PSReadLine
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineKeyHandler -Chord 'Ctrl+d' -Function DeleteChar

# Shows navigable menu of all options when hitting Tab
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete

# Autocompletion for arrow keys
Set-PSReadlineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadlineKeyHandler -Key DownArrow -Function HistorySearchForward
# Fzf
Import-Module PSFzf
Set-PsFzfOption -PSReadlineChordProvider 'ctrl+f' -PSReadlineChordReverseHistory 'ctrl+r'
function fzs {rg --files --hidden --follow --no-ignore-vcs -g "!{node_modules,.git}" | fzf --height 40% --layout reverse --info inline --border}

function nri {
  $currentDir = Get-Location
  $pnpmLockPath = Join-Path -Path $currentDir -ChildPath 'pnpm-lock.yaml'
  $yarnLockPath = Join-Path -Path $currentDir -ChildPath 'yarn.lock'
  $packageJsonPath = Join-Path -Path $currentDir -ChildPath 'package.json'

  if (Test-Path -Path $pnpmLockPath) {
    pnpm install
  }
  elseif (Test-Path -Path $yarnLockPath) {
    yarn add
  }
  elseif (Test-Path -Path $packageJsonPath) {
    npm install
  }
  else {
      Write-Host "No package.json found. Unable to run"
  }
}

function nrd {
  $currentDir = Get-Location
  $pnpmLockPath = Join-Path -Path $currentDir -ChildPath 'pnpm-lock.yaml'
  $yarnLockPath = Join-Path -Path $currentDir -ChildPath 'yarn.lock'
  $packageJsonPath = Join-Path -Path $currentDir -ChildPath 'package.json'

  if (Test-Path -Path $pnpmLockPath) {
    pnpm run dev
  }
  elseif (Test-Path -Path $yarnLockPath) {
    yarn run dev
  }
  elseif (Test-Path -Path $packageJsonPath) {
    npm run dev
  }
  else {
      Write-Host "No package.json found. Unable to run"
  }
}
