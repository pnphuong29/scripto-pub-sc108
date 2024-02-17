alias @initjava="ap_func_init_java"
ap_func_init_java() {
    export AP_JDK_SETUP_VERSION='21'

    # TODO: Test JAVA installation in macOS
    local ap_jdk_dl_dir="jdk-${AP_JDK_SETUP_VERSION}.jdk"
    local ap_java_dir="${AP_SOFT_DIR}/java/${ap_jdk_dl_dir}"
    local ap_bin_path="${ap_java_dir}/Contents/Home/bin"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        ap_jdk_dl_dir="jdk-${AP_JDK_SETUP_VERSION}.0.2"
        ap_java_dir="${AP_SOFT_DIR}/java/${ap_jdk_dl_dir}"
        ap_bin_path="${ap_java_dir}/bin"
    fi

    if [ -d "${ap_bin_path}" ]; then
        @addpath "${ap_bin_path}"
    fi

    if alias @initjavashare &>/dev/null; then
        @initjavashare
    fi

    if alias @initjavacommon &>/dev/null; then
        @initjavacommon
    fi
}

alias @createdirstructjava="ap_func_create_dirstruct_java"
ap_func_create_dirstruct_java() {
    if alias @createdirstructjavashare &>/dev/null; then
        @createdirstructjavashare
    fi

    if alias @createdirstructjavacommon &>/dev/null; then
        @createdirstructjavacommon
    fi
}

alias @rmdirstructjava="ap_func_rm_dirstruct_java"
ap_func_rm_dirstruct_java() {
    if alias @rmdirstructjavashare &>/dev/null; then
        @rmdirstructjavashare
    fi

    if alias @rmdirstructjavacommon &>/dev/null; then
        @rmdirstructjavacommon
    fi
}

alias @setupjava="ap_func_setup_java"
ap_func_setup_java() {
    # https://www.oracle.com/java/technologies/downloads/
    @logshow "Install [JDK v${AP_JDK_SETUP_VERSION}]\n"

    local ap_os="macos"
    local ap_jdk_dl_dir="jdk-${AP_JDK_SETUP_VERSION}.jdk"
    local ap_vendors_java_dir="${AP_SOFT_DIR}/java/${ap_jdk_dl_dir}"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        ap_os="linux"
        ap_jdk_dl_dir="jdk-${AP_JDK_SETUP_VERSION}.0.2"
        ap_vendors_java_dir="${AP_SOFT_DIR}/java/${ap_jdk_dl_dir}"
    fi

    cd "${AP_TMP_DIR}"
    rm -rf "jdk-${AP_JDK_SETUP_VERSION}_${ap_os}-x64_bin.tar.gz" "${ap_jdk_dl_dir}"
    curl -SOL "https://download.oracle.com/java/${AP_JDK_SETUP_VERSION}/latest/jdk-${AP_JDK_SETUP_VERSION}_${ap_os}-x64_bin.tar.gz"
    tar -zxf jdk-${AP_JDK_SETUP_VERSION}_${ap_os}-x64_bin.tar.gz

    rm -rf "${ap_vendors_java_dir}"
    mkdir -p "${AP_SOFT_DIR}/java"
    mv "${ap_jdk_dl_dir}" "${ap_vendors_java_dir}"

    @initjava
    if alias @createdirstructjava &>/dev/null; then
        @createdirstructjava
    fi
}

alias @rmjava="ap_func_rm_java"
ap_func_rm_java() {
    @logshow "Remove [java]\n"
    rm -rf "${AP_SOFT_DIR}/java"

    if alias @rmdirstructjava &>/dev/null; then
        @rmdirstructjava
    fi

    if alias @rmglobalsymlinkjava &>/dev/null; then
        @rmglobalsymlinkjava
    fi
}
