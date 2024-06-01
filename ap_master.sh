# @#IMPORTANT - Changing the loading (sourcing) order of below files may cause unexpected results!!!

# Load scripto common server environment variables
if [ -d "${HOME}/scripto-common/libs" ]; then
    while read -r ap_env; do
        source "${ap_env}"
    done < <(gfind "${HOME}/scripto-common/libs" -maxdepth 1 -type f -name "ap_servers*.sh" | sort)
fi

# Load scripto share server environment variables
if [ -d "${HOME}/scripto-share/libs" ]; then
    while read -r ap_env; do
        source "${ap_env}"
    done < <(gfind "${HOME}/scripto-share/libs" -maxdepth 1 -type f -name "ap_servers*.sh" | sort)
fi

# Load scripto main server environment variables
if [ -d "${HOME}/scripto-main/libs" ]; then
    while read -r ap_env; do
        source "${ap_env}"
    done < <(gfind "${HOME}/scripto-main/libs" -maxdepth 1 -type f -name "ap_servers*.sh" | sort)
fi

# Load scripto environment variables
if [ -d "${HOME}/scripto/libs" ]; then
    while read -r ap_env; do
        source "${ap_env}"
    done < <(gfind "${HOME}/scripto/libs" -maxdepth 1 -type f -name "ap_env_*.sh" | sort)
fi

# Load scripto share environment variables
if [ -d "${HOME}/scripto-share/libs" ]; then
    while read -r ap_env; do
        source "${ap_env}"
    done < <(gfind "${HOME}/scripto-share/libs" -maxdepth 1 -type f -name "ap_env_*.sh" | sort)
fi

# Load scripto common environment variables
if [ -d "${HOME}/scripto-common/libs" ]; then
    while read -r ap_env; do
        source "${ap_env}"
    done < <(gfind "${HOME}/scripto-common/libs" -maxdepth 1 -type f -name "ap_env_*.sh" | sort)
fi

# Load scripto main environment variables
if [ -d "${HOME}/scripto-main/libs" ]; then
    while read -r ap_env; do
        source "${ap_env}"
    done < <(gfind "${HOME}/scripto-main/libs" -maxdepth 1 -type f -name "ap_env_*.sh" | sort)
fi

# Load scripto core libraries
source "${HOME}/scripto/libs/ap_core.sh"

# Try to simulate macOS GNU commands
# Using symbolic links instead of aliases for all users including root cannot access to below commands
if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
    [ ! -L /usr/local/bin/gfind ] && sudo ln -sf /usr/bin/find /usr/local/bin/gfind
    [ ! -L /usr/local/bin/gdate ] && sudo ln -sf /usr/bin/date /usr/local/bin/gdate
    [ ! -L /usr/local/bin/gsed ] && sudo ln -sf /usr/bin/sed /usr/local/bin/gsed
    [ ! -L /usr/local/bin/gxargs ] && sudo ln -sf /usr/bin/xargs /usr/local/bin/gxargs
    [ ! -L /usr/local/bin/md5 ] && sudo ln -sf /usr/bin/md5sum /usr/local/bin/md5
fi

# Load scripto aliases
if [ -d "${HOME}/scripto/libs" ]; then
    while read -r ap_alias; do
        source "${ap_alias}"
    done < <(gfind "${HOME}/scripto/libs" -maxdepth 1 -type f -name "ap_alias_*.sh" | sort)
fi

# Load scripto functions
if [ -d "${HOME}/scripto/libs" ]; then
    while read -r ap_func; do
        source "${ap_func}"
    done < <(gfind "${HOME}/scripto/libs" -maxdepth 1 -type f -name "ap_func_*.sh" | sort)
fi

# Load scripto share aliases
if [ -d "${HOME}/scripto-share/libs" ]; then
    while read -r ap_alias; do
        source "${ap_alias}"
    done < <(gfind "${HOME}/scripto-share/libs" -maxdepth 1 -type f -name "ap_alias_*.sh" | sort)
fi

# Load scripto common aliases
if [ -d "${HOME}/scripto-common/libs" ]; then
    while read -r ap_alias; do
        source "${ap_alias}"
    done < <(gfind "${HOME}/scripto-common/libs" -maxdepth 1 -type f -name "ap_alias_*.sh" | sort)
