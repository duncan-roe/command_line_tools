# Appends command_line_tools/bin if not already in PATH

# Change the next line to suit your installation
newpath=/usr/local/command_line_tools/bin

. /etc/profile.d/path_functions_sh
append_path $newpath
unset_path_functions
unset newpath
