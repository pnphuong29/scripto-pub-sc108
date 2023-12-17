# Bash prompt
# https://www.cyberciti.biz/tips/howto-linux-unix-bash-shell-setup-prompt.html
# https://unix.stackexchange.com/questions/105958/terminal-prompt-not-wrapping-correctly
export PS1_OLD="${PS1}"
# export PS1="\[\e[95;49m\]\t \[\e[32;49m\]\w\[\e[m\]\$ "
export PS1="\[\e[95;49m\]\t \[\e[93;49m\]\u@\h \[\e[32;49m\]\W\[\e[m\]\$ "
