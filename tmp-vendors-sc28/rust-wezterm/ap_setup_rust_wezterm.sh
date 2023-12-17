# https://wezfurlong.org/wezterm/installation.html

export AP_VENDORS_RUST_WEZTERM_SETUP_DIR="${AP_SCRIPTO_COMMON_DIR}/vendors/rust-wezterm"
export AP_VENDORS_RUST_WEZTERM_SETUP_CONFIGS_DIR="${AP_VENDORS_RUST_WEZTERM_SETUP_DIR}/configs"
export AP_VENDORS_RUST_WEZTERM_REPO_URL="https://github.com/wez/wezterm"
export AP_VENDORS_RUST_WEZTERM_GH_DIR="${AP_GH_DIR}/wez/wezterm"

if ! which wezterm &>/dev/null; then
    @logshow "Installing [wezterm]\n"

    # Install wezterm
    if [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]]; then
        brew tap wez/wezterm
        brew install --cask wez/wezterm/wezterm
    elif [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]]; then
        # curl -SL "${AP_VENDORS_RUST_WEZTERM_REPO_URL}/releases/download/20220905-102802-7d4b8249/wezterm-20220905-102802-7d4b8249.Ubuntu22.04.deb" >"${AP_TMP_DIR}/wezterm.deb"
        # sudo dpkg -i "${AP_TMP_DIR}/wezterm.deb"
        curl -SL https://github.com/wez/wezterm/releases/download/20230712-072601-f4abf8fd/wezterm-20230712-072601-f4abf8fd.Ubuntu22.04.deb >"${AP_TMP_DIR}/wezterm.deb"
        sudo apt install -y "${AP_TMP_DIR}/wezterm.deb"
    fi

    # Bash completion
    @logshow "Generating bash completion\n"
    wezterm shell-completion --shell bash >"${AP_VENDORS_RUST_WEZTERM_SETUP_CONFIGS_DIR}/ap_completion_wezterm.bash"

    # Term info
    # https://wezfurlong.org/wezterm/config/lua/config/term.html
    # @logshow "Installing terminfo for wezterm\n"
    # curl -SL "https://raw.githubusercontent.com/wez/wezterm/main/termwiz/data/wezterm.terminfo" >"${AP_VENDORS_RUST_WEZTERM_SETUP_CONFIGS_DIR}/ap_wezterm.terminfo"
    # sudo tic -x -o ~/.terminfo "${AP_VENDORS_RUST_WEZTERM_SETUP_CONFIGS_DIR}/ap_wezterm.terminfo"
    # sudo chown "${USER}" ~/.terminfo

    if which wezterm &>/dev/null; then
        @logshowpassed "[wezterm] has been installed successfully\n"
    else
        @logshowfailed "[wezterm] has been installed unsuccessfully\n"
    fi
fi
