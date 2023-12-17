# Dependencies: fzf, nodejs

export AP_VENDORS_NVIM_SETUP_DIR="${AP_SCRIPTO_COMMON_DIR}/vendors/nvim"
export AP_VENDORS_NVIM_SETUP_CONFIGS_DIR="${AP_VENDORS_NVIM_SETUP_DIR}/configs"
export AP_VENDORS_NVIM_REPO_URL="https://github.com/neovim/neovim"
export AP_VENDORS_NVIM_DIR="${AP_SOFT_DIR}/nvim"

export AP_NVIM_PYTHON_LOG_FILE="${AP_LOGS_DIR}/nvim/python.log"
if [[ ! -d "${AP_NVIM_PYTHON_LOG_FILE%/*}" ]]; then
    mkdir -p "${AP_NVIM_PYTHON_LOG_FILE%/*}"
    touch "${AP_NVIM_PYTHON_LOG_FILE}"
fi

# Update PATH
@addpath "${AP_VENDORS_NVIM_DIR}/bin"

# Create symlink
ln -sf "${AP_VENDORS_NVIM_SETUP_CONFIGS_DIR}/ap_nvim_init.conf.vim" "${AP_SYMLINKS_DIR}/init.vim"
ln -sf "$(which python3)" "${AP_SYMLINKS_DIR}/python3"

# Add/update coc-settings.json to be loaded by nvim
ln -sf "${AP_VENDORS_NVIM_SETUP_CONFIGS_DIR}/ap_coc_settings.json" ~/.config/nvim/coc-settings.json

# Set default editor for apps that used EDITOR env var to determine which app is used to open file
export EDITOR=nvim
# export VISUAL=nvim

# Set color scheme
export AP_NVIM_COLOR_SCHEME='everforest'
# export AP_NVIM_COLOR_SCHEME='onehalflight'
# export AP_NVIM_COLOR_SCHEME='onehalfdark'

export AP_NVIM_COC_DIR=~/.config/coc
export AP_NVIM_COC_EXT_DIR=~/.config/coc/extensions

alias vi='nvim'
alias znvimswap="cd \${HOME}/.local/share/nvim/swap"
alias rmnvimswapfiles='rm -f ~/.local/share/nvim/swap/*'

alias viscnvim="vi -p \
	\${AP_VENDORS_NVIM_SETUP_DIR}/ap_init_nvim.sh \
	\${AP_VENDORS_NVIM_SETUP_CONFIGS_DIR}/ap_nvim_init.conf.vim \
	\${AP_VENDORS_NVIM_SETUP_CONFIGS_DIR}/ap_nvim_keymap.conf.vim \
	\${AP_VENDORS_NVIM_SETUP_CONFIGS_DIR}/ap_nvim_plugin_junegunn_vim_plug.vim \
	\${AP_VENDORS_NVIM_SETUP_CONFIGS_DIR}/ap_nvim_plugin_05_77_neoclide_coc_nvim.vim \
	\${AP_VENDORS_NVIM_SETUP_CONFIGS_DIR}/ap_coc_settings.json"

alias znvimconfigs='cd ~/.config/nvim'
alias znvimcoc='cd "${AP_NVIM_COC_DIR}"'
alias znvimcocextensions='cd "${AP_NVIM_COC_EXT_DIR}"'

# Used to locate user files, such as init.vim
# VIM="${AP_SCRIPTO_COMMON_DIR}/vendors/nvim/ap_conf_nvim_init.vim"

# Ex commands to be executed at startup
# VIMINIT=""

# Used to locate runtime files (documentation, syntax highlighting, etc.).
# VIMRUNTIME=""

# @$alias $$ ap_func_nvim_bulk_edit {
alias ap_alias_nvim_bulk_edit='ap_func_nvim_bulk_edit'
alias vibulk='ap_func_nvim_bulk_edit'
# }

# @$func $$ ap_func_nvim_bulk_edit {
# ap_func_nvim_bulk_edit [--] <file/folder_path...>
# Description
#	Bulk edit a limit number of specified files and folders using nvim
# Parameters
# 	<file/folder_path...>	Files and folder paths (could be relative or absolute) (accept wildcard *)
# 	For example
#		ap_func_nvim_bulk_edit wp ap ap_dk_init_*
# Return status
#	AP_CODE_SUCCESS
# }

