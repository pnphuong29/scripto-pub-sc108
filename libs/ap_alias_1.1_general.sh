# CD - Common locations
alias @zdata="cd \${AP_SCRIPTO_DATA_DIR}"
alias @zsymlinks="cd \${AP_SYMLINKS_DIR}"
alias @zsoft="cd \${AP_SOFT_DIR}"
alias @zsoftbin="cd \${AP_SOFT_DIR}/bin"
alias @zconfigs="cd \${AP_CONFIGS_DIR}"
alias @zman="cd \${AP_MAN_DIR}"
alias @zcompletions="cd \${AP_COMPLETIONS_DIR}"
alias @ztmp="cd \${AP_TMP_DIR}"
alias @zlogs="cd \${AP_LOGS_DIR}"

# CD | Linux
alias @zlocalshare="cd \${HOME}/.local/share"
alias @zdesktopshortcuts="cd \${HOME}/.local/share/applications"
alias @zconfig="cd \${HOME}/.config"
alias @zautostart="cd \${HOME}/.config/autostart"
alias @zusersnap="cd \${HOME}/snap"
alias @zsnap="cd /snap"
alias @zsnapdesktopshortcuts="cd /var/lib/snapd/desktop/applications"

# Vi commands
alias @vi="vi"

# List commands
alias @lspaths='echo "${PATH}" | tr ":" "\n"'
alias @lsaliases='alias | gsed "s@alias @@" | grep "^[@|1|2]" | sort'
alias @lsaliasesfzf='alias | gsed "s@alias @@" | grep "^[@|1|2|3]" | sort | fzf'
alias @lsportlistening4='sudo netstat -lntup --listening -4'
alias @lsportlistening='sudo netstat -lntup'
alias @lsusers="cat /etc/passwd"
alias @lsgroups="cat /etc/group"

# Copy commands
if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
    alias @copy='pbcopy'
elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
    alias @copy='xclip -selection clipboard'
fi

alias @cpd='pwd | tr -d "\n" | @copy'
alias @cpip='curl -Ss ifconfig.me | @copy; echo'
alias @cpip6='ip a | grep inet6 | grep "scope global dynamic mngtmpaddr noprefixroute" | cut -d " " -f 6 | gsed "s@/64@@" | @copy'

# Show commands
alias @showip='curl -Ss ifconfig.me; echo'
alias @showdt='gdate +"%Y%m%d_%H%M%S"'
alias @showip6='ip a | grep inet6 | grep "scope global dynamic mngtmpaddr noprefixroute" | cut -d " " -f 6 | gsed "s@/64@@"'
alias @showcpuinfo="cat /proc/cpuinfo"

# Set commands
alias @settzvn='sudo timedatectl --no-pager set-timezone Asia/Ho_Chi_Minh'

# Other commands
alias @grep='grep --color'
alias @du1="du -h --max-depth=1"
alias @coveragereport="coverage report"
alias @genrandstr="head /dev/urandom | tr -dc A-Za-z0-9 | head -c 32 ; echo ''"
alias @chownuser="sudo chown -R ${USER}.${USER}" # DO NOT use \$USER, because it will be equal to ROOT user
