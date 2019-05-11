# Puts a list of -T (typedef) indent options for runindent into the environment
#
# This file contains runindent's built-in defaults, so there is no need to dot
# it. Rather, this file is intended to be a template for one that you create.
#
# To make this file the installation default, symlink to it from
# /etc/profile.d, or copy it there.
#
RUNINDENT_TYPEDEFS='
-TFILE
-Tbool
-Tclock_t
-Tchainbase
-Tmacro5
-Tscrbuf5
-Tsiginfo_t
-Tsize_t
-Tuint16_t
-Tuint32_t
-Taction
-Tuint8_t
'

# Get rid of newline characters
RUNINDENT_TYPEDEFS="$(echo $RUNINDENT_TYPEDEFS)"

export RUNINDENT_TYPEDEFS
