def append_line [file_path: string, new_line: string] {
    # Check if the file exists
    if ($file_path | path exists) {
        # Append the new line to the file
        $new_line | ansi strip | save --append $file_path
        print $"Successfully appended '$new_line' to ($file_path)"
    } else {
        # If the file doesn't exist, create it with the new line
        $new_line | ansi strip | save $file_path
        print $"Created file ($file_path) with content: '$new_line'"
    }
}

append_line ~/Library/Application Support/nushell/config.nu "\nsource ~/.config/nushell/config.nu"

def copy_config_file [source: string, destination: string] {
    if ($source | path exists) {
        cp $source $destination
        print $"Copied ($source) to ($destination)"
    } else {
        print $"Error: Source file ($source) does not exist."
    }
}

def main [] {
    # Define source and destination paths
    let config_source = "config.nu"
    let wezterm_source = "wezterm.lua"
    let starship_source = "starship.toml"

    let config_dest = $"($env.HOME)/.config/nushell/config.nu"
    let wezterm_dest = $"($env.HOME)/.wezterm.lua"
    let starship_dest = $"($env.HOME)/.config/starship.toml"

    # Create directories if they don't exist
    mkdir $"($env.HOME)/.config/nushell"
    mkdir $"($env.HOME)/.config"

    # Copy files
    copy_config_file $config_source $config_dest
    copy_config_file $wezterm_source $wezterm_dest
    copy_config_file $starship_source $starship_dest

    print "Configuration files have been copied to their respective locations."
}

# Run the main function
main
