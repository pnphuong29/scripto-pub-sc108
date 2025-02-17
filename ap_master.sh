# @#IMPORTANT - Changing the loading (sourcing) order of below files may cause unexpected results!!!
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

export AP_USER='pnphuong29'
export AP_HOME="/Users/${AP_USER}"

# This will resolve absolute paths in different platforms such as macOS, Ubuntu, etc.
# in VScode's settings.json file and many more similar cases.
if [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]]; then
    if [ ! -L "${AP_HOME}" ]; then
        echo "Create symlink from [${AP_HOME}] to [${HOME}]\n"
        sudo mkdir -p "/Users"
        sudo ln -s "${HOME}" "${AP_HOME}"
    fi
fi

# Turn on/off log mode (for writing to log files)
export AP_LOGS_GENERAL_ENABLED=0
export AP_LOGS_DEBUG_ENABLED=1

# Enable/disable error messages in [getopts] command
# export OPTERR=0

AP_UID="$(id -u)"
export AP_UID

AP_GID="$(id -g)"
export AP_GID

# Core functions
alias showdeviceid="ap_func_get_device_id"
ap_func_get_device_id() {
    local ap_device_id=""
    if [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]]; then
        ap_device_id="$(system_profiler SPHardwareDataType | grep 'Serial Number (system)' | cut -d: -f2 | gsed 's/ //g' | tr -d '\n')"
    elif [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]]; then
        ap_device_id="$(cat /etc/machine-id | tr -d '\n')"
    fi
    printf "%s" "${ap_device_id}"
}

alias showdevicename="ap_func_device_name"
alias cpdevicename="ap_func_device_name | tr -d '\n' | apcopy"
ap_func_device_name() {
    local ap_device_id
    local ap_device_name

    ap_device_id="$(showdeviceid)"
    # echo "ap_device_id = [${ap_device_id}]"

    ap_device_name="$(grep "${ap_device_id}" ~/scripto-main/devices.env | cut -d= -f2 | tr -d '\n')"
    if [ -n "${ap_device_name}" ]; then
        echo "${ap_device_name}"
    else
        aplogerror "Device name not found"
        aprtn_err_unknown
    fi
}

# Configs
export AP_CONFIGS_DIR="${HOME}/scripto-data/configs"
export AP_CONF_DEVICE_NAME_FILE="${AP_CONFIGS_DIR}/.device-name"
export AP_CONF_GENERATE_CACHE_FILE="${AP_CONFIGS_DIR}/.generate-cache-files"

if [ ! -d "${AP_CONFIGS_DIR}" ]; then
    echo "Creating directory [${AP_CONFIGS_DIR}]"
    mkdir -p "${AP_CONFIGS_DIR}"
fi

# Create device-name file if not existed
if [ ! -s "${AP_CONF_DEVICE_NAME_FILE}" ]; then
    ap_device_id="$(showdeviceid)"
    if [ -n "${ap_device_id}" ]; then
        ap_device_name="$(grep "${ap_device_id}" ~/scripto-main/devices.env | cut -d= -f2 | tr -d '\n')"
        echo "Create .device-name file with content [${ap_device_name}]"
        printf "%s" "${ap_device_name}" >"${AP_CONF_DEVICE_NAME_FILE}"
    fi
fi

# Create ${AP_CONF_GENERATE_CACHE_FILE} file if not existed
if [ ! -s "${AP_CONF_GENERATE_CACHE_FILE}" ]; then
    echo "Create .generate-cache-files file with content [1]"
    printf "1" >"${AP_CONF_GENERATE_CACHE_FILE}"
fi

# Cache
export AP_CACHE_DIR="${HOME}/scripto-data/cache"
if [ ! -d "${AP_CACHE_DIR}" ]; then
    echo "Creating directory [${AP_CACHE_DIR}]"
    mkdir -p "${AP_CACHE_DIR}"
fi

if [ -s "${AP_CACHE_DIR}/sc108_ap_master_part_1.sh" ] && [ "$(cat "${AP_CONF_GENERATE_CACHE_FILE}")" == '1' ]; then
    echo "Using cache file [sc108_ap_master_part_1.sh]"
    source "${AP_CACHE_DIR}/sc108_ap_master_part_1.sh"
