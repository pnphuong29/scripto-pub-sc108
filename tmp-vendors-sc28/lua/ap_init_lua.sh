#

export AP_VENDORS_LUA_SETUP_DIR="${AP_SCRIPTO_COMMON_DIR}/vendors/lua"
export AP_VENDORS_LUA_REPO_URL=""
export AP_VENDORS_LUA_GH_DIR="${AP_GH_DIR}/lua"
export AP_VENDORS_LUA_DIR="${AP_SOFT_DIR}/lua"

alias visclua="vi -p \
	${AP_SCRIPTO_COMMON_DIR}/vendors/lua/ap_init_lua.sh \
	${AP_SCRIPTO_COMMON_DIR}/vendors/lua/ap_setup_lua.sh \
	${AP_SCRIPTO_COMMON_DIR}/vendors/lua/ap_remove_lua.sh \
	"

if [ -f "${AP_VENDORS_LUA_SETUP_DIR}/configs/ap_completion_luarocks.bash" ]; then
    source "${AP_VENDORS_LUA_SETUP_DIR}/configs/ap_completion_luarocks.bash"
else
    @merr "Cannot find [${AP_VENDORS_LUA_SETUP_DIR}/configs/ap_completion_luarocks.bash]\n"
    @minfo "Generating bash completion for luarocks\n"
    mkdir -p "${AP_VENDORS_LUA_SETUP_DIR}/configs"
    luarocks completion bash >"${AP_VENDORS_LUA_SETUP_DIR}/configs/ap_completion_luarocks.bash"
    source "${AP_VENDORS_LUA_SETUP_DIR}/configs/ap_completion_luarocks.bash"
fi
