alias @initwezterm="ap_func_init_wezterm"
ap_func_init_wezterm() {
    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        @addpath "/Applications/WezTerm.app/Contents/MacOS"
    fi

    # export WEZTERM_CONFIG_FILE="${HOME}/scripto-common/vendors/wezterm/ap_wezterm.config.lua"
    # https://wezfurlong.org/wezterm/config/lua/config/term.html
    alias @weztermgenerateterminfo='curl -SL "https://raw.githubusercontent.com/wez/wezterm/main/termwiz/data/wezterm.terminfo" >"${HOME}/scripto-common/vendors/wezterm/ap_wezterm.terminfo"'
    alias viscwezterm="vi -p \
        \${HOME}/scripto/vendors/ap_vendor_wezterm.sh \
        \${HOME}/scripto-common/vendors/ap_vendor_wezterm.sh \
        \${HOME}/scripto-common/vendors/wezterm/ap_wezterm.config.lua \
	"
}

alias @createdirstructwezterm="ap_func_create_dirstruct_wezterm"
ap_func_create_dirstruct_wezterm() {
    @logshow "Generate [wezterm] bash autocomplete at [${AP_COMPLETIONS_DIR}/ap_completion_wezterm.bash]\n"
    wezterm shell-completion --shell bash >"${AP_COMPLETIONS_DIR}/ap_completion_wezterm.bash"

    # Term info
    # https://wezfurlong.org/wezterm/config/lua/config/term.html
    # @logshow "Installing terminfo for wezterm\n"
    # curl -SL "https://raw.githubusercontent.com/wez/wezterm/main/termwiz/data/wezterm.terminfo" >"${HOME}/scripto-common/vendors/wezterm/ap_wezterm.terminfo"
    # sudo tic -x -o ~/.terminfo "${HOME}/scripto-common/vendors/wezterm/ap_wezterm.terminfo"
    # sudo chown "${USER}" ~/.terminfo

    if alias @createdirstructweztermcommon &>/dev/null; then
        @createdirstructweztermcommon
    fi
}

alias @rmdirstructwezterm="ap_func_rm_dirstruct_wezterm"
ap_func_rm_dirstruct_wezterm() {
    @logshow "Remove [${AP_COMPLETIONS_DIR}/ap_completion_wezterm.bash]\n"
    rm -f "${AP_COMPLETIONS_DIR}/ap_completion_wezterm.bash"

    if alias @rmdirstructweztermcommon &>/dev/null; then
        @rmdirstructweztermcommon
    fi
}

alias @setupwezterm="ap_func_setup_wezterm"
ap_func_setup_wezterm() {
    # https://wezfurlong.org/wezterm/installation.html
    @logshow "Install [wezterm]\n"

    rm -rf "${AP_TMP_DIR}/wezterm"
    mkdir -p "${AP_TMP_DIR}/wezterm"
    cd "${AP_TMP_DIR}/wezterm"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        curl -SL \
            "$(curl --silent https://api.github.com/repos/wez/wezterm/releases | jq -r '.[0].assets[].browser_download_url' | grep "macos" | grep -v sha256)" >wezterm.zip
        unzip wezterm.zip
        mv WezTerm* wezterm
        rm -rf "/Applications/WezTerm"
        mv "wezterm/WezTerm.app" /Applications/
        cd "/Applications"
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        curl -SL \
            "$(curl --silent https://api.github.com/repos/wez/wezterm/releases | jq -r '.[0].assets[].browser_download_url' | grep "Ubuntu22.04.deb$")" >wezterm.deb
        sudo dpkg -i wezterm.deb
    fi

    if alias @createdirstructwezterm &>/dev/null; then
        @createdirstructwezterm
    fi
}

alias @rmwezterm="ap_func_rm_wezterm"
ap_func_rm_wezterm() {
    @logshow "Remove [wezterm]\n"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        rm -rf "/Applications/WezTerm.app"
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        sudo dpkg --prune wezterm
    fi

    if alias @rmdirstructwezterm &>/dev/null; then
        @rmdirstructwezterm
    fi
}
