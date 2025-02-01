# List commands
alias lspaths='echo "${PATH}" | tr ":" "\n"'
alias lsaliases='alias | gsed "s@alias @@" | grep "^[@|1|2|3]" | sort'
alias lsaliasesfzf='alias | gsed "s@alias @@" | grep "^[@|1|2|3]" | sort | fzf'
alias lsusers="type getent &>/dev/null && getent passwd || cat /etc/passwd"
alias lsgroups="type getent &>/dev/null && getent group || cat /etc/groups"
alias lservices='sudo launchctl list'
alias lservicesgrep='sudo launchctl list | grep'
alias lsmonitors='hwinfo --monitor'
