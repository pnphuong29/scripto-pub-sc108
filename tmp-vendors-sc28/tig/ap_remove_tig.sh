# https://jonas.github.io/tig/INSTALL.html

export AP_VENDORS_TIG_SETUP_DIR="${AP_SCRIPTO_COMMON_DIR}/vendors/tig"
export AP_VENDORS_TIG_SETUP_CONFIGS_DIR="${AP_VENDORS_XXX_SETUP_DIR}/configs"
export AP_VENDORS_TIG_REPO_URL="https://github.com/jonas/tig.git"
export AP_VENDORS_TIG_GH_DIR="${AP_GH_DIR}/jonas/tig"

ghq get "${AP_VENDORS_TIG_REPO_URL}"
cd "${AP_VENDORS_TIG_GH_DIR}"
make
make uninstall
