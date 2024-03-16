# Aliases - Net commands
alias lsportlistening4='sudo netstat -lntupe --listening -4'
alias lsportlistening='sudo netstat -lntupe'

alias cpip='curl -4Ss ifconfig.me | apcopy; echo'
alias cpip6='ip a | grep inet6 | grep "scope global dynamic mngtmpaddr noprefixroute" | cut -d " " -f 6 | gsed "s@/64@@" | apcopy'

alias showip='curl -4Ss ifconfig.me; echo'
alias showip6='ip a | grep inet6 | grep "scope global dynamic mngtmpaddr noprefixroute" | cut -d " " -f 6 | gsed "s@/64@@"'
