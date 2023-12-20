# Mandatory directories in scripto project
export AP_SCRIPTO_DIR="${HOME}/scripto"
export AP_SCRIPTO_COMMON_DIR="${HOME}/scripto-common"
export AP_SCRIPTO_MAIN_DIR="${HOME}/scripto-main"
export AP_SCRIPTO_DATA_DIR="${HOME}/scripto-data"

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

# Set terminal for current shell
# if [ -n "${KITTY_INSTALLATION_DIR}" ]; then
#     export TERM=xterm-kitty
# elif [ -n "${WEZTERM_EXECUTABLE}" ]; then
#     export TERM=wezterm
# else
#     export TERM=xterm
# fi

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

# Try to simulate macOS GNU commands
# Using symbolic links instead of aliases for all users including root cannot access to below commands
if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
    [ ! -L /usr/local/bin/gfind ] && sudo ln -sf /usr/bin/find /usr/local/bin/gfind
    [ ! -L /usr/local/bin/gdate ] && sudo ln -sf /usr/bin/date /usr/local/bin/gdate
    [ ! -L /usr/local/bin/gsed ] && sudo ln -sf /usr/bin/sed /usr/local/bin/gsed
    [ ! -L /usr/local/bin/gxargs ] && sudo ln -sf /usr/bin/xargs /usr/local/bin/gxargs
    [ ! -L /usr/local/bin/md5 ] && sudo ln -sf /usr/bin/md5sum /usr/local/bin/md5
fi

# Load environment variables
while read -r ap_env; do
    source "${ap_env}"
done < <(gfind "${AP_SCRIPTO_DIR}/libs" -maxdepth 1 -type f -name "ap_env_*.sh" | sort)

if [ -d "${AP_SCRIPTO_COMMON_DIR}" ]; then
    while read -r ap_env; do
        source "${ap_env}"
    done < <(gfind "${AP_SCRIPTO_COMMON_DIR}/libs" -maxdepth 1 -type f -name "ap_env_*.sh" | sort)
fi

if [ -d "${AP_SCRIPTO_MAIN_DIR}" ]; then
    while read -r ap_env; do
        source "${ap_env}"
    done < <(gfind "${AP_SCRIPTO_MAIN_DIR}/libs" -maxdepth 1 -type f -name "ap_env_*.sh" | sort)
fi

# For manpath command to search for man pages located in man directory
export MANPATH="${AP_MAN_DIR}:${MANPATH}"
