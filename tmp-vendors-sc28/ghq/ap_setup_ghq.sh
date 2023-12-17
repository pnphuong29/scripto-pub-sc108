# https://github.com/x-motemen/ghq

# if ! which ghq &>/dev/null; then
#     @logshow "Installing [ghq]\n"

#     if which go &>/dev/null; then
#         go install github.com/x-motemen/ghq@latest
#     else
#         export AP_VENDORS_GHQ_DIR="${AP_SOFT_DIR}/ghq"

#         ap_os_type="linux"
#         if [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]]; then
#             ap_os_type="darwin"
#         fi

#         curl -L "https://github.com/x-motemen/ghq/releases/download/v1.4.2/ghq_${ap_os_type}_amd64.zip" -o "${AP_TMP_DIR}/ghq.zip"
#         rm -rf "${AP_VENDORS_GHQ_DIR}" # Remove old ghq
#         unzip -jqo "${AP_TMP_DIR}/ghq.zip" -d "${AP_VENDORS_GHQ_DIR}"
#         @addpath "${AP_VENDORS_GHQ_DIR}"
#     fi
# fi

go install github.com/x-motemen/ghq@latest

export GHQ_ROOT="${AP_PRJ_DIR}"

if which ghq &>/dev/null; then
    @logshowpassed "[ghq] has been installed successfully\n"
else
    @logshowfailed "[ghq] has been installed unsuccessfully\n"
fi
