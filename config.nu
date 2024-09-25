# Default aliases
alias ll = ls -l
alias vi = nvim
alias g = git

# Git commands 
def gs [] { git status }
def gaa [] { git add . }
def lg [] { lazygit }

# source config files
source ~/.zoxide.nu
use ~/.cache/starship/init.nu

# FZF file lookup and open in nvim
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

# Detect package json and then run npm / pnpm 
def detect_package_manager [] {
    if (ls | where name == "pnpm-lock.yaml" | is-empty) == false {
        "pnpm"
    } else if (ls | where name == "package-lock.json" | is-empty) == false {
        "npm"
    } else if (ls | where name == "package.json" | is-empty) == false {
        "npm"  # Default to npm if only package.json is found
    } else {
        null
    }
}

def run_command [cmd: string, args: string] {
    let package_manager = (detect_package_manager)
    
    if $package_manager == null {
        error make {msg: "No package.json found. Are you in the correct directory?"}
    }
    
    let full_command = $"($package_manager) ($cmd) ($args)"
    print $"Running: ($full_command)"
    nu -c $full_command
}

def nrd [] { run_command "run" "dev" }
def nrs [] { run_command "run" "start" }
def ni [args = ""] { run_command "install" $args }
