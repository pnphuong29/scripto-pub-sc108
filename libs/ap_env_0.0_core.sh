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

# Update $PATH
if type brew &>/dev/null; then
    PATH="$(brew --prefix)/sbin:${PATH}"
    export PATH
fi
export PATH="${HOME}/.local/bin:${PATH}"
export PATH="${HOME}/bin:${PATH}"

# Turn on/off debug mode (for writing to debug log files)
export AP_LOGS_DEBUG_ENABLED=0

# Enable/disable error messages in [getopts] command
# export OPTERR=0

# These markers are normally used to mark the start/end of a custom
# configuration part that you need to inject into a config file
export AP_MARKER_CONFIG_START="@@@AP_START"
export AP_MARKER_CONFIG_END="@@@AP_END"

# export TERM="xterm"
export TERM="xterm-256color"

AP_UID="$(id -u)"
export AP_UID

AP_GID="$(id -g)"
export AP_GID
