#!/bin/sh
# \
exec expect -f "$0" -- "$@"

#log_user 0
spawn xauth
expect "xauth> "
exp_send "list\r"
expect -re "dimstar.local.net:0(\[^\r\]*)\r"
set i $expect_out(1,string)
expect "xauth> "
exp_send "q\r"
wait
spawn rsh darkstar
expect {$ }
exp_send "xauth\r"
expect "xauth> "
exp_send "remove dimstar.local.net:0\r"
expect "xauth> "
exp_send " add dimstar.local.net:0$i\r"
expect "xauth> "
exp_send "exit\r"
expect {$ }
exp_send "xt - -bg yellow\r"
expect {$ }
exp_send "exit\r"
expect "closed."
exit
