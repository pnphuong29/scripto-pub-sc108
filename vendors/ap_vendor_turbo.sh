alias apinitturbo="ap_func_init_turbo"
ap_func_init_turbo() {
    alias turbofilter='turbo --filter'
    alias turboversion='turbo --version'
    alias turbohelp='turbo --help'
    alias npxturboupdate='npx @turbo/codemod@latest update'

    alias turborun='turbo run'
    alias turboclean='turbo run clean'
    alias turbolint='turbo run lint'
    alias turbobuild='turbo run build'
    alias turbodev='turbo run dev'

    if alias apinitturboshare &>/dev/null; then
        apinitturboshare
    fi

    if alias apinitturbocommon &>/dev/null; then
        apinitturbocommon
    fi

    if alias apinitturbomain &>/dev/null; then
        apinitturbomain
    fi
}

# alias apcreatedirstructturbo="ap_func_create_dirstruct_turbo"
# ap_func_create_dirstruct_turbo() {
#     aplogshow "Generate [turbo] bash autocomplete\n"
#     turbo >"${AP_COMPLETIONS_DIR}/ap_completion_turbo.bash"

#     if [ -f "${HOME}/scripto-share/vendors/turbo/bindings.json" ]; then
#         aplogshow "Create symlink from [${HOME}/.config/turbo/bindings.json] to [${HOME}/scripto-share/vendors/turbo/bindings.json]\n"
#         ln -sf "${HOME}/scripto-share/vendors/turbo/bindings.json" "${HOME}/.config/turbo/bindings.json"
#     fi

#     aplogshow "Create symlink from [${AP_SOFT_DIR}/bin/turbo] to [${AP_SOFT_DIR}/turbo/bin/turbo]\n"
#     ln -sf "${AP_SOFT_DIR}/turbo/bin/turbo" "${AP_SOFT_DIR}/bin/turbo"

#     aplogshow "Create symlink from [${AP_COMPLETIONS_DIR}/ap_completion_turbo.bash] to [${AP_SOFT_DIR}/turbo/complete/turbo.bash]\n"
#     ln -sf "${AP_SOFT_DIR}/turbo/autocomplete/turbo.bash" "${AP_COMPLETIONS_DIR}/ap_completion_turbo.bash"

#     aplogshow "Create symlink from [${AP_MAN_DIR}/man1/turbo.1] to [${AP_SOFT_DIR}/turbo/turbo.1]\n"
#     ln -sf "${AP_SOFT_DIR}/turbo/turbo.1" "${AP_MAN_DIR}/man1/turbo.1"

#     if alias apcreatedirstructturboshare &>/dev/null; then
#         apcreatedirstructturboshare
#     fi

#     if alias apcreatedirstructturbocommon &>/dev/null; then
#         apcreatedirstructturbocommon
#     fi

#     if alias apcreatedirstructturbomain &>/dev/null; then
#         apcreatedirstructturbomain
#     fi
# }

# alias aprmdirstructturbo="ap_func_rm_dirstruct_turbo"
# ap_func_rm_dirstruct_turbo() {
#     aplogshow "Remove [${AP_SOFT_DIR}/bin/turbo]\n"
#     rm -f "${AP_SOFT_DIR}/bin/turbo"

#     aplogshow "Remove [${AP_COMPLETIONS_DIR}/ap_completion_turbo.bash]\n"
#     rm -f "${AP_COMPLETIONS_DIR}/ap_completion_turbo.bash"

#     aplogshow "Remove [${AP_MAN_DIR}/man1/turbo.1]\n"
#     rm -f "${AP_MAN_DIR}/man1/turbo.1"

#     if alias aprmdirstructturboshare &>/dev/null; then
#         aprmdirstructturboshare
#     fi

#     if alias aprmdirstructturbocommon &>/dev/null; then
#         aprmdirstructturbocommon
#     fi

#     if alias aprmdirstructturbomain &>/dev/null; then
#         aprmdirstructturbomain
#     fi
# }

# alias apcreateglobalsymlinkturbo="ap_func_create_global_symlink_turbo"
# ap_func_create_global_symlink_turbo() {
#     if [ -f "${AP_SOFT_DIR}/bin/turbo" ]; then
#         aplogshow "Create symlink from [/usr/local/bin/turbo] to [${AP_SOFT_DIR}/bin/turbo]\n"
#         sudo ln -sf "${AP_SOFT_DIR}/bin/turbo" "/usr/local/bin/turbo"
#     fi
# }

