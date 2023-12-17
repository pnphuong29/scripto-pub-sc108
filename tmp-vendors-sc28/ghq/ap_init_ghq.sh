# https://github.com/x-motemen/ghq

export GHQ_ROOT="${AP_PRJ_DIR}"

alias viscghq="vi -p \
	${AP_SCRIPTO_COMMON_DIR}/vendors/ghq/ap_init_ghq.sh \
	${AP_SCRIPTO_COMMON_DIR}/vendors/ghq/ap_setup_ghq.sh \
	${AP_SCRIPTO_COMMON_DIR}/vendors/ghq/ap_remove_ghq.sh \
	"

# if ! which go &>/dev/null; then
#     export AP_VENDORS_GHQ_DIR="${AP_SOFT_DIR}/ghq"
#     @addpath "${AP_VENDORS_GHQ_DIR}"
# fi
