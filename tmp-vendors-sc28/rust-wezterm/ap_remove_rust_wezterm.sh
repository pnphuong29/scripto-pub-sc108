# https://wezfurlong.org/wezterm/installation.html

export AP_VENDORS_RUST_WEZTERM_SETUP_DIR="${AP_SCRIPTO_COMMON_DIR}/vendors/rust-wezterm"
export AP_VENDORS_RUST_WEZTERM_SETUP_CONFIGS_DIR="${AP_VENDORS_RUST_WEZTERM_SETUP_DIR}/configs"
export AP_VENDORS_RUST_WEZTERM_REPO_URL="https://github.com/wez/wezterm"
export AP_VENDORS_RUST_WEZTERM_GH_DIR="${AP_GH_DIR}/wez/wezterm"

if which wezterm &>/dev/null; then
    @logshow "Removing [wezterm]\n"

    if [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]]; then
        brew uninstall --cask wez/wezterm/wezterm
    elif [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]]; then
        sudo dpkg --purge wezterm
    fi

    rm -f ~/.wezterm.lua

    if ! which wezterm &>/dev/null; then
        @logshowpassed "[wezterm] has been removed successfully\n"
    else
        @logshowfailed "[wezterm] has been removed unsuccessfully\n"
    fi
fi
