# Load scripto, share, common and main environment variables
if [ -d "${AP_SCRIPTO_DIR}/libs" ]; then
    while read -r ap_env; do
        source "${ap_env}"
    done < <(gfind "${AP_SCRIPTO_DIR}/libs" -maxdepth 1 -type f -name "ap_env_*.sh" | sort)
fi

if [ -d "${AP_SCRIPTO_SHARE_DIR}/libs" ]; then
    while read -r ap_env; do
        source "${ap_env}"
    done < <(gfind "${AP_SCRIPTO_SHARE_DIR}/libs" -maxdepth 1 -type f -name "ap_env_*.sh" | sort)
fi

if [ -d "${AP_SCRIPTO_COMMON_DIR}/libs" ]; then
    while read -r ap_env; do
        source "${ap_env}"
    done < <(gfind "${AP_SCRIPTO_COMMON_DIR}/libs" -maxdepth 1 -type f -name "ap_env_*.sh" | sort)
fi

if [ -d "${AP_SCRIPTO_MAIN_DIR}/libs" ]; then
    while read -r ap_env; do
        source "${ap_env}"
    done < <(gfind "${AP_SCRIPTO_MAIN_DIR}/libs" -maxdepth 1 -type f -name "ap_env_*.sh" | sort)
fi

# Load scripto core libraries
source "${AP_SCRIPTO_DIR}/libs/ap_core.sh"

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
if [ -d "${AP_SCRIPTO_DIR}/libs" ]; then
    while read -r ap_alias; do
        source "${ap_alias}"
    done < <(gfind "${AP_SCRIPTO_DIR}/libs" -maxdepth 1 -type f -name "ap_alias_*.sh" | sort)
fi

# Load scripto functions
if [ -d "${AP_SCRIPTO_DIR}/libs" ]; then
    while read -r ap_func; do
        source "${ap_func}"
    done < <(gfind "${AP_SCRIPTO_DIR}/libs" -maxdepth 1 -type f -name "ap_func_*.sh" | sort)
fi

# Load share, common & main aliases
if [ -d "${AP_SCRIPTO_SHARE_DIR}/libs" ]; then
    while read -r ap_alias; do
        source "${ap_alias}"
    done < <(gfind "${AP_SCRIPTO_SHARE_DIR}/libs" -maxdepth 1 -type f -name "ap_alias_*.sh" | sort)
fi

if [ -d "${AP_SCRIPTO_COMMON_DIR}/libs" ]; then
    while read -r ap_alias; do
        source "${ap_alias}"
    done < <(gfind "${AP_SCRIPTO_COMMON_DIR}/libs" -maxdepth 1 -type f -name "ap_alias_*.sh" | sort)
fi

if [ -d "${AP_SCRIPTO_MAIN_DIR}/libs" ]; then
    while read -r ap_alias; do
        source "${ap_alias}"
    done < <(gfind "${AP_SCRIPTO_MAIN_DIR}/libs" -maxdepth 1 -type f -name "ap_alias_*.sh" | sort)
fi

# Load share, common, main & scripto vendors
if [ -d "${AP_SCRIPTO_SHARE_DIR}/vendors" ]; then
    while read -r ap_vendor; do
        source "${ap_vendor}"
    done < <(gfind "${AP_SCRIPTO_SHARE_DIR}/vendors" -maxdepth 1 -type f -name "ap_vendor_*.sh" | sort)
fi

if [ -d "${AP_SCRIPTO_COMMON_DIR}/vendors" ]; then
    while read -r ap_vendor; do
        source "${ap_vendor}"
    done < <(gfind "${AP_SCRIPTO_COMMON_DIR}/vendors" -maxdepth 1 -type f -name "ap_vendor_*.sh" | sort)
fi

if [ -d "${AP_SCRIPTO_MAIN_DIR}/vendors" ]; then
    while read -r ap_vendor; do
        source "${ap_vendor}"
    done < <(gfind "${AP_SCRIPTO_MAIN_DIR}/vendors" -maxdepth 1 -type f -name "ap_vendor_*.sh" | sort)
fi

if [ -d "${AP_SCRIPTO_DIR}/vendors" ]; then
    while read -r ap_vendor; do
        source "${ap_vendor}"
    done < <(gfind "${AP_SCRIPTO_DIR}/vendors" -maxdepth 1 -type f -name "ap_vendor_*.sh" | sort)
fi

# Load share, common and main functions
if [ -d "${AP_SCRIPTO_SHARE_DIR}/libs" ]; then
    while read -r ap_func; do
        source "${ap_func}"
    done < <(gfind "${AP_SCRIPTO_SHARE_DIR}/libs" -maxdepth 1 -type f -name "ap_func_*.sh" | sort)
fi

if [ -d "${AP_SCRIPTO_COMMON_DIR}/libs" ]; then
    while read -r ap_func; do
        source "${ap_func}"
    done < <(gfind "${AP_SCRIPTO_COMMON_DIR}/libs" -maxdepth 1 -type f -name "ap_func_*.sh" | sort)
fi

if [ -d "${AP_SCRIPTO_MAIN_DIR}/libs" ]; then
    while read -r ap_func; do
        source "${ap_func}"
    done < <(gfind "${AP_SCRIPTO_MAIN_DIR}/libs" -maxdepth 1 -type f -name "ap_func_*.sh" | sort)
fi

# Update $PATH
@addpath "${AP_SCRIPTO_COMMON_DIR}/tests"
@addpath "${AP_SCRIPTO_COMMON_DIR}/utils"

@addpath "${AP_SCRIPTO_COMMON_DIR}/tests"
@addpath "${AP_SCRIPTO_COMMON_DIR}/utils"

@addpath "${AP_SCRIPTO_MAIN_DIR}/tests"
@addpath "${AP_SCRIPTO_MAIN_DIR}/utils"

# Make executable files
[ -d "${AP_SCRIPTO_SHARE_DIR}/utils" ] && chmod -R +x "${AP_SCRIPTO_SHARE_DIR}/utils"
[ -d "${AP_SCRIPTO_SHARE_DIR}/tests" ] && chmod -R +x "${AP_SCRIPTO_SHARE_DIR}/tests"

[ -d "${AP_SCRIPTO_COMMON_DIR}/utils" ] && chmod -R +x "${AP_SCRIPTO_COMMON_DIR}/utils"
[ -d "${AP_SCRIPTO_COMMON_DIR}/tests" ] && chmod -R +x "${AP_SCRIPTO_COMMON_DIR}/tests"

[ -d "${AP_SCRIPTO_MAIN_DIR}/utils" ] && chmod -R +x "${AP_SCRIPTO_MAIN_DIR}/utils"
[ -d "${AP_SCRIPTO_MAIN_DIR}/tests" ] && chmod -R +x "${AP_SCRIPTO_MAIN_DIR}/tests"

# For manpath command to search for man pages located in man directory
export MANPATH="${AP_MAN_DIR}:${MANPATH}"
