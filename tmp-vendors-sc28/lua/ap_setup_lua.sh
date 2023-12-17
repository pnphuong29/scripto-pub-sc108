export AP_VENDORS_LUA_SETUP_DIR="${AP_SCRIPTO_COMMON_DIR}/vendors/lua"
export AP_VENDORS_LUA_REPO_URL=""
export AP_VENDORS_LUA_GH_DIR="${AP_GH_DIR}/lua"
export AP_VENDORS_LUA_DIR="${AP_SOFT_DIR}/lua"

if [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]]; then
    # https://github.com/luarocks/luarocks/wiki/Installation-instructions-for-macOS
    @logshow "Installing [lua]\n"
    brew install luarocks
elif [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]]; then
    # https://github.com/luarocks/luarocks/wiki/Installation-instructions-for-Unix
    @logshow "Installing [lua]\n"
    sudo apt install -y lua5.4 luarocks
fi

if which lua &>/dev/null; then
    @logshowpassed "[lua] has been installed successfully\n"
else
    @logshowfailed "[lua] has been installed unsuccessfully\n"
fi

if which luarocks &>/dev/null; then
    @logshowpassed "[luarocks] has been installed successfully\n"
    mkdir -p "${AP_VENDORS_LUA_SETUP_DIR}/configs"

    @minfo "Generating bash completion for luarocks\n"
    luarocks completion bash >"${AP_VENDORS_LUA_SETUP_DIR}/configs/ap_completion_luarocks.bash"
    source "${AP_VENDORS_LUA_SETUP_DIR}/configs/ap_completion_luarocks.bash"

    @minfo "Install luaformatter"
    sudo luarocks install --server=https://luarocks.org/dev luaformatter
else
    @logshowfailed "[luarocks] has been installed unsuccessfully\n"
fi
