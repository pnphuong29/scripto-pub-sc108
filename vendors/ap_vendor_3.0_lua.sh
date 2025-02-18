alias apinitlua="ap_func_init_lua"
ap_func_init_lua() {
    if alias apinitluashare &>/dev/null; then
        apinitluashare
    fi

    if alias apinitluacommon &>/dev/null; then
        apinitluacommon
    fi
}

alias apcreatedirstructlua="ap_func_create_dirstruct_lua"
ap_func_create_dirstruct_lua() {
    aplogshow "Generate [lua] bash autocomplete\n"
    luarocks completion bash >"${AP_COMPLETIONS_DIR}/ap_completion_luarocks.bash"

    if alias apcreatedirstructluashare &>/dev/null; then
        apcreatedirstructluashare
    fi

    if alias apcreatedirstructluacommon &>/dev/null; then
        apcreatedirstructluacommon
    fi
}

alias aprmdirstructlua="ap_func_rm_dirstruct_lua"
ap_func_rm_dirstruct_lua() {
    aplogshow "Remove [${AP_COMPLETIONS_DIR}/ap_completion_luarocks.bash]\n"
    rm -f "${AP_COMPLETIONS_DIR}/ap_completion_luarocks.bash"

    if alias aprmdirstructluashare &>/dev/null; then
        aprmdirstructluashare
    fi

    if alias aprmdirstructluacommon &>/dev/null; then
        aprmdirstructluacommon
    fi
}

alias apsetuplua="ap_func_setup_lua"
ap_func_setup_lua() {
    local ap_lua_setup_version='5.3'
    if [ -n "$1" ]; then
        ap_lua_setup_version="$1"
    fi

    aplogshow "Install [lua] v${ap_lua_setup_version}\n"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        # https://github.com/luarocks/luarocks/wiki/Installation-instructions-for-macOS
        brew install "lua@${ap_lua_setup_version}" luarocks
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        # https://github.com/luarocks/luarocks/wiki/Installation-instructions-for-Unix
        sudo apt install -y "lua${ap_lua_setup_version}" luarocks
    fi

    apinitlua
    if alias apcreatedirstructlua &>/dev/null; then
        apcreatedirstructlua
    fi
}

alias aprmlua="ap_func_rm_lua"
ap_func_rm_lua() {
    local ap_lua_remove_version='5.3'
    if [ -n "$1" ]; then
        ap_lua_remove_version="$1"
    fi

    aplogshow "Remove [lua]\n"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        brew uninstall "lua@${ap_lua_remove_version}" luarocks
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        sudo apt purge -y "lua@${ap_lua_remove_version}" luarocks
        sudo apt autoremove -y
    fi

    if alias aprmdirstructlua &>/dev/null; then
        aprmdirstructlua
    fi
}
