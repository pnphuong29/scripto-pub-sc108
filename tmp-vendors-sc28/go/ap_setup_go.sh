# https://go.dev/doc/install
# https://go.dev/doc/manage-install
# https://stackoverflow.com/questions/1210664/no-module-named-sqlite3

@logshow "Installing [go]\n"

ap_go_version='1.21.4'
ap_go_dir_name="go"

if [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]]; then
    export ap_go_src_file_name="go${ap_go_version}.darwin-amd64.tar.gz"
else
    export ap_go_src_file_name="go${ap_go_version}.linux-amd64.tar.gz"
fi

export AP_VENDORS_GO_DIR="${AP_SOFT_DIR}/go"
rm -rf "${AP_VENDORS_GO_DIR}" # Remove old go directory if any

export GOROOT="${AP_SOFT_DIR}/go"
export GOPATH="${HOME}/go"
ap_go_url="https://golang.org/dl/${ap_go_src_file_name}"

cd "${AP_TMP_DIR}"
rm -rf "${ap_go_dir_name}"

curl -LO "${ap_go_url}"
tar -zxf "${ap_go_src_file_name}"

[[ ! -d "${AP_VENDORS_GO_DIR}" ]] && mkdir -p "${AP_VENDORS_GO_DIR}"
cp -R "${ap_go_dir_name}"/. "${AP_VENDORS_GO_DIR}/"
rm -rf "${ap_go_dir_name}"

@addpath -a "${GOROOT}/bin"
@addpath -a "${GOPATH}/bin"

if type go &>/dev/null; then
    @logshowpassed "[go] has been installed successfully\n"

    @minfo "Installing gopls\n"
    go install golang.org/x/tools/gopls@latest

    @minfo "Installing go debugger [go-delve]\n"
    go install github.com/go-delve/delve/cmd/dlv@latest

    @minfo "Installing go linter [go-tools]\n"
    go install honnef.co/go/tools/cmd/staticcheck@2022.1.3
else
    @logshowfailed "[go] has been installed unsuccessfully\n"
fi
