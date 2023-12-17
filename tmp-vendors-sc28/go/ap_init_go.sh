# https://go.dev/doc/gopath_code
# https://github.com/golang/go/wiki/SettingGOPATH
# https://pkg.go.dev/cmd/go#hdr-GOPATH_environment_variable

export AP_VENDORS_GO_DIR="${AP_SOFT_DIR}/go"
export GOROOT="${AP_SOFT_DIR}/go"

# Location of your workspace
export GOPATH="${HOME}/go"

@addpath "${GOROOT}/bin"
@addpath "${GOPATH}/bin"

alias zgopath='cd "${GOPATH}"'
alias zgomodules='cd "${GOPATH}/pkg/mod"'
alias zgobin='cd "${GOPATH}/bin"'

alias viscgo="vi -p \
	${AP_SCRIPTO_COMMON_DIR}/vendors/go/ap_init_go.sh \
	${AP_SCRIPTO_COMMON_DIR}/vendors/go/ap_setup_go.sh \
	${AP_SCRIPTO_COMMON_DIR}/vendors/go/ap_remove_go.sh \
	"
