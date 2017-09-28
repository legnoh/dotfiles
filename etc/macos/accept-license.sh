#!/usr/bin/expect

set PW [lindex $argv 0]
set Prompt "\[#$%>\]"

set timeout 86400

spawn sudo xcodebuild -license accept
expect {
    "(yes/no)?" {
        send "yes\n"
        exp_continue
    }
    "Password:" {
        send "${PW}\n"
    }
}
