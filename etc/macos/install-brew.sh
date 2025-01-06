#!/usr/bin/expect

set PW [lindex $argv 0]
set BREWFILE [lindex $argv 1]
set Prompt "\[#$%>\]"
set timeout 100000000

spawn brew bundle --force --file=~/code/src/github.com/legnoh/dotfiles/pkg/${BREWFILE}
expect {
    "Password:" {
        send "${PW}\n"
        exp_continue
    }
}
