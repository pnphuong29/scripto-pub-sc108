# Aliases - Net commands
alias lsportlistening4='sudo netstat -lntup --listening -4'
alias lsportlistening='sudo netstat -lntup'

alias cpip='curl -Ss ifconfig.me | @copy; echo'
alias cpip6='ip a | grep inet6 | grep "scope global dynamic mngtmpaddr noprefixroute" | cut -d " " -f 6 | gsed "s@/64@@" | @copy'

alias showip='curl -Ss ifconfig.me; echo'
alias showip6='ip a | grep inet6 | grep "scope global dynamic mngtmpaddr noprefixroute" | cut -d " " -f 6 | gsed "s@/64@@"'