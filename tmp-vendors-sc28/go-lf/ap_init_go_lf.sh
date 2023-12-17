# https://github.com/gokcehan/lf
# https://github.com/gokcehan/lf/blob/master/doc.md

export AP_VENDORS_GO_LF_SETUP_DIR="${AP_SCRIPTO_COMMON_DIR}/vendors/go-lf"
export AP_VENDORS_GO_LF_SETUP_CONFIGS_DIR="${AP_VENDORS_GO_LF_SETUP_DIR}/configs"

[[ ! -d ~/.config/lf ]] && mkdir -p ~/.config/lf
ln -sf "${AP_VENDORS_GO_LF_SETUP_CONFIGS_DIR}/ap_lfrc.conf" ~/.config/lf/lfrc

alias zsclf='cd "${AP_VENDORS_GO_LF_SETUP_DIR}"'

alias visclf="vi -p \
	${AP_VENDORS_GO_LF_SETUP_DIR}/ap_init_go_lf.sh \
	${AP_VENDORS_GO_LF_SETUP_DIR}/ap_setup_go_lf.sh \
	${AP_VENDORS_GO_LF_SETUP_DIR}/ap_remove_go_lf.sh \
	${AP_VENDORS_GO_LF_SETUP_CONFIGS_DIR}/ap_lfrc.conf \
	"
