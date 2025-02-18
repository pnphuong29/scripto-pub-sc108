# https://wezfurlong.org/wezterm/installation.html
# https://github.com/wezterm/wezterm
alias apinitwezterm="ap_func_init_wezterm"
ap_func_init_wezterm() {
    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        apaddpath "/Applications/WezTerm.app/Contents/MacOS"
    fi

    if alias apinitweztermshare &>/dev/null; then
        apinitweztermshare
    fi

    if alias apinitweztermcommon &>/dev/null; then
        apinitweztermcommon
    fi
}

alias apcreatedirstructwezterm="ap_func_create_dirstruct_wezterm"
ap_func_create_dirstruct_wezterm() {
    aplogshow "Generate [wezterm] bash autocomplete at [${AP_COMPLETIONS_DIR}/ap_completion_wezterm.bash]\n"
    wezterm shell-completion --shell bash >"${AP_COMPLETIONS_DIR}/ap_completion_wezterm.bash"

    if alias apcreatedirstructweztermshare &>/dev/null; then
        apcreatedirstructweztermshare
    fi

    if alias apcreatedirstructweztermcommon &>/dev/null; then
        apcreatedirstructweztermcommon
    fi
}

alias aprmdirstructwezterm="ap_func_rm_dirstruct_wezterm"
ap_func_rm_dirstruct_wezterm() {
    aplogshow "Remove [${AP_COMPLETIONS_DIR}/ap_completion_wezterm.bash]\n"
    rm -f "${AP_COMPLETIONS_DIR}/ap_completion_wezterm.bash"

    if alias aprmdirstructweztermshare &>/dev/null; then
        aprmdirstructweztermshare
    fi

    if alias aprmdirstructweztermcommon &>/dev/null; then
        aprmdirstructweztermcommon
    fi
}

alias apsetupwezterm="ap_func_setup_wezterm"
ap_func_setup_wezterm() {
    aplogshow "Install [wezterm]\n"

    rm -rf "${AP_TMP_DIR}/wezterm"
    mkdir -p "${AP_TMP_DIR}/wezterm"
    cd "${AP_TMP_DIR}/wezterm"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        curl -SL \
            "$(curl --silent https://api.github.com/repos/wezterm/wezterm/releases | jq -r '.[0].assets[].browser_download_url' | grep "macos" | grep -v sha256)" >wezterm.zip
        unzip wezterm.zip
        mv WezTerm* wezterm
        rm -rf "/Applications/WezTerm"
        mv "wezterm/WezTerm.app" /Applications/
        cd "/Applications"
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        curl -SL \
            "$(curl --silent https://api.github.com/repos/wezterm/wezterm/releases | jq -r '.[0].assets[].browser_download_url' | grep "Ubuntu22.04.deb$")" >wezterm.deb
        sudo dpkg -i wezterm.deb
    fi

    apinitwezterm
    if alias apcreatedirstructwezterm &>/dev/null; then
        apcreatedirstructwezterm
    fi
}

alias aprmwezterm="ap_func_rm_wezterm"
ap_func_rm_wezterm() {
    aplogshow "Remove [wezterm]\n"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        rm -rf "/Applications/WezTerm.app"
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        sudo dpkg --prune wezterm
    fi

    if alias aprmdirstructwezterm &>/dev/null; then
        aprmdirstructwezterm
    fi

    if alias aprmglobalsymlinkwezterm &>/dev/null; then
        aprmglobalsymlinkwezterm
    fi
}
