export AP_JDK_DL_VERSION='21'

alias @initjava="ap_func_init_java"
ap_func_init_java() {
    local ap_jdk_dl_dir="jdk-${AP_JDK_DL_VERSION}.jdk"
    local ap_vendors_java_dir="${AP_SOFT_DIR}/java/${ap_jdk_dl_dir}"
    local ap_bin_path="${ap_vendors_java_dir}/Contents/Home/bin"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        ap_jdk_dl_dir="jdk-${AP_JDK_DL_VERSION}"
        ap_vendors_java_dir="${AP_SOFT_DIR}/java/${ap_jdk_dl_dir}"
        ap_bin_path="${ap_vendors_java_dir}/bin"
    fi

    if [ -d "${ap_bin_path}" ]; then
        @addpath "${ap_bin_path}"
    fi
}

alias @setupjava="ap_func_setup_java"
ap_func_setup_java() {
    # https://www.oracle.com/java/technologies/downloads/
    @logshow "Install [jdk ${AP_JDK_DL_VERSION}]\n"

    local ap_os="macos"
    local ap_jdk_dl_dir="jdk-${AP_JDK_DL_VERSION}.jdk"
    local ap_vendors_java_dir="${AP_SOFT_DIR}/java/${ap_jdk_dl_dir}"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        ap_os="linux"
        ap_jdk_dl_dir="jdk-${AP_JDK_DL_VERSION}.0.1"
        ap_vendors_java_dir="${AP_SOFT_DIR}/java/${ap_jdk_dl_dir}"
    fi

    cd "${AP_TMP_DIR}"
    rm -rf "jdk-${AP_JDK_DL_VERSION}_${ap_os}-x64_bin.tar.gz" "${ap_jdk_dl_dir}"
    curl -SOL "https://download.oracle.com/java/${AP_JDK_DL_VERSION}/latest/jdk-${AP_JDK_DL_VERSION}_${ap_os}-x64_bin.tar.gz"
    tar -zxf jdk-${AP_JDK_DL_VERSION}_${ap_os}-x64_bin.tar.gz

    rm -rf "${ap_vendors_java_dir}"
    mkdir -p "${AP_SOFT_DIR}/java"
    mv "${ap_jdk_dl_dir}" "${ap_vendors_java_dir}"

    # Load jdk init script
    @initjava
}

alias @rmjava="ap_func_remove_java"
ap_func_remove_java() {
    @logshow "Remove [java]\n"
    rm -rf "${AP_SOFT_DIR}/java"
}
