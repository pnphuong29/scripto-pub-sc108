alias @createdirstructlua="ap_func_create_dirstruct_lua"
ap_func_create_dirstruct_lua() {
    @logshow "Generate [lua] bash autocomplete\n"
    luarocks completion bash >"${AP_COMPLETIONS_DIR}/ap_completion_luarocks.bash"

    if alias @createdirstructluacommon &>/dev/null; then
        @createdirstructluacommon
    fi
}

alias @rmdirstructlua="ap_func_rm_dirstruct_lua"
ap_func_rm_dirstruct_lua() {
    @logshow "Remove [${AP_COMPLETIONS_DIR}/ap_completion_luarocks.bash]\n"
    rm -f "${AP_COMPLETIONS_DIR}/ap_completion_luarocks.bash"

    if alias @rmdirstructluacommon &>/dev/null; then
        @rmdirstructluacommon
    fi
}

alias @setuplua="ap_func_setup_lua"
ap_func_setup_lua() {
    @logshow "Install [lua]\n"
    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        # https://github.com/luarocks/luarocks/wiki/Installation-instructions-for-macOS
        brew install luarocks
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        # https://github.com/luarocks/luarocks/wiki/Installation-instructions-for-Unix
        sudo apt install -y lua5.4 luarocks
    fi

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
