#

export AP_VENDORS_XXX_SETUP_DIR="${AP_SCRIPTO_COMMON_DIR}/vendors/xxx"
export AP_VENDORS_XXX_REPO_URL=""
export AP_VENDORS_XXX_GH_DIR="${AP_GH_DIR}/xxx"
export AP_VENDORS_XXX_DIR="${AP_SOFT_DIR}/xxx"

alias viscxxx="vi -p \
	${AP_SCRIPTO_COMMON_DIR}/vendors/xxx/ap_init_xxx.sh \
	${AP_SCRIPTO_COMMON_DIR}/vendors/xxx/ap_setup_xxx.sh \
	${AP_SCRIPTO_COMMON_DIR}/vendors/xxx/ap_remove_xxx.sh \
	"

if [ -f "${AP_VENDORS_XXX_SETUP_DIR}/configs/ap_completion_xxx.bash" ]; then
    source "${AP_VENDORS_XXX_SETUP_DIR}/configs/ap_completion_xxx.bash"
else
    @merr "Cannot find [${AP_VENDORS_XXX_SETUP_DIR}/configs/ap_completion_xxx.bash]\n"
    @minfo "Generating bash completion for xxx\n"
    mkdir -p "${AP_VENDORS_XXX_SETUP_DIR}/configs"
    xxx completion bash >"${AP_VENDORS_XXX_SETUP_DIR}/configs/ap_completion_xxx.bash"
    source "${AP_VENDORS_XXX_SETUP_DIR}/configs/ap_completion_xxx.bash"
fi
