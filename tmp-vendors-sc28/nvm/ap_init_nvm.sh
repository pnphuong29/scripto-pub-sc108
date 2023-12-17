# https://github.com/nvm-sh/nvm
# https://docs.npmjs.com/cli/v6/using-npm/removal

# NVM's installation directory.
export NVM_DIR="${HOME}/.nvm"

if [[ -d ~/.yarn/bin ]]; then
    @addpath ~/.yarn/bin
fi

# Load nvm
[ -s "${NVM_DIR}/nvm.sh" ] && \. "${NVM_DIR}/nvm.sh"                   # This loads nvm
[ -s "${NVM_DIR}/bash_completion" ] && \. "${NVM_DIR}/bash_completion" # This loads nvm bash_completion

# where node, npm, and global packages for the active version of node are installed.
# export NVM_BIN="${NVM_DIR}/bin"

# node's include file directory (useful for building C/C++ addons for node).
# export NVM_INC="${NVM_DIR}/inc"

# version from .nvmrc file if being used.
# export NVM_RC_VERSION

# export NVM_COLORS='cmgRY'

eval "$(npm completion)"

alias viscnvm="vi -p \
	${AP_SCRIPTO_COMMON_DIR}/vendors/nvm/ap_init_nvm.sh \
	${AP_SCRIPTO_COMMON_DIR}/vendors/nvm/ap_setup_nvm.sh \
	${AP_SCRIPTO_COMMON_DIR}/vendors/nvm/ap_remove_nvm.sh \
	"

# @$alias $$ ap_func_nvm_create_global_symlinks {
alias ap_alias_nvm_create_global_symlinks='ap_func_nvm_create_global_symlinks'
alias nvmcreateglobalsymlink='ap_func_nvm_create_global_symlinks'
# }

# @$func $$ ap_func_nvm_create_global_symlinks {
# ap_func_nvm_create_global_symlinks
# Description
# 	Create global symbolic link for node, npm and yarn
# Return status
#	AP_CODE_SUCCESS
# }
ap_func_nvm_create_global_symlinks() {
    local ap_path="$(type node | cut -d ' ' -f 3)"
    sudo ln -sf "${ap_path}" /usr/local/bin/node

    ap_path="$(type npm | cut -d ' ' -f 3)"
    sudo ln -sf "${ap_path}" /usr/local/bin/npm

    ap_path="$(type yarn | cut -d ' ' -f 3)"
    sudo ln -sf "${ap_path}" /usr/local/bin/yarn

    @rtn_success
}

# @$alias $$ ap_func_nvm_remove_global_symlinks {
alias ap_alias_nvm_remove_global_symlinks='ap_func_nvm_remove_global_symlinks'
alias nvmrmglobalsymlink='ap_func_nvm_remove_global_symlinks'
# }

# @$func $$ ap_func_nvm_remove_global_symlinks {
# ap_func_nvm_remove_global_symlinks
# Description
# 	Remove global symbolic link for node, npm and yarn
# Return status
#	AP_CODE_SUCCESS
# }
ap_func_nvm_remove_global_symlinks() {
    [[ -L /usr/local/bin/node ]] && sudo rm -f /usr/local/bin/node
    [[ -L /usr/local/bin/npm ]] && sudo rm -f /usr/local/bin/npm
    [[ -L /usr/local/bin/yarn ]] && sudo rm -f /usr/local/bin/yarn
    @rtn_success
}
