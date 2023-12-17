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
    ap_jdk_dl_dir="jdk-${AP_JDK_DL_VERSION}.0.1"
    export AP_VENDORS_JAVA_DIR="${AP_SOFT_DIR}/java/${ap_jdk_dl_dir}"
    ap_bin_path="${AP_VENDORS_JAVA_DIR}/bin"
fi

@logshow "Installing [jdk]\n"

cd "${AP_TMP_DIR}"
rm -rf "jdk-${AP_JDK_DL_VERSION}_${ap_os}-x64_bin.tar.gz" "${ap_jdk_dl_dir}"
curl -SOL "https://download.oracle.com/java/${AP_JDK_DL_VERSION}/latest/jdk-${AP_JDK_DL_VERSION}_${ap_os}-x64_bin.tar.gz"
tar -zxf jdk-${AP_JDK_DL_VERSION}_${ap_os}-x64_bin.tar.gz

rm -rf "${AP_VENDORS_JAVA_DIR}"
mkdir -p "${AP_SOFT_DIR}/java"
mv "${ap_jdk_dl_dir}" "${AP_VENDORS_JAVA_DIR}"

@addpath "${ap_bin_path}"

if [ -f "${ap_bin_path}/java" ]; then
    @logshowpassed "[jdk] has been installed successfully\n"
else
    @logshowfailed "[jdk] has been installed unsuccessfully\n"
fi

# if [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]]; then
# @logshow "Installing [jdk] using [brew]\n"
# brew install --cask oracle-jdk

# if brew list --versions | grep oracle-jdk &>/dev/null; then
#     @logshowpassed "[jdk] has been installed successfully using [brew]\n"
# else
#     @logshowfailed "[jdk] has been installed unsuccessfully using [brew]\n"
# fi
# elif [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]]; then
# @logshow "Installing [jdk]\n"

# cd "${AP_TMP_DIR}"
# rm -rf jdk-20_linux-x64_bin.tar.gz "jdk-${AP_JDK_DL_VERSION}"
# curl -SOL "https://download.oracle.com/java/20/latest/jdk-20_linux-x64_bin.tar.gz"
# tar -zxf jdk-20_linux-x64_bin.tar.gz

# rm -rf "${AP_VENDORS_JAVA_DIR}"
# mkdir -p "${AP_SOFT_DIR}/java"
# mv "jdk-${AP_JDK_DL_VERSION}" "${AP_SOFT_DIR}/java/"

# @addpath "${AP_VENDORS_JAVA_DIR}/bin"

# if type java &>/dev/null; then
#     @logshowpassed "[jdk] has been installed successfully\n"
# else
#     @logshowfailed "[jdk] has been installed unsuccessfully\n"
# fi
# fi
