alias @initgo="ap_func_init_go"
ap_func_init_go() {
    # https://go.dev/doc/gopath_code
    # https://github.com/golang/go/wiki/SettingGOPATH
    # https://pkg.go.dev/cmd/go#hdr-GOPATH_environment_variable

    export GOROOT="${AP_SOFT_DIR}/go"
    export GOPATH="${HOME}/go"

    @addpath "${GOROOT}/bin"
    @addpath "${GOPATH}/bin"

    alias zgopath="cd \${GOPATH}"
    alias zgomodules="cd \${GOPATH}/pkg/mod"
    alias zgobin="cd \${GOPATH}/bin"
}

alias @setupgo="ap_func_setup_go"
ap_func_setup_go() {
    # https://go.dev/doc/install
    # https://go.dev/doc/manage-install
    # https://stackoverflow.com/questions/1210664/no-module-named-sqlite3

    local ap_go_version='1.21.4'
    local ap_go_dir_name="go"
    local ap_go_src_file_name="go${ap_go_version}.darwin-amd64.tar.gz"

    @logshow "Install [GO v${ap_go_version}]\n"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        ap_go_src_file_name="go${ap_go_version}.linux-amd64.tar.gz"
    fi

    local ap_vendors_go_dir="${AP_SOFT_DIR}/go"
    rm -rf "${ap_vendors_go_dir}" # Remove old go directory if any

    export GOROOT="${AP_SOFT_DIR}/go"
    export GOPATH="${HOME}/go"
    ap_go_url="https://golang.org/dl/${ap_go_src_file_name}"

    cd "${AP_TMP_DIR}"
    rm -rf "${ap_go_dir_name}"

    curl -LO "${ap_go_url}"
    tar -zxf "${ap_go_src_file_name}"

    [ ! -d "${ap_vendors_go_dir}" ] && mkdir -p "${ap_vendors_go_dir}"
    cp -R "${ap_go_dir_name}"/. "${ap_vendors_go_dir}/"
    rm -rf "${ap_go_dir_name}"

    @addpath -a "${GOROOT}/bin"
    @addpath -a "${GOPATH}/bin"
}

alias @rmgo="ap_func_remove_go"
ap_func_remove_go() {
    @logshow "Remove [go]\n"

    local ap_go_path, ap_go_root
    ap_go_path="$(go env GOPATH)"
    ap_go_root="$(go env GOROOT)"

    # Remove go libraries
    rm -rf "${ap_go_path}"

    # Remove main go dir
    rm -rf "${ap_go_root}"
}