ap_func_nvim_bulk_edit() {
    local ap_max_files=10

    local ap_input_files=("${PWD}")
    if [[ "$#" > 0 ]]; then
        ap_input_files=($@)
    fi

    @logdbg "Input files = [${ap_input_files[*]}]\n"

    local ap_cmd
    local ap_file
    local ap_input_file

    for ap_input_file in ${ap_input_files[@]}; do
        if [[ $(printf %s "${ap_cmd}" | tr -dc ' ' | wc -c) -gt $((ap_max_files - 1)) ]]; then
            @minfo "Cannot bulk edit more than [${ap_max_files}] files\n"
            break
        fi

        if [[ -f ${ap_input_file} ]]; then
            ap_cmd="${ap_cmd} ${ap_input_file}"
            continue
        fi

        if [[ -d ${ap_input_file} ]]; then
            for ap_file in "${ap_input_file}"/*; do
                if [[ $(printf %s "${ap_cmd}" | tr -dc ' ' | wc -c) -gt $((ap_max_files - 1)) ]]; then
                    break
                fi

                if [[ -f "${ap_file}" ]]; then
                    ap_cmd="${ap_cmd} ${ap_file}"
                fi
            done
        fi
    done

    if [[ -n "${ap_cmd}" ]]; then
        local ap_log_msg="$(echo "${ap_cmd}" | gsed "s@ @\n@g")"
        @logdbg "\nnvim -p${ap_log_msg}\n"
        eval "$(printf "%s" "nvim -p${ap_cmd}")"
    fi

    @rtn_success
}

#@@ap-alias $$ ap_func_nvim_install_coc_extension {
alias ap_alias_nvim_install_coc_extension='ap_func_nvim_install_coc_extension'
# }

#@@ap-func $$ ap_func_nvim_install_coc_extension {
# ap_func_nvim_install_coc_extension
# Description
# 	Install coc extensions using npm
# Return Status
# 	0: Success
# }

ap_func_nvim_install_coc_extension() {
    ap_coc_ext="$1"

    grep "${ap_coc_ext}" "${AP_NVIM_COC_EXT_DIR}/package.json" &>/dev/null
    if [[ "$?" != 0 ]]; then
        printf "Installing coc extension [%s]\n" "${ap_coc_ext}"
        cd "${AP_NVIM_COC_EXT_DIR}"
        npm install "${ap_coc_ext}" --global-style --ignore-scripts --no-bin-links --no-package-lock --only=prod
    fi

    return 0
}

# Another way to install coc extensions
# if [[ -d "${AP_NVIM_COC_EXT_DIR}" ]]; then
# 	ap_alias_nvim_install_coc_extension coc-prettier
# 	ap_alias_nvim_install_coc_extension coc-html
# 	ap_alias_nvim_install_coc_extension coc-css
# 	ap_alias_nvim_install_coc_extension coc-tsserver
# 	ap_alias_nvim_install_coc_extension coc-eslint
# 	ap_alias_nvim_install_coc_extension coc-styled-components
# 	ap_alias_nvim_install_coc_extension coc-solargraph
# 	ap_alias_nvim_install_coc_extension coc-pyright
# 	ap_alias_nvim_install_coc_extension coc-rust-analyzer
# 	ap_alias_nvim_install_coc_extension coc-go
# 	ap_alias_nvim_install_coc_extension coc-phpls
# 	ap_alias_nvim_install_coc_extension coc-vimlsp
# 	ap_alias_nvim_install_coc_extension coc-json
# 	ap_alias_nvim_install_coc_extension coc-yaml
# 	ap_alias_nvim_install_coc_extension coc-sql
# 	ap_alias_nvim_install_coc_extension coc-docker
# 	ap_alias_nvim_install_coc_extension coc-markdownlint
# 	ap_alias_nvim_install_coc_extension coc-emoji
# 	ap_alias_nvim_install_coc_extension coc-tabnine
# fi

# Make TabNine executable
gfind ~/.config/coc/extensions/coc-tabnine-data/binaries -type f -name TabNine | gxargs -I {} chmod +x {}
