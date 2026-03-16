# Puts a list of indent options for runindent into the environment
#
# Dot this file to make runindent format according to the Linux style
#
# To make this file the installation default, symlink to it from
# /etc/profile.d, or copy it there.
#
# (Blank lines are there to give the most concise output from the command
#  > diff -y -W25 runindent_options_q.sh runindent_options_kernel.sh
#  they make no difference to the value of RUNINDENT_OPTIONS).
#
RUNINDENT_OPTIONS="
-nbad
-bap
-bbo
-nbc



-br
-brs
-c33

-cd33
-ncdb
-ce
-ci4
-cli0
-cp33
-ncs
-d0
-di1
-nfc1
-nfca
-hnl
-i8
-il1
-ip0
-l80

-lp
-npcs
-nprs
-npsl
-saf
-sai
-saw
-nsc
-sob
-ss
-ts8
"

# Get rid of newline characters
RUNINDENT_OPTIONS="$(echo $RUNINDENT_OPTIONS)"

export RUNINDENT_OPTIONS