# alias aprmglobalsymlinkturbo="ap_func_rm_global_symlink_turbo"
# ap_func_rm_global_symlink_turbo() {
#     if [ -f "/usr/local/bin/turbo" ]; then
#         aplogshow "Remove [/usr/local/bin/turbo]\n"
#         sudo rm -f "/usr/local/bin/turbo"
#     fi
# }

# alias apsetupturbo="ap_func_setup_turbo"
# ap_func_setup_turbo() {
#     local ap_turbo_setup_version=''
#     if [ -n "$1" ]; then
#         ap_turbo_setup_version="$1"
#     fi

#     aplogshow "Install [turbo] v${ap_turbo_setup_version}\n"

#     aplogshow "Install [turbo]\n"

#     # Remove old app dir if any
#     rm -rf "${AP_SOFT_DIR}/turbo"
#     rm -rf "${AP_TMP_DIR}/turbo"

#     # Install turbo
#     mkdir -p "${AP_TMP_DIR}/turbo"
#     cd "${AP_TMP_DIR}/turbo"

#     if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
#         brew install turbo
#         if [[ "$(uname -m)" == 'arm64' ]]; then
#             curl -SL \
#                 "$(curl --silent "https://api.github.com/repos/owner/turbo/releases" | jq -r '.[0].assets[].browser_download_url' | grep "macos" | grep arm | grep -v sha256)" >turbo.tar.gz
#         elif [[ "$(uname -m)" == 'x86_64' ]]; then
#             curl -SL \
#                 "$(curl --silent "https://api.github.com/repos/owner/turbo/releases" | jq -r '.[0].assets[].browser_download_url' | grep "macos" | grep x86_64 | grep -v sha256)" >turbo.tar.gz
#         fi

#         unzip turbo.zip
#         mv turbo* turbo
#         rm -rf "/Applications/turbo"
#         mv "turbo/turbo.app" /Applications/
#         cd "/Applications"

#         hdiutil attach -nobrowse turbo.dmg
#         cd "/Volumes/turbo"
#         cp -R "turbo.app" /Applications/
#         cd /Applications
#         hdiutil detach "/Volumes/turbo"
#     elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
#         curl -SL \
#             "$(curl --silent "https://api.github.com/repos/owner/turbo/releases" | jq -r '.[0].assets[].browser_download_url' | grep "linux" | grep x86_64 | grep -v sha256 | grep musl)" >turbo.tar.gz
#         sudo dpkg -i turbo.deb
#         sudo snap install -y turbo
#     fi

#     local ap_os="macos"
#     local ap_os="darwin"
#     if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
#         ap_os="linux"
#     fi

#     curl -SL \
#         "$(curl --silent https://api.github.com/repos/owner/turbo/releases | jq -r '.[0].assets[].browser_download_url' | grep "${ap_os}" | grep x86_64 | grep -v sha256)" >turbo.tar.gz

#     tar -zxf turbo.tar.gz
#     rm -f turbo.tar.gz
#     mv turbo* turbo
#     mv turbo "${AP_SOFT_DIR}/"
#     cd "${AP_SOFT_DIR}/turbo"
#     rm -rf "${AP_TMP_DIR}/turbo"

#     cargo install turbo
#     pip install turbo
#     npm install -g turbo

#     apinitturbo
#     if alias apcreatedirstructturbo &>/dev/null; then
#         apcreatedirstructturbo
#     fi
# }

# alias aprmturbo="ap_func_rm_turbo"
# ap_func_rm_turbo() {
#     local ap_turbo_remove_version=''
#     if [ -n "$1" ]; then
#         ap_turbo_remove_version="$1"
#     fi

#     aplogshow "Remove [turbo] v${ap_turbo_remove_version}\n"

#     aplogshow "Remove [turbo]\n"
#     cargo uninstall turbo
#     pip uninstall turbo
#     npm uninstall -g turbo

#     rm -rf "${GOPATH}/pkg/mod/github.com/turbo/turbo@"*
#     rm -f "${GOPATH}/bin/turbo"

#     rm -rf "${AP_SOFT_DIR}/turbo"

#     if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
#         rm -rf "/Applications/turbo"
#         brew remove --cask turbo
#     elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
#         sudo apt purge -y turbo
#         sudo snap remove --purge turbo
#         sudo dpkg --purge turbo
#     fi

#     if alias aprmdirstructturbo &>/dev/null; then
#         aprmdirstructturbo
#     fi

#     if alias aprmglobalsymlinkturbo &>/dev/null; then
#         aprmglobalsymlinkturbo
#     fi
# }
