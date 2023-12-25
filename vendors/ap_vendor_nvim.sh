alias @initnvim="ap_func_init_nvim"
ap_func_init_nvim() {
    # export AP_NVIM_SETUP_VERSION="stable"
    export AP_NVIM_SETUP_VERSION="latest"
    @addpath "${AP_SOFT_DIR}/nvim/bin"

    alias @vi="nvim"
    alias @znvimswapshare="cd \${HOME}/.local/share/nvim/swap"
    alias @znvimswapstate="cd \${HOME}/.local/state/nvim/swap"
    alias @rmnvimswapsharefiles="rm -f \${HOME}/.local/share/nvim/swap/\*"
    alias @rmnvimswapstatefiles="rm -f \${HOME}/.local/state/nvim/swap/\*"

    if alias @initnvimcommon &>/dev/null; then
        @initnvimcommon
    fi
}

alias @createdirstructnvim="ap_func_create_dirstruct_nvim"
ap_func_create_dirstruct_nvim() {
    if alias @createdirstructnvimcommon &>/dev/null; then
        @createdirstructnvimcommon
    fi
}

alias @rmdirstructnvim="ap_func_remove_dirstruct_nvim"
ap_func_remove_dirstruct_nvim() {
    if alias @rmdirstructnvimcommon &>/dev/null; then
        @rmdirstructnvimcommon
    fi
}

alias @createglobalsymlinknvim="ap_func_create_global_symlink_nvim"
ap_func_create_global_symlink_nvim() {
    if [ ! -f "/usr/local/bin/nvim" ]; then
        @logshow "Create symlink from [/usr/local/bin/nvim] to [${AP_SOFT_DIR}/nvim/bin/nvim]\n"
        sudo ln -sf "${AP_SOFT_DIR}/nvim/bin/nvim" "/usr/local/bin/nvim"
    fi
}

alias @rmglobalsymlinknvim="ap_func_remove_global_symlink_nvim"
ap_func_remove_global_symlink_nvim() {
    if [ -f "/usr/local/bin/nvim" ]; then
        @logshow "Remove [/usr/local/bin/nvim]\n"
        sudo rm -f "/usr/local/bin/nvim"
    fi
}

alias @setupnvim="ap_func_setup_nvim"
ap_func_setup_nvim() {
    # https://github.com/neovim/neovim/wiki/Installing-Neovim
    # https://neovim.io/doc/user/provider.html
    # https://github.com/junegunn/vim-plug
    # Dependencies: python3, gem, npm
    # Installed packages: neovim, vim-plug, coc-extensions
    # Notes
    # - All coc extensions will be installed when openning neovim first time
    # - After finishing installing plugins and coc extensions, you should run `:checkhealh` in neovim
    @logshow "Install [nvim]\n"

    # Remove old nvim dir
    rm -rf "${AP_SOFT_DIR}/nvim"

    # Install nvim
    local ap_os="macos"
    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        ap_os="linux64"
    fi

    curl -L "https://github.com/neovim/neovim/releases/${AP_NVIM_SETUP_VERSION}/download/nvim-${ap_os}.tar.gz" -o "${AP_TMP_DIR}/#1"
    tar -C "${AP_SOFT_DIR}" -zxf "${AP_TMP_DIR}/nvim-${ap_os}.tar.gz"
    mv "${AP_SOFT_DIR}/nvim-${ap_os}" "${AP_SOFT_DIR}/nvim"

    # Use [apt] to install nvim
    # sudo apt-get install python-dev python-pip python3-dev python3-pip # Require python (use pyenv to install)
    # sudo add-apt-repository ppa:neovim-ppa/stable
    # sudo apt-get update
    # sudo apt-get install neovim

    # Update PATH
    @addpath "${AP_SOFT_DIR}/nvim/bin"

    # Install Vim Plug
    sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

    # Install client providers for neovim
    pip install --upgrade pynvim
    gem install neovim
    npm install -g neovim

    if alias @createdirstructnvim &>/dev/null; then
        @createdirstructnvim
    fi
}

alias @rmnvim="ap_func_remove_nvim"
ap_func_remove_nvim() {
    @logshow "Remove [nvim]\n"

    rm -rf "${AP_SOFT_DIR}/nvim"
    rm -rf ~/.config/nvim
    rm -rf ~/.config/coc
    rm -rf ~/.local/share/nvim
    rm -f "${AP_SYMLINKS_DIR}/init.vim"
    rm -f "${AP_SYMLINKS_DIR}/python3"
    sudo rm -f /usr/local/bin/nvim

    if alias @rmdirstructnvim &>/dev/null; then
        @rmdirstructnvim
    fi

    if alias @rmglobalsymlinknvim &>/dev/null; then
        @rmglobalsymlinknvim
    fi
}

alias @vibulk='ap_func_nvim_bulk_edit'

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
    if [ "$#" -gt 0 ]; then
        ap_input_files=("$@")
    fi

    @logdbg "Input files = [${ap_input_files[*]}]\n"

    local ap_cmd
    local ap_file
    local ap_input_file

    for ap_input_file in "${ap_input_files[@]}"; do
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
        local ap_log_msg
        ap_log_msg="$(echo "${ap_cmd}" | gsed "s@ @\n@g")"
        @logdbg "\nnvim -p${ap_log_msg}\n"
        eval "$(printf "%s" "nvim -p${ap_cmd}")"
    fi
}