fi

# Load scripto main aliases
if [ -d "${HOME}/scripto-main/libs" ]; then
    while read -r ap_alias; do
        source "${ap_alias}"
    done < <(gfind "${HOME}/scripto-main/libs" -maxdepth 1 -type f -name "ap_alias_*.sh" | sort)
fi

# Load scripto share vendors
if [ -d "${HOME}/scripto-share/vendors" ]; then
    while read -r ap_vendor; do
        source "${ap_vendor}"
    done < <(gfind "${HOME}/scripto-share/vendors" -maxdepth 1 -type f -name "ap_vendor_*.sh" | sort)
fi

# Load scripto common vendors
if [ -d "${HOME}/scripto-common/vendors" ]; then
    while read -r ap_vendor; do
        source "${ap_vendor}"
    done < <(gfind "${HOME}/scripto-common/vendors" -maxdepth 1 -type f -name "ap_vendor_*.sh" | sort)
fi

# Load scripto main vendors
if [ -d "${HOME}/scripto-main/vendors" ]; then
    while read -r ap_vendor; do
        source "${ap_vendor}"
    done < <(gfind "${HOME}/scripto-main/vendors" -maxdepth 1 -type f -name "ap_vendor_*.sh" | sort)
fi

# Load scripto vendors
if [ -d "${HOME}/scripto/vendors" ]; then
    while read -r ap_vendor; do
        source "${ap_vendor}"
    done < <(gfind "${HOME}/scripto/vendors" -maxdepth 1 -type f -name "ap_vendor_*.sh" | sort)
fi

# Load share functions
if [ -d "${HOME}/scripto-share/libs" ]; then
    while read -r ap_func; do
        source "${ap_func}"
    done < <(gfind "${HOME}/scripto-share/libs" -maxdepth 1 -type f -name "ap_func_*.sh" | sort)
fi

# Load common functions
if [ -d "${HOME}/scripto-common/libs" ]; then
    while read -r ap_func; do
        source "${ap_func}"
    done < <(gfind "${HOME}/scripto-common/libs" -maxdepth 1 -type f -name "ap_func_*.sh" | sort)
fi

# Load main functions
if [ -d "${HOME}/scripto-main/libs" ]; then
    while read -r ap_func; do
        source "${ap_func}"
    done < <(gfind "${HOME}/scripto-main/libs" -maxdepth 1 -type f -name "ap_func_*.sh" | sort)
fi

# Update $PATH
apaddpath "${HOME}/scripto/utils"
apaddpath "${HOME}/scripto-share/utils"
apaddpath "${HOME}/scripto-common/utils"
apaddpath "${HOME}/scripto-main/utils"

apaddpath "${HOME}/scripto-share/tests"
apaddpath "${HOME}/scripto-common/tests"
apaddpath "${HOME}/scripto-main/tests"

# homebrew
if [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]]; then
    if [[ "$(uname -m)" == 'arm64' ]]; then
        apaddpath /opt/homebrew/bin
        apaddpath /opt/homebrew/sbin
    elif [[ "$(uname -m)" == 'x86_64' ]]; then
        apaddpath /opt/local/bin
        apaddpath /opt/local/sbin
        apaddpath /opt/local/libexec/gnubin/
    fi
fi

# Make executable files
[ -d "${HOME}/scripto-share/utils" ] && chmod -R +x "${HOME}/scripto-share/utils"
[ -d "${HOME}/scripto-share/tests" ] && chmod -R +x "${HOME}/scripto-share/tests"

[ -d "${HOME}/scripto-common/utils" ] && chmod -R +x "${HOME}/scripto-common/utils"
[ -d "${HOME}/scripto-common/tests" ] && chmod -R +x "${HOME}/scripto-common/tests"

[ -d "${HOME}/scripto-main/utils" ] && chmod -R +x "${HOME}/scripto-main/utils"
[ -d "${HOME}/scripto-main/tests" ] && chmod -R +x "${HOME}/scripto-main/tests"

# For manpath command to search for man pages located in man directory
# export MANPATH="${AP_MAN_DIR}:${MANPATH}"
apaddpath -m /opt/local/share/man
apaddpath -m "${AP_MAN_DIR}"
