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

@logshow "Removing [jdk]\n"
rm -rf "${AP_VENDORS_JAVA_DIR}"

if [[ ! -d "${AP_VENDORS_JAVA_DIR}" ]]; then
    @logshowpassed "[jdk] has been removed successfully\n"
else
    @logshowfailed "[jdk] has been removed unsuccessfully\n"
fi

# if [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]]; then
#     @logshow "Removing [jdk] using [brew]\n"
#     brew uninstall oracle-jdk

#     if ! brew list --versions | grep oracle-jdk &>/dev/null; then
#         @logshowpassed "[jdk] has been removed successfully using [brew]\n"
#     else
#         @logshowfailed "[jdk] has been removed unsuccessfully using [brew]\n"
#     fi
# elif [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]]; then
#     @logshow "Removing [jdk]\n"
#     rm -rf "${AP_VENDORS_JAVA_DIR}"

#     if [[ ! -d "${AP_VENDORS_JAVA_DIR}" ]]; then
#         @logshowpassed "[jdk] has been removed successfully\n"
#     else
#         @logshowfailed "[jdk] has been removed unsuccessfully\n"
#     fi
# fi
