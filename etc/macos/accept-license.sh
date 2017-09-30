#!/usr/bin/expect

set PW [lindex $argv 0]
set Prompt "\[#$%>\]"

set timeout 100000000

spawn sudo xcodebuild -license accept
expect {
    "Password:" {
        send "${PW}\n"
    }
}