else
    echo "Renewing cache file [sc108_ap_master_part_1.sh]"
    true >"${AP_CACHE_DIR}/sc108_ap_master_part_1.sh"

    # Load scripto common server environment variables
    if [ -d "${HOME}/scripto-common/libs" ]; then
        while read -r ap_env; do
            # source "${ap_env}"
            cat "${ap_env}" >>"${AP_CACHE_DIR}/sc108_ap_master_part_1.sh"
            echo >>"${AP_CACHE_DIR}/sc108_ap_master_part_1.sh"
        done < <(gfind "${HOME}/scripto-common/libs" -maxdepth 1 -type f -name "ap_servers*.sh" | grep -v -e "7s" | sort)
    fi

    # Load scripto share server environment variables
    if [ -d "${HOME}/scripto-share/libs" ]; then
        while read -r ap_env; do
            # source "${ap_env}"
            cat "${ap_env}" >>"${AP_CACHE_DIR}/sc108_ap_master_part_1.sh"
            echo >>"${AP_CACHE_DIR}/sc108_ap_master_part_1.sh"
        done < <(gfind "${HOME}/scripto-share/libs" -maxdepth 1 -type f -name "ap_servers*.sh" | grep -v -e "7s" | sort)
    fi

    # Load scripto main server environment variables
    if [ -d "${HOME}/scripto-main/libs" ]; then
        while read -r ap_env; do
            # source "${ap_env}"
            cat "${ap_env}" >>"${AP_CACHE_DIR}/sc108_ap_master_part_1.sh"
            echo >>"${AP_CACHE_DIR}/sc108_ap_master_part_1.sh"
        done < <(gfind "${HOME}/scripto-main/libs" -maxdepth 1 -type f -name "ap_servers*.sh" | grep -v -e "7s" | sort)
    fi

    # Load scripto environment variables
    if [ -d "${HOME}/scripto/libs" ]; then
        while read -r ap_env; do
            # source "${ap_env}"
            cat "${ap_env}" >>"${AP_CACHE_DIR}/sc108_ap_master_part_1.sh"
            echo >>"${AP_CACHE_DIR}/sc108_ap_master_part_1.sh"
        done < <(gfind "${HOME}/scripto/libs" -maxdepth 1 -type f -name "ap_env_*.sh" | grep -v -e "7s" | sort)
    fi

    # Load scripto share environment variables
    if [ -d "${HOME}/scripto-share/libs" ]; then
        while read -r ap_env; do
            # source "${ap_env}"
            cat "${ap_env}" >>"${AP_CACHE_DIR}/sc108_ap_master_part_1.sh"
            echo >>"${AP_CACHE_DIR}/sc108_ap_master_part_1.sh"
        done < <(gfind "${HOME}/scripto-share/libs" -maxdepth 1 -type f -name "ap_env_*.sh" | grep -v -e "7s" | sort)
    fi

    # Load scripto common environment variables
    if [ -d "${HOME}/scripto-common/libs" ]; then
        while read -r ap_env; do
            # source "${ap_env}"
            cat "${ap_env}" >>"${AP_CACHE_DIR}/sc108_ap_master_part_1.sh"
            echo >>"${AP_CACHE_DIR}/sc108_ap_master_part_1.sh"
        done < <(gfind "${HOME}/scripto-common/libs" -maxdepth 1 -type f -name "ap_env_*.sh" | grep -v -e "7s" | sort)
    fi

    # Load scripto main environment variables
    if [ -d "${HOME}/scripto-main/libs" ]; then
        while read -r ap_env; do
            # source "${ap_env}"
            cat "${ap_env}" >>"${AP_CACHE_DIR}/sc108_ap_master_part_1.sh"
            echo >>"${AP_CACHE_DIR}/sc108_ap_master_part_1.sh"
        done < <(gfind "${HOME}/scripto-main/libs" -maxdepth 1 -type f -name "ap_env_*.sh" | grep -v -e "7s" | sort)
    fi

    source "${AP_CACHE_DIR}/sc108_ap_master_part_1.sh"
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

