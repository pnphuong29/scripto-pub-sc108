# Logs
alias enablelogdebug='echo "Enable debug log"; export AP_LOGS_DEBUG_ENABLED=1'
alias disablelogdebug='echo "Disable debug log"; export AP_LOGS_DEBUG_ENABLED=0'
alias islogdebugenabled='echo "AP_LOGS_DEBUG_ENABLED=${AP_LOGS_DEBUG_ENABLED}"'

alias enableloggeneral='echo "Enable geneal log"; export AP_LOGS_GENERAL_ENABLED=1'
alias disableloggeneral='echo "Enable geneal log"; export AP_LOGS_GENERAL_ENABLED=0'
alias isloggeneralenabled='echo "AP_LOGS_GENERAL_ENABLED=${AP_LOGS_GENERAL_ENABLED}"'

# Cache
alias e='echo "Enable scripto cache"; printf "1" >"${AP_CONF_GENERATE_CACHE_FILE}"'
alias enablecache='echo "Enable scripto cache"; printf "1" >"${AP_CONF_GENERATE_CACHE_FILE}"'
alias d='echo "Disable scripto cache"; printf "0" >"${AP_CONF_GENERATE_CACHE_FILE}"'
alias disablecache='echo "Disable scripto cache"; printf "0" >"${AP_CONF_GENERATE_CACHE_FILE}"'
alias iscacheenabled="cat \${AP_CONF_GENERATE_CACHE_FILE};echo"
alias clearcache='rm -rf "${AP_CACHE_DIR}"/*'

# Copy commands
if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
    alias apcopy='pbcopy'
    alias apopen='open'
elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
    alias apcopy='xclip -selection clipboard'
    alias apopen='xdg-open'
fi

alias cpd='pwd | tr -d "\n" | apcopy'

# Show commands
alias showdt='gdate +"%Y%m%d_%H%M%S"'
alias showcpuinfo="sudo cat /proc/cpuinfo"
alias showcronlogs='sudo cat /var/log/cron.log'

# Set commands
alias settzvn='sudo timedatectl --no-pager set-timezone Asia/Ho_Chi_Minh'

# Other commands
alias root='sudo su'
alias grep='grep --color'
alias du1="du -h --max-depth=1"
alias chownuser="sudo chown -R ${USER}.${USER}" # DO NOT use \$USER, because it will be equal to ROOT user
alias psgrep='ps -ef | grep'
alias sssysctl="sudo systemctl status"
alias rrsysctl="sudo systemctl restart"
alias gensecretkey='python -c "import secrets; print(secrets.token_urlsafe(32))"'
alias cpsecretkey='python -c "import secrets; print(secrets.token_urlsafe(32))"  | tr -d "\n" | apcopy'
alias tcate='true >'
