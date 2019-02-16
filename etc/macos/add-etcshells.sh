#!/usr/bin/expect

set PW [lindex $argv 0]
set Prompt "\[#$%>\]"

set timeout 100000000

spawn sudo sh -c 'echo "¥n/usr/local/bin/zsh" >> /etc/shells'
expect {
    "Password for" {
        send "${PW}\n"
    }
}
