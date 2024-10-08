# Aliases - Copy commands
if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
    alias apcopy='pbcopy'
    alias apopen='open'
elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
    alias apcopy='xclip -selection clipboard'
    alias apopen='xdg-open'
fi

alias cpd='pwd | tr -d "\n" | apcopy'

# Aliases - List commands
alias lspaths='echo "${PATH}" | tr ":" "\n"'
alias lsaliases='alias | gsed "s@alias @@" | grep "^[@|1|2]" | sort'
alias lsaliasesfzf='alias | gsed "s@alias @@" | grep "^[@|1|2|3]" | sort | fzf'
alias lsusers="type getent &>/dev/null && getent passwd || cat /etc/passwd"
alias lsgroups="type getent &>/dev/null && getent group || cat /etc/groups"
alias lservices='sudo launchctl list'
alias lservicesgrep='sudo launchctl list | grep'

# Aliases - Show commands
alias showdt='gdate +"%Y%m%d_%H%M%S"'
alias showcpuinfo="sudo cat /proc/cpuinfo"
alias showcronlogs='sudo cat /var/log/cron.log'

# Aliases - Set commands
alias settzvn='sudo timedatectl --no-pager set-timezone Asia/Ho_Chi_Minh'

# Aliases - Other commands
alias root='sudo su'
alias grep='grep --color'
alias du1="du -h --max-depth=1"
alias chownuser="sudo chown -R ${USER}.${USER}" # DO NOT use \$USER, because it will be equal to ROOT user
alias psgrep='ps -ef | grep'
alias sssysctl="sudo systemctl status"
alias rrsysctl="sudo systemctl restart"
