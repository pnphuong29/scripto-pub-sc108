# https://github.com/kamiyaa/joshuto

export AP_VENDORS_RUST_JOSHUTO_SETUP_DIR="${AP_SCRIPTO_COMMON_DIR}/vendors/rust-joshuto"
export AP_VENDORS_RUST_JOSHUTO_SETUP_CONFIGS_DIR="${AP_VENDORS_RUST_JOSHUTO_SETUP_DIR}/configs"
export AP_VENDORS_RUST_JOSHUTO_REPO_URL="https://github.com/kamiyaa/joshuto"
export AP_VENDORS_RUST_JOSHUTO_GH_DIR="${AP_GH_DIR}/kamiyaa/joshuto"
export AP_URL_JOSHUTO_DOCS='https://github.com/kamiyaa/joshuto/tree/main/docs'

export JOSHUTO_CONFIG_HOME="${AP_VENDORS_RUST_JOSHUTO_SETUP_CONFIGS_DIR}"

# Preview image cache dir
[[ ! -d "${AP_TMP_DIR}/joshuto/preview-image-cache" ]] && mkdir -p "${AP_TMP_DIR}/joshuto/preview-image-cache"

alias openjoshutodocs='open "${AP_URL_JOSHUTO_DOCS}"'

alias viscjoshutoconfigs='vi -p \
	"${AP_VENDORS_RUST_JOSHUTO_SETUP_DIR}/ap_init_rust_joshuto.sh" \
	"${AP_VENDORS_RUST_JOSHUTO_SETUP_CONFIGS_DIR}/joshuto.toml" \
	"${AP_VENDORS_RUST_JOSHUTO_SETUP_CONFIGS_DIR}/keymap.toml" \
	"${AP_VENDORS_RUST_JOSHUTO_SETUP_CONFIGS_DIR}/mimetype.toml" \
	"${AP_VENDORS_RUST_JOSHUTO_SETUP_CONFIGS_DIR}/bookmarks.toml" \
	"${AP_VENDORS_RUST_JOSHUTO_SETUP_CONFIGS_DIR}/preview_file.sh"'

# bind Ctrl + <Space> as the shortcut key to joshuto command
# bind -x '"\C- ":"joshuto_wrapper"'
bind -x '"\C- ":"joshuto"'
