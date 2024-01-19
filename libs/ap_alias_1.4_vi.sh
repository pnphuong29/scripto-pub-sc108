# Aliases - Vi commands
alias visshknowhosts="vi \${HOME}/.ssh/known_hosts"
alias visshconfig="vi \${HOME}/.ssh/config"
alias visshauthorizedkeys="vi \${HOME}/.ssh/authorized_keys"

alias vibashrc="vi \${HOME}/.bashrc"
alias vibashprofile="vi \${HOME}/.bash_profile"
alias viprofile="vi \${HOME}/.profile"

alias viscmaster='vi "${HOME}/scripto-common/ap_master.sh"'
alias vismmaster='vi "${HOME}/scripto-main/ap_master.sh"'

alias vigitcommitfile="[ -f \${PWD}/\${AP_GIT_COMMIT_FILE} ] && vi \${PWD}/\${AP_GIT_COMMIT_FILE}"
alias vigitconfigs="vi -p \
	\${HOME}/.gitconfig \
	\${HOME}/.gitignore_global \
    "
alias vichromebm="vi \${AP_CHROME_BOOKMARK_FILE_PATH}"
alias vitmp='vi "${AP_TMP_DIR}/tmp.txt"'
