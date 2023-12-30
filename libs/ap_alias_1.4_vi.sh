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
