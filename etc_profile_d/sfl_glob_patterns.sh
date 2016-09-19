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
