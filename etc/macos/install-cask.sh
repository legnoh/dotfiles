#!/usr/bin/expect

set PW [lindex $argv 0]
set Prompt "\[#$%>\]"

set timeout 86400

spawn brew bundle --file=~/code/src/github.com/legnoh/dotfiles/pkg/Brewfile.cask
expect {
    "(yes/no)?" {
        send "yes\n"
        exp_continue
    }
    "password" {
        send "${PW}\n"
    }
}
