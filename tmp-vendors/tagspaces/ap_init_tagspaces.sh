# https://www.tagspaces.org/
# https://github.com/nahoj/tss

export AP_VENDORS_TAGSPACES_SETUP_DIR="${AP_SCRIPTO_COMMON_DIR}/vendors/tagspaces"

# Uncomment below codes only if you use AppImage installed in `softwares` dir
# if [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]]; then
#     @addpath -a "${AP_SOFT_DIR}/tagspaces/5.5.4/bin"
# fi

alias tsgeneratethumbnails="tscmd -m thumbgen ."
alias tsclean="tscmd -m metacleaner ."
alias tsgenerateindexes="tscmd -m indexer ."

alias visctagspaces="vi -p \
	${AP_SCRIPTO_COMMON_DIR}/vendors/tagspaces/ap_init_tagspaces.sh \
	${AP_SCRIPTO_COMMON_DIR}/vendors/tagspaces/ap_setup_tagspaces.sh \
	${AP_SCRIPTO_COMMON_DIR}/vendors/tagspaces/ap_remove_tagspaces.sh \
	"
