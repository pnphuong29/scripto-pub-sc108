#

export AP_VENDORS_XXX_SETUP_DIR="${AP_SCRIPTO_COMMON_DIR}/vendors/xxx"
export AP_VENDORS_XXX_REPO_URL=""
export AP_VENDORS_XXX_GH_DIR="${AP_GH_DIR}/xxx"
export AP_VENDORS_XXX_DIR="${AP_SOFT_DIR}/xxx"

if [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]]; then
    @logshow "Removing [xxx]\n"
    brew uninstall xxx

    if ! brew list --versions | grep xxx &>/dev/null; then
        @logshowpassed "[xxx] has been removed successfully\n"
    else
        @logshowfailed "[xxx] has been removed unsuccessfully\n"
    fi
elif [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]]; then
    @logshow "Removing [xxx]\n"
    sudo apt purge -y xxx
    sudo apt autoremove -y
    sudo snap remove --purge xxx

    if ! which xxx &>/dev/null; then
        # if [[ ! -d "${ap_xxx_dir}" ]]; then
        @logshowpassed "[xxx] has been removed successfully\n"
    else
        @logshowfailed "[xxx] has been removed unsuccessfully\n"
    fi
fi

if ! which xxx &>/dev/null; then
    # if [[ ! -d "${ap_xxx_dir}" ]]; then
    @logshowpassed "[xxx] has been removed successfully\n"
else
    @logshowfailed "[xxx] has been removed unsuccessfully\n"
fi
