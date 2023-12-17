# Bash prompt
# https://www.cyberciti.biz/tips/howto-linux-unix-bash-shell-setup-prompt.html
# https://unix.stackexchange.com/questions/105958/terminal-prompt-not-wrapping-correctly
export PS1_OLD="${PS1}"
# export PS1="\[\e[95;49m\]\t \[\e[32;49m\]\w\[\e[m\]\$ "
export PS1="\[\e[95;49m\]\t \[\e[93;49m\]\u@\h \[\e[32;49m\]\W\[\e[m\]\$ "
export AP_VENDORS_COMMON_APPS_SETUP_DIR="${AP_SCRIPTO_COMMON_DIR}/vendors/common-apps"

if [[ "${USER}" != 'root' ]]; then
    # Enable programmable completion for bash in macOS
    # https://github.com/scop/bash-completion
    if [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]]; then
        [[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

        # oc can use the blow command to link external commands' completions
        # https://docs.brew.sh/Shell-Completion
        # brew completions link

        # or can use the below lines for linking external commands' completions
        # https://docs.brew.sh/Shell-Completion
        # if type brew &>/dev/null; then
        # 	HOMEBREW_PREFIX="$(brew --prefix)"
        # 	if [[ -r "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh" ]]; then
        # 		source "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh"
        # 	else
        # 		for COMPLETION in "${HOMEBREW_PREFIX}/etc/bash_completion.d/"*; do
        # 			[[ -r "${COMPLETION}" ]] && source "${COMPLETION}"
        # 		done
        # 	fi
        # fi
    fi
fi
