#!/usr/bin/expect

set PW [lindex $argv 0]
set Prompt "\[#$%>\]"

set timeout 86400

spawn mas install 497799835
expect {
    "(yes/no)?" {
        send "yes\n"
        exp_continue
    }
    "Password:" {
        send "${PW}\n"
    }
}