if [ -s "${AP_CACHE_DIR}/sc108_ap_master_part_2.sh" ] && [ "$(cat "${AP_CONF_GENERATE_CACHE_FILE}")" == '1' ]; then
    echo "Using cache file [sc108_ap_master_part_2.sh]"
    source "${AP_CACHE_DIR}/sc108_ap_master_part_2.sh"
else
    echo "Renewing cache file [sc108_ap_master_part_2.sh]"
    true >"${AP_CACHE_DIR}/sc108_ap_master_part_2.sh"

    # Load scripto aliases
    if [ -d "${HOME}/scripto/libs" ]; then
        while read -r ap_alias; do
            # source "${ap_alias}"
            cat "${ap_alias}" >>"${AP_CACHE_DIR}/sc108_ap_master_part_2.sh"
            echo >>"${AP_CACHE_DIR}/sc108_ap_master_part_2.sh"
        done < <(gfind "${HOME}/scripto/libs" -maxdepth 1 -type f -name "ap_alias_*.sh" | grep -v -e "7s" | sort)
    fi

    # Load scripto functions
    if [ -d "${HOME}/scripto/libs" ]; then
        while read -r ap_func; do
            # source "${ap_func}"
            cat "${ap_func}" >>"${AP_CACHE_DIR}/sc108_ap_master_part_2.sh"
            echo >>"${AP_CACHE_DIR}/sc108_ap_master_part_2.sh"
            echo >>"${AP_CACHE_DIR}/sc108_ap_master_part_2.sh"
        done < <(gfind "${HOME}/scripto/libs" -maxdepth 1 -type f -name "ap_func_*.sh" | grep -v -e "7s" | sort)
    fi

    # Load scripto share aliases
    if [ -d "${HOME}/scripto-share/libs" ]; then
        while read -r ap_alias; do
            # source "${ap_alias}"
            cat "${ap_alias}" >>"${AP_CACHE_DIR}/sc108_ap_master_part_2.sh"
            echo >>"${AP_CACHE_DIR}/sc108_ap_master_part_2.sh"
        done < <(gfind "${HOME}/scripto-share/libs" -maxdepth 1 -type f -name "ap_alias_*.sh" | grep -v -e "7s" | sort)
    fi

    # Load scripto common aliases
    if [ -d "${HOME}/scripto-common/libs" ]; then
        while read -r ap_alias; do
            # source "${ap_alias}"
            cat "${ap_alias}" >>"${AP_CACHE_DIR}/sc108_ap_master_part_2.sh"
            echo >>"${AP_CACHE_DIR}/sc108_ap_master_part_2.sh"
        done < <(gfind "${HOME}/scripto-common/libs" -maxdepth 1 -type f -name "ap_alias_*.sh" | grep -v -e "7s" | sort)
    fi

    # Load scripto main aliases
    if [ -d "${HOME}/scripto-main/libs" ]; then
        while read -r ap_alias; do
            # source "${ap_alias}"
            cat "${ap_alias}" >>"${AP_CACHE_DIR}/sc108_ap_master_part_2.sh"
            echo >>"${AP_CACHE_DIR}/sc108_ap_master_part_2.sh"
        done < <(gfind "${HOME}/scripto-main/libs" -maxdepth 1 -type f -name "ap_alias_*.sh" | grep -v -e "7s" | sort)
    fi

    # Load scripto share vendors
    if [ -d "${HOME}/scripto-share/vendors" ]; then
        while read -r ap_vendor; do
            # source "${ap_vendor}"
            cat "${ap_vendor}" >>"${AP_CACHE_DIR}/sc108_ap_master_part_2.sh"
            echo >>"${AP_CACHE_DIR}/sc108_ap_master_part_2.sh"
        done < <(gfind "${HOME}/scripto-share/vendors" -maxdepth 1 -type f -name "ap_vendor_*.sh" | grep -v -e "7s" | sort)
    fi

    # Load scripto common vendors
    if [ -d "${HOME}/scripto-common/vendors" ]; then
        while read -r ap_vendor; do
            # source "${ap_vendor}"
            cat "${ap_vendor}" >>"${AP_CACHE_DIR}/sc108_ap_master_part_2.sh"
            echo >>"${AP_CACHE_DIR}/sc108_ap_master_part_2.sh"
        done < <(gfind "${HOME}/scripto-common/vendors" -maxdepth 1 -type f -name "ap_vendor_*.sh" | grep -v -e "7s" | sort)
    fi

    # Load scripto main vendors
    if [ -d "${HOME}/scripto-main/vendors" ]; then
        while read -r ap_vendor; do
            # source "${ap_vendor}"
            cat "${ap_vendor}" >>"${AP_CACHE_DIR}/sc108_ap_master_part_2.sh"
            echo >>"${AP_CACHE_DIR}/sc108_ap_master_part_2.sh"
        done < <(gfind "${HOME}/scripto-main/vendors" -maxdepth 1 -type f -name "ap_vendor_*.sh" | grep -v -e "7s" | sort)
    fi

    # Load scripto vendors
    if [ -d "${HOME}/scripto/vendors" ]; then
        while read -r ap_vendor; do
            # source "${ap_vendor}"
            cat "${ap_vendor}" >>"${AP_CACHE_DIR}/sc108_ap_master_part_2.sh"
            echo >>"${AP_CACHE_DIR}/sc108_ap_master_part_2.sh"
        done < <(gfind "${HOME}/scripto/vendors" -maxdepth 1 -type f -name "ap_vendor_*.sh" | grep -v -e "7s" | sort)
    fi

    # Load share functions
    if [ -d "${HOME}/scripto-share/libs" ]; then
        while read -r ap_func; do
            # source "${ap_func}"
            cat "${ap_func}" >>"${AP_CACHE_DIR}/sc108_ap_master_part_2.sh"
            echo >>"${AP_CACHE_DIR}/sc108_ap_master_part_2.sh"
        done < <(gfind "${HOME}/scripto-share/libs" -maxdepth 1 -type f -name "ap_func_*.sh" | grep -v -e "7s" | sort)
    fi

    # Load common functions
    if [ -d "${HOME}/scripto-common/libs" ]; then
        while read -r ap_func; do
            # source "${ap_func}"
            cat "${ap_func}" >>"${AP_CACHE_DIR}/sc108_ap_master_part_2.sh"
            echo >>"${AP_CACHE_DIR}/sc108_ap_master_part_2.sh"
        done < <(gfind "${HOME}/scripto-common/libs" -maxdepth 1 -type f -name "ap_func_*.sh" | grep -v -e "7s" | sort)
    fi

    # Load main functions
    if [ -d "${HOME}/scripto-main/libs" ]; then
        while read -r ap_func; do
            # source "${ap_func}"
            cat "${ap_func}" >>"${AP_CACHE_DIR}/sc108_ap_master_part_2.sh"
            echo >>"${AP_CACHE_DIR}/sc108_ap_master_part_2.sh"
        done < <(gfind "${HOME}/scripto-main/libs" -maxdepth 1 -type f -name "ap_func_*.sh" | grep -v -e "7s" | sort)
    fi

    source "${AP_CACHE_DIR}/sc108_ap_master_part_2.sh"
