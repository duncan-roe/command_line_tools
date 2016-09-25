# Puts a list of indent options for runindent into the environment
#
# Dot this file to make runindent format according to the style of the well-
# known book "The C Programming Language" by Kernighan & Ritchie
#
# To make this file the installation default, place a copy of it in
# /etc/profile.d, and make it executable (chmod a+x runindent_options_kr.sh).
#
RUNINDENT_OPTIONS='-kr'
export RUNINDENT_OPTIONS
