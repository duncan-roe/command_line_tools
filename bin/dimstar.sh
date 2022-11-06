#!/bin/sh
# \
export dimstar=$(basename $0 .sh); \
export localnet=$(cat /etc/HOSTNAME|cut -d. -f2-); \
exec expect -f "$0" -- "$@"

log_user 1
#exp_internal 1
spawn ssh $env(dimstar)
expect {$ }
exp_send "xauth\r"
expect "xauth> "
exp_send "list\r"
expect -re "$env(dimstar).$env(localnet):0(\[^\r\]*)\r"
set i $expect_out(1,string)
expect "xauth> "
exp_send "q\r"
expect {$ }
exp_send "exit\r"
expect "closed."
wait
spawn sh
expect {$ }
exp_send "xauth\r"
expect "xauth> "
exp_send "remove $env(dimstar).$env(localnet):0\r"
expect "xauth> "
exp_send " add $env(dimstar).$env(localnet):0$i\r"
expect "xauth> "
exp_send "exit\r"
expect {$ }
exp_send "dxt 88x98+0+0 -display $env(dimstar).$env(localnet):0\r"
expect {$ }
puts ""
exit
