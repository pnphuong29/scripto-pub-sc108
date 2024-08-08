# Aliases - Vi commands
alias visshknowhosts="vi \${HOME}/.ssh/known_hosts"
alias visshconfig="vi \${HOME}/.ssh/config"
alias visshauthorizedkeys="vi \${HOME}/.ssh/authorized_keys"

alias vibashrc="vi \${HOME}/.bashrc"
alias vibashprofile="vi \${HOME}/.bash_profile"
alias viprofile="vi \${HOME}/.profile"

alias viscmaster='vi -p \
    "${HOME}/scripto/ap_master.sh" \
    "${HOME}/scripto-share/ap_master.sh" \
    "${HOME}/scripto-common/ap_master.sh" \
    "${HOME}/scripto-main/ap_master.sh" \
    \
'

alias vichromebm="vi \${AP_CHROME_BOOKMARK_FILE_PATH}"

alias visc35='vibulk "${AP_PRJ_SC35_DIR}"'
alias vitmp='vi "${AP_TMP_DIR}/tmp.txt"'
alias vipackagejson="vi package.json"
alias vipipfile="vi Pipfile"
alias virequirements="vi requirements.txt"
alias virequirementsdev="vi requirements-dev.txt"
alias vienv="vi .env"
alias vitsconfig='vi tsconfig.json'
alias vitsconfigbase='vi tsconfig.base.json'
