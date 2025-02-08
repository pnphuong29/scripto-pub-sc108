# Default Locales
export LC_ALL='en_US.UTF-8'
export LC_CTYPE='en_US.UTF-8'
export LANG='en_US.UTF-8'
export LANGUAGE='en_US'

# Update $PATH
if type brew &>/dev/null; then
    PATH="$(brew --prefix)/sbin:${PATH}"
    export PATH
fi

if type port &>/dev/null; then
    PATH="/opt/local/bin:${PATH}"
    PATH="/opt/local/sbin:${PATH}"
    export PATH
fi

export PATH="${HOME}/.local/bin:${PATH}"
export PATH="${HOME}/bin:${PATH}"

# These markers are normally used to mark the start/end of a custom
# configuration part that you need to inject into a config file
export AP_MARKER_CONFIG_START="@@@AP_START"
export AP_MARKER_CONFIG_END="@@@AP_END"

# export TERM="xterm"
export TERM="xterm-256color"

# Common editors
export AP_EDITOR_ARR=("vi" "code" "zed")
