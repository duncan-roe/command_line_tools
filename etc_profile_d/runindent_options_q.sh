# Puts a list of indent options for runindent into the environment
#
# Dot this file to make runindent format in the style of the C sources in
# command_line_tools and also the sibling q editor repository
#
# To make this file the installation default, symlink to it from
# /etc/profile.d, or copy it there.
#
RUNINDENT_OPTIONS="
-nbad
-nbap
-nbbo
-nbc
-nbfda
-nbfde
-bl
-bls
-bli0
-c36
-cbi0
-cd36
-ncdw
-nce
-ci2
-cli2
-cp36
-ncs
-d0
-nfc1
-nfca
-hnl
-i2
-ip0
-l80
-lc80
-nlp
-npcs
-pi0
-nprs
-psl
-saf
-sai
-saw
-sbi0
-nsob
-nut
-lps
"

# Get rid of newline characters
RUNINDENT_OPTIONS="$(echo $RUNINDENT_OPTIONS)"

export RUNINDENT_OPTIONS
