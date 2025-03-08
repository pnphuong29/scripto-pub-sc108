alias apinitjava="ap_func_init_java"
ap_func_init_java() {
    export AP_JDK_SETUP_VERSION='21'

    local ap_java_dir="${AP_SOFT_DIR}/java/jdk-${AP_JDK_SETUP_VERSION}.jdk"
    local ap_bin_path="${ap_java_dir}/Contents/Home/bin"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        export JAVA_HOME="${ap_java_dir}/Contents/Home"
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        export JAVA_HOME="${ap_java_dir}"
        ap_bin_path="${ap_java_dir}/bin"
    fi

    if [ -d "${ap_bin_path}" ]; then
        apaddpath "${ap_bin_path}"
    fi

    if alias apinitjavashare &>/dev/null; then
        apinitjavashare
    fi

    if alias apinitjavacommon &>/dev/null; then
        apinitjavacommon
    fi
}

alias apcreatedirstructjava="ap_func_create_dirstruct_java"
ap_func_create_dirstruct_java() {
    if alias apcreatedirstructjavashare &>/dev/null; then
        apcreatedirstructjavashare
    fi

    if alias apcreatedirstructjavacommon &>/dev/null; then
        apcreatedirstructjavacommon
    fi
}

alias aprmdirstructjava="ap_func_rm_dirstruct_java"
ap_func_rm_dirstruct_java() {
    if alias aprmdirstructjavashare &>/dev/null; then
        aprmdirstructjavashare
    fi

    if alias aprmdirstructjavacommon &>/dev/null; then
        aprmdirstructjavacommon
    fi
}

alias apsetupjava="ap_func_setup_java"
ap_func_setup_java() {
    # https://www.oracle.com/java/technologies/downloads/
    aplogshow "Install [JDK v${AP_JDK_SETUP_VERSION}]\n"

    local ap_os="macos"
    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        ap_os="linux"
    fi
    local ap_vendors_java_dir="${AP_SOFT_DIR}/java/jdk-${AP_JDK_SETUP_VERSION}.jdk"

    cd "${AP_TMP_DIR}"
    rm -rf "jdk-${AP_JDK_SETUP_VERSION}_${ap_os}-x64_bin.tar.gz" "jdk-${AP_JDK_SETUP_VERSION}"*.jdk
    curl -SOL "https://download.oracle.com/java/${AP_JDK_SETUP_VERSION}/latest/jdk-${AP_JDK_SETUP_VERSION}_${ap_os}-x64_bin.tar.gz"
    tar -zxf "jdk-${AP_JDK_SETUP_VERSION}_${ap_os}-x64_bin.tar.gz"

    rm -rf "${ap_vendors_java_dir}"
    mkdir -p "${AP_SOFT_DIR}/java"
    rm -f "jdk-${AP_JDK_SETUP_VERSION}_${ap_os}-x64_bin.tar.gz"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        mv "jdk-${AP_JDK_SETUP_VERSION}"*.jdk "jdk-${AP_JDK_SETUP_VERSION}.jdk"
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        mv "jdk-${AP_JDK_SETUP_VERSION}"* "jdk-${AP_JDK_SETUP_VERSION}.jdk"
    fi

    mv "jdk-${AP_JDK_SETUP_VERSION}.jdk" "${ap_vendors_java_dir}"

    apinitjava
    if alias apcreatedirstructjava &>/dev/null; then
        apcreatedirstructjava
    fi
}

alias aprmjava="ap_func_rm_java"
ap_func_rm_java() {
    aplogshow "Remove [java]\n"
    rm -rf "${AP_SOFT_DIR}/java"

    if alias aprmdirstructjava &>/dev/null; then
        aprmdirstructjava
    fi

    if alias aprmglobalsymlinkjava &>/dev/null; then
        aprmglobalsymlinkjava
    fi
}
