#!/usr/bin/expect

set PW [lindex $argv 0]
set Prompt "\[#$%>\]"

set timeout 86400

spawn ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
expect {
    "Press RETURN to continue or any other key to abort" {
        send "\n"
    }
    "Password:" {
        send "${PW}\n"
    }
}
expect {
    "\\\$" {
      exit 0
    }
}
