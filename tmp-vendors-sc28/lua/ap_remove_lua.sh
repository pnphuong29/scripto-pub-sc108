#

export AP_VENDORS_LUA_SETUP_DIR="${AP_SCRIPTO_COMMON_DIR}/vendors/lua"
export AP_VENDORS_LUA_REPO_URL=""
export AP_VENDORS_LUA_GH_DIR="${AP_GH_DIR}/lua"
export AP_VENDORS_LUA_DIR="${AP_SOFT_DIR}/lua"

if [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]]; then
    @logshow "Removing [lua] using [brew]\n"
    brew uninstall lua

    if ! brew list --versions | grep lua &>/dev/null; then
        @logshowpassed "[lua] has been removed successfully using [brew]\n"
    else
        @logshowfailed "[lua] has been removed unsuccessfully using [brew]\n"
    fi
elif [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]]; then
    @logshow "Removing [lua] using [apt]\n"
    sudo apt purge -y lua
    sudo apt autoremove -y

    if ! type lua &>/dev/null; then
        # if [[ ! -d "${ap_lua_dir}" ]]; then
        @logshowpassed "[lua] has been removed successfully using [apt]\n"
    else
        @logshowfailed "[lua] has been removed unsuccessfully using [apt]\n"
    fi
fi
