alias @genluacompletion="ap_func_generate_lua_autocomplete"
ap_func_generate_lua_autocomplete() {
    @logshow "Generate [luarocks] bash autocomplete\n"
    luarocks completion bash >"${AP_COMPLETIONS_DIR}/ap_completion_luarocks.bash"
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

    @genluacompletion
}

alias @rmlua="ap_func_remove_lua"
ap_func_remove_lua() {
    @logshow "Remove [lua]\n"
    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        brew uninstall lua
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        sudo apt purge -y lua
        sudo apt autoremove -y
    fi
    rm -f "${AP_COMPLETIONS_DIR}/ap_completion_luarocks.bash"
}
