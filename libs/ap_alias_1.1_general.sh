# Aliases - Copy commands
if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
    alias @copy='pbcopy'
elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
    alias @copy='xclip -selection clipboard'
fi

alias cpd='pwd | tr -d "\n" | @copy'

# Aliases - List commands
alias lspaths='echo "${PATH}" | tr ":" "\n"'
alias lsaliases='alias | gsed "s@alias @@" | grep "^[@|1|2]" | sort'
alias lsaliasesfzf='alias | gsed "s@alias @@" | grep "^[@|1|2|3]" | sort | fzf'
alias lsusers="cat /etc/passwd"
alias lsgroups="cat /etc/group"

# Aliases - Show commands
alias showdt='gdate +"%Y%m%d_%H%M%S"'
alias showcpuinfo="cat /proc/cpuinfo"

# Aliases - Set commands
alias settzvn='sudo timedatectl --no-pager set-timezone Asia/Ho_Chi_Minh'

# Aliases - Other commands
alias grep='grep --color'
alias du1="du -h --max-depth=1"
alias coveragereport="coverage report"
alias genrandstr="head /dev/urandom | tr -dc A-Za-z0-9 | head -c 32 ; echo ''"
alias chownuser="sudo chown -R ${USER}.${USER}" # DO NOT use \$USER, because it will be equal to ROOT user
