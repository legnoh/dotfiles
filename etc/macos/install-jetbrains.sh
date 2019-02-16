#!/usr/bin/expect

set PW [lindex $argv 0]
set Prompt "\[#$%>\]"
set timeout 100000000

spawn brew bundle --file=~/code/src/github.com/legnoh/dotfiles/pkg/Brewfile.jetbrains
expect {
    "Password:" {
        send "${PW}\n"
        exp_continue
    }
}