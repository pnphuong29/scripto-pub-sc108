#

export AP_VENDORS_XXX_SETUP_DIR="${AP_SCRIPTO_COMMON_DIR}/vendors/xxx"
export AP_VENDORS_XXX_REPO_URL=""
export AP_VENDORS_XXX_GH_DIR="${AP_GH_DIR}/xxx"
export AP_VENDORS_XXX_DIR="${AP_SOFT_DIR}/xxx"

if [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]]; then
    @logshow "Installing [xxx]\n"
    brew install xxx

    if brew list --versions | grep xxx &>/dev/null; then
        @logshowpassed "[xxx] has been installed successfully\n"
    else
        @logshowfailed "[xxx] has been installed unsuccessfully\n"
    fi
elif [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]]; then
    @logshow "Installing [xxx]\n"
    sudo apt install -y xxx
    sudo snap install xxx

    if which xxx &>/dev/null; then
        # if [[ ! -d "${ap_xxx_dir}" ]]; then
        @logshowpassed "[xxx] has been installed successfully\n"
    else
        @logshowfailed "[xxx] has been installed unsuccessfully\n"
    fi
fi

if which xxx &>/dev/null; then
    # if [[ ! -d "${ap_xxx_dir}" ]]; then
    @logshowpassed "[xxx] has been installed successfully\n"
    @minfo "Generating bash completion for xxx\n"
    mkdir -p "${AP_VENDORS_XXX_SETUP_DIR}/configs"
    xxx completion bash >"${AP_VENDORS_XXX_SETUP_DIR}/configs/ap_completion_xxx.bash"
    source "${AP_VENDORS_XXX_SETUP_DIR}/configs/ap_completion_xxx.bash"
else
    @logshowfailed "[xxx] has been installed unsuccessfully\n"
fi

mkdir -p "${AP_VENDORS_XXX_SETUP_DIR}/configs"
