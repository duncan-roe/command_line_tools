# Puts the list of glob patterns for sfl into the environment
#
# Dot this file to make sfl and associated commands search files matching one
# of the glob patterns below. Or, use this file as a template for your own list.
#
# $INAME will expand to -iname for GNU find or -name for others
#
# To make this file the installation default, place a copy of it in
# /etc/profile.d, and make it executable (chmod a+x sfl_glob_patterns_long.sh).
#
SFL_GLOB_PATTERNS='\(
 $INAME "makefile"
 -o -name "*.S"
 -o -name "*.SlackBuild"
 -o -name "*.c"
 -o -name "*.cc"
 -o -name "*.cpp"
 -o -name "*.cxx"
 -o -name "*.exp"
 -o -name "*.expect"
 -o -name "*.f"
 -o -name "*.for"
 -o -name "*.h"
 -o -name "*.hh"
 -o -name "*.i"
 -o -name "*.java"
 -o -name "*.l"
 -o -name "*.lex"
 -o -name "*.pl"
 -o -name "*.pri"
 -o -name "*.prl"
 -o -name "*.py"
 -o -name "*.sh"
 -o -name "*.tcl"
 -o -name "*.vala"
 -o -name "*.y"
 -o -name "*.yacc"
 -o -name "Kconfig"
 \)'

# Get rid of newline characters
SFL_GLOB_PATTERNS="$(echo $SFL_GLOB_PATTERNS)"

export SFL_GLOB_PATTERNS
