alias @initlua="ap_func_init_lua"
ap_func_init_lua() {
    if alias @initluashare &>/dev/null; then
        @initluashare
    fi

    if alias @initluacommon &>/dev/null; then
        @initluacommon
    fi
}

alias @createdirstructlua="ap_func_create_dirstruct_lua"
ap_func_create_dirstruct_lua() {
    @logshow "Generate [lua] bash autocomplete\n"
    luarocks completion bash >"${AP_COMPLETIONS_DIR}/ap_completion_luarocks.bash"

    if alias @createdirstructluashare &>/dev/null; then
        @createdirstructluashare
    fi

    if alias @createdirstructluacommon &>/dev/null; then
        @createdirstructluacommon
    fi
}

alias @rmdirstructlua="ap_func_rm_dirstruct_lua"
ap_func_rm_dirstruct_lua() {
    @logshow "Remove [${AP_COMPLETIONS_DIR}/ap_completion_luarocks.bash]\n"
    rm -f "${AP_COMPLETIONS_DIR}/ap_completion_luarocks.bash"

    if alias @rmdirstructluashare &>/dev/null; then
        @rmdirstructluashare
    fi

    if alias @rmdirstructluacommon &>/dev/null; then
        @rmdirstructluacommon
    fi
}

alias @setuplua="ap_func_setup_lua"
ap_func_setup_lua() {
    local ap_lua_setup_version=''
    if [ -n "$1" ]; then
        ap_lua_setup_version="$1"
    fi

    @logshow "Install [lua] v${ap_lua_setup_version}\n"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        # https://github.com/luarocks/luarocks/wiki/Installation-instructions-for-macOS
        brew install "luarocks@${ap_lua_setup_version}"
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        # https://github.com/luarocks/luarocks/wiki/Installation-instructions-for-Unix
        sudo apt install -y "lua${ap_lua_setup_version}" luarocks
    fi

    @initlua
    if alias @createdirstructlua &>/dev/null; then
        @createdirstructlua
    fi
}

alias @rmlua="ap_func_rm_lua"
ap_func_rm_lua() {
    @logshow "Remove [lua]\n"
    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        brew uninstall lua
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        sudo apt purge -y lua
        sudo apt autoremove -y
    fi

    if alias @rmdirstructlua &>/dev/null; then
        @rmdirstructlua
    fi
}
