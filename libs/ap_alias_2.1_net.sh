# Net commands
if [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]]; then
    alias lsportlistening='sudo lsof -i -P | grep LISTEN | grep :$PORT'
else
    alias lsportlistening4='sudo netstat -lntupe --listening -4'
    alias lsportlistening='sudo netstat -lntupe'
fi

alias cpip='curl -4Ss ifconfig.me | apcopy; echo'
alias cpip6='ip a | grep inet6 | grep "scope global dynamic mngtmpaddr noprefixroute" | cut -d " " -f 6 | gsed "s@/64@@" | apcopy'

alias showip='curl -4Ss ifconfig.me; echo'
alias showip6='ip a | grep inet6 | grep "scope global dynamic mngtmpaddr noprefixroute" | cut -d " " -f 6 | gsed "s@/64@@"'
