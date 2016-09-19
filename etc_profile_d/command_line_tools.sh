# Appends command_line_tools/bin if not already in PATH

# Change the next line to suit your installation
newpath=/usr/local/command_line_tools/bin

if [ -d $newpath ]
then
  echo ":${PATH}:" | grep -q :${newpath}: ||
  {
    PATH="${PATH}:${newpath}"
    export PATH
  }
fi
unset newpath
