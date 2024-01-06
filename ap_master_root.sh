# Detect OS type
export AP_OS_TYPE_MACOS='macos'
export AP_OS_TYPE_UBUNTU='ubuntu'
export AP_OS_TYPE_UNKNOWN='unknown'

if [ "$(uname)" == 'Darwin' ]; then
    export AP_OS_TYPE="${AP_OS_TYPE_MACOS}"
elif [ "$(uname)" == 'Linux' ] && [ "$(grep ^ID= /etc/os-release | cut -d = -f 2)" == 'ubuntu' ]; then
    export AP_OS_TYPE="${AP_OS_TYPE_UBUNTU}"
else
    export AP_OS_TYPE="${AP_OS_TYPE_UNKNOWN}"
fi

# Default Locales
export LC_ALL='en_US.UTF-8'
export LC_CTYPE='en_US.UTF-8'
export LANG='en_US.UTF-8'
export LANGUAGE='en_US'
export TERM="xterm-256color"

# Try to simulate macOS GNU commands
# Using symbolic links instead of aliases for all users including root cannot access to below commands
if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
    [ ! -L /usr/local/bin/gfind ] && sudo ln -sf /usr/bin/find /usr/local/bin/gfind
    [ ! -L /usr/local/bin/gdate ] && sudo ln -sf /usr/bin/date /usr/local/bin/gdate
    [ ! -L /usr/local/bin/gsed ] && sudo ln -sf /usr/bin/sed /usr/local/bin/gsed
    [ ! -L /usr/local/bin/gxargs ] && sudo ln -sf /usr/bin/xargs /usr/local/bin/gxargs
    [ ! -L /usr/local/bin/md5 ] && sudo ln -sf /usr/bin/md5sum /usr/local/bin/md5
fi

# exa
alias @exa="exa -a --long --header --icons --group --group-directories-first"
alias l="@exa --all"
alias ld="@exa --all -D"
alias l2="@exa --tree --level 2"
alias ld2="@exa --tree --level 2 -D"
alias l3="@exa --tree --level 3"
alias ld3="@exa --tree --level 3 -D"
alias lg="@exa --all --git"

# tree
alias t='tree -ugpshaC -I .git -I node_modules'                               # list all hidden files & dirs & ignore dirs (.git, etc.)
alias t1='tree -L 1 -ugpshaC --metafirst --dirsfirst -I .git -I node_modules' # list level 1 of all hidden files & dirs & ignore dirs (.git, etc.)
alias t2='tree -L 2 -ugpshaC --metafirst --dirsfirst -I .git -I node_modules' # list level 2 of all hidden files & dirs & ignore dirs (.git, etc.)
alias t3='tree -L 3 -ugpshaC --metafirst --dirsfirst -I .git -I node_modules' # list level 2 of all hidden files & dirs & ignore dirs (.git, etc.)
alias t4='tree -L 4 -ugpshaC --metafirst --dirsfirst -I .git -I node_modules' # list level 2 of all hidden files & dirs & ignore dirs (.git, etc.)
alias t5='tree -L 5 -ugpshaC --metafirst --dirsfirst -I .git -I node_modules' # list level 2 of all hidden files & dirs & ignore dirs (.git, etc.)

# joshuto
bind -x '"\C- ":"joshuto"'
