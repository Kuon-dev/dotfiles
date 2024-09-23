alias ll = ls -l
alias vi = nvim
alias g = git

def gs [] { git status }
def gaa [] { git add . }
def lg [] { lazygit }

source ~/.zoxide.nu
use ~/.cache/starship/init.nu

def create_lf_command [] {
    let preview_cmd = "bat --theme='Catppuccin Mocha' --color=always --style=header,grid --line-range :400 {}"
    
    let files = (run-external "rg" 
                    "--files" 
                    "--hidden" 
                    "--follow"
                    "--no-ignore"
                    "--glob" "!.git"
                    "--glob" "!node_modules"
                    "--glob" "!dist"
                    "--glob" "!build")
    
    let fzf_args = [
        "--preview", $preview_cmd,
        "--bind", "ctrl-/:toggle-preview",
        "--preview-window", "right:60%:wrap"
    ]
    
    let selected_file = (echo $files | run-external "fzf" ...$fzf_args | str trim)
    if ($selected_file | is-empty) {
        return
    }
    run-external "nvim" $selected_file
}

alias lf = create_lf_command
