# Puts the list of glob patterns for sfl into the environment
#
# Dot this file to make sfl and associated commands run the same way as they
# did when sfl had a long list of glob patterns to search.
#
# $INAME will expand to -iname for GNU find or -name for others
#
# To make this file the installation default, place a copy of it in
# /etc/profile.d, and make it executable (chmod a+x sfl_glob_patterns.sh).
#
SFL_GLOB_PATTERNS='\(
 $INAME "makefile"
 -o -name "*.S"
 -o -name "*.c"
 -o -name "*.cc"
 -o -name "*.cpp"
 -o -name "*.cxx"
 -o -name "*.exp"
 -o -name "*.expect"
 -o -name "*.f"
 -o -name "*.for"
 -o -name "*.h"
 -o -name "*.i"
 -o -name "*.java"
 -o -name "*.l"
 -o -name "*.lex"
 -o -name "*.pl"
 -o -name "*.py"
 -o -name "*.sh"
 -o -name "*.tcl"
 -o -name "*.y"
 -o -name "*.yacc"
 -o -name "Kconfig"
 \)'

# Get rid of newline characters
SFL_GLOB_PATTERNS="$(echo $SFL_GLOB_PATTERNS)"

export SFL_GLOB_PATTERNS
