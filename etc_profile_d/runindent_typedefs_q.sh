# Puts a list of -T (typedef) indent options for runindent into the environment
#
# This file contains runindent's built-in defaults, so there is no need to dot
# it. Rather, this file is intended to be a template for one that you create.
#
# To make this file the installation default, place a copy of it in
# /etc/profile.d, and make it executable (chmod a+x runindent_typedefs_q.sh).
#
RUNINDENT_TYPEDEFS='
-TFILE
-Tbool
-Tchainbase
-Tmacro5
-Tscrbuf5
-Tsiginfo_t
-Tsize_t
-Tuint32_t
'

# Get rid of newline characters
RUNINDENT_TYPEDEFS="$(echo $RUNINDENT_TYPEDEFS)"

export RUNINDENT_TYPEDEFS
