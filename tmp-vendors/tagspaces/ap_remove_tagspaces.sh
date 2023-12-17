# https://www.tagspaces.org/
# https://github.com/nahoj/tss

export AP_VENDORS_TAGSPACES_SETUP_DIR="${AP_SCRIPTO_COMMON_DIR}/vendors/tagspaces"

# ghq get https://github.com/nahoj/tss
# cd "${AP_GH_DIR}/nahoj/tss"
# make uninstall

npm uninstall -g @tagspaces/shell

if [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]]; then
    rm -rf /Applications/TagSpaces.app
elif [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]]; then
    sudo dpkg --remove tagspaces
    # rm -rf "${AP_SOFT_DIR}/tagspaces"
fi
