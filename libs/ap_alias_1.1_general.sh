# Aliases - CD - Common locations
alias zsymlinks="cd \${AP_SYMLINKS_DIR}"
alias zsoft="cd \${AP_SOFT_DIR}"
alias zsoftbin="cd \${AP_SOFT_DIR}/bin"
alias zconfigs="cd \${AP_CONFIGS_DIR}"
alias zman="cd \${AP_MAN_DIR}"
alias zcompletions="cd \${AP_COMPLETIONS_DIR}"
alias ztmp="cd \${AP_TMP_DIR}"
alias zlogs="cd \${AP_LOGS_DIR}"
alias zprj="cd \${AP_PRJ_DIR}"

alias zsc="cd \${AP_SCRIPTO_COMMON_DIR}"
alias zs="cd \${AP_SCRIPTO_MAIN_DIR}"
alias zdata1="cd \${AP_DATA1_DIR}"
alias zdl="cd \${AP_DL_DIR}"

alias zgh="cd \${AP_GH_DIR}"
alias zgl="cd \${AP_GL_DIR}"
alias zglp29="cd \${AP_GL_P29_DIR}"
alias zghp29="cd \${AP_GH_P29_DIR}"

# Aliases - CD | Linux
alias zlocalshare="cd \${HOME}/.local/share"
alias zdesktopshortcuts="cd \${HOME}/.local/share/applications"
alias zconfig="cd \${HOME}/.config"
alias zautostart="cd \${HOME}/.config/autostart"
alias zusersnap="cd \${HOME}/snap"
alias zsnap="cd /snap"
alias zsnapdesktopshortcuts="cd /var/lib/snapd/desktop/applications"

# Aliases - Vi commands
alias visshknowhosts="vi \${HOME}/.ssh/known_hosts"
alias visshconfig="vi \${HOME}/.ssh/config"

alias vibashrc="vi \${HOME}/.bashrc"
alias vibashprofile="vi \${HOME}/.bash_profile"
alias viprofile="vi \${HOME}/.profile"

alias viscmaster='vi "${AP_SCRIPTO_COMMON_DIR}/ap_master.sh"'
alias vismaster='vi "${AP_SCRIPTO_MAIN_DIR}/ap_master.sh"'

alias vigitcommitfile="[ -f \${PWD}/\${AP_GIT_COMMIT_FILE} ] && vi \${PWD}/\${AP_GIT_COMMIT_FILE}"
alias vigitconfigs="vi -p \
	\${HOME}/.gitconfig \
	\${HOME}/.gitignore_global \
    "
alias vichromebm="vi \${AP_CHROME_BOOKMARK_FILE_PATH}"

# Aliases - List commands
alias lspaths='echo "${PATH}" | tr ":" "\n"'
alias lsaliases='alias | gsed "s@alias @@" | grep "^[@|1|2]" | sort'
alias lsaliasesfzf='alias | gsed "s@alias @@" | grep "^[@|1|2|3]" | sort | fzf'
alias lsusers="cat /etc/passwd"
alias lsgroups="cat /etc/group"

# Aliases - Copy commands
if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
    alias @copy='pbcopy'
elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
    alias @copy='xclip -selection clipboard'
fi

alias @cpd='pwd | tr -d "\n" | @copy'

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