fi

# Update $PATH
apaddpath "${HOME}/scripto/utils"
apaddpath "${HOME}/scripto-share/utils"
apaddpath "${HOME}/scripto-common/utils"
apaddpath "${HOME}/scripto-main/utils"

apaddpath "${HOME}/scripto-share/tests"
apaddpath "${HOME}/scripto-common/tests"
apaddpath "${HOME}/scripto-main/tests"

# Make executable files
[ -d "${HOME}/scripto-share/utils" ] && chmod -R +x "${HOME}/scripto-share/utils"
[ -d "${HOME}/scripto-share/tests" ] && chmod -R +x "${HOME}/scripto-share/tests"

[ -d "${HOME}/scripto-common/utils" ] && chmod -R +x "${HOME}/scripto-common/utils"
[ -d "${HOME}/scripto-common/tests" ] && chmod -R +x "${HOME}/scripto-common/tests"

[ -d "${HOME}/scripto-main/utils" ] && chmod -R +x "${HOME}/scripto-main/utils"
[ -d "${HOME}/scripto-main/tests" ] && chmod -R +x "${HOME}/scripto-main/tests"

# For manpath command to search for man pages located in man directory
# export MANPATH="${AP_MAN_DIR}:${MANPATH}"
apaddpath -m "${AP_MAN_DIR}"
