# https://www.oracle.com/java/technologies/downloads/
export AP_VENDORS_JAVA_SETUP_DIR="${AP_SCRIPTO_COMMON_DIR}/vendors/java"
export AP_JDK_DL_VERSION='21'

if [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]]; then
    ap_os="macos"
    ap_jdk_dl_dir="jdk-${AP_JDK_DL_VERSION}.jdk"
    export AP_VENDORS_JAVA_DIR="${AP_SOFT_DIR}/java/${ap_jdk_dl_dir}"
    ap_bin_path="${AP_VENDORS_JAVA_DIR}/Contents/Home/bin"
elif [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]]; then
    ap_os="linux"
    ap_jdk_dl_dir="jdk-${AP_JDK_DL_VERSION}"
    export AP_VENDORS_JAVA_DIR="${AP_SOFT_DIR}/java/${ap_jdk_dl_dir}"
    ap_bin_path="${AP_VENDORS_JAVA_DIR}/bin"
fi

if [ -d ${ap_bin_path} ]; then
    @addpath "${ap_bin_path}"
fi
