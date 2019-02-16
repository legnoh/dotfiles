#!/usr/bin/expect

set PW [lindex $argv 0]
set Prompt "\[#$%>\]"

spawn brew bundle --file=~/code/src/github.com/legnoh/dotfiles/pkg/Brewfile.private
expect Password: {
    send "${PW}\n"
    exp_continue
}
