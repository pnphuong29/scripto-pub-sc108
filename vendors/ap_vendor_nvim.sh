# https://github.com/neovim/neovim
# Dependencies: fzf, nodejs, python, ruby
alias apinitnvim="ap_func_init_nvim"
ap_func_init_nvim() {
    if alias apinitnvimshare &>/dev/null; then
        apinitnvimshare
    fi

    if alias apinitnvimcommon &>/dev/null; then
        apinitnvimcommon
    fi
}

alias apcreatedirstructnvim="ap_func_create_dirstruct_nvim"
ap_func_create_dirstruct_nvim() {
    if [ -f "${AP_SOFT_DIR}/nvim/bin/nvim" ]; then
        aplogshow "Create symlink from [${AP_SOFT_DIR}/bin/nvim] to [${AP_SOFT_DIR}/nvim/bin/nvim]\n"
        sudo ln -sf "${AP_SOFT_DIR}/nvim/bin/nvim" "${AP_SOFT_DIR}/bin/nvim"
    fi

    # Install Vim Plug
    sh -c 'curl -fLo "${HOME}/.local/share/nvim/site/autoload/plug.vim" --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

    # Install client providers for neovim
    pip install --upgrade pynvim
    gem install neovim
    pnpm install -g neovim

    # Install markdown-oxide
    # cargo install --locked --git https://github.com/Feel-ix-343/markdown-oxide.git markdown-oxide

    if alias apcreatedirstructnvimshare &>/dev/null; then
        apcreatedirstructnvimshare
    fi

    if alias apcreatedirstructnvimcommon &>/dev/null; then
        apcreatedirstructnvimcommon
    fi
}

alias aprmdirstructnvim="ap_func_rm_dirstruct_nvim"
ap_func_rm_dirstruct_nvim() {
    aplogshow "Remove [${AP_SOFT_DIR}/bin/nvim]\n"
    rm -f "${AP_SOFT_DIR}/bin/nvim"

    if alias aprmdirstructnvimshare &>/dev/null; then
        aprmdirstructnvimshare
    fi

    if alias aprmdirstructnvimcommon &>/dev/null; then
        aprmdirstructnvimcommon
    fi
}

alias apcreateglobalsymlinknvim="ap_func_create_global_symlink_nvim"
ap_func_create_global_symlink_nvim() {
    if [ -f "${AP_SOFT_DIR}/bin/nvim" ]; then
        aplogshow "Create symlink from [/usr/local/bin/nvim] to [${AP_SOFT_DIR}/bin/nvim]\n"
        sudo ln -sf "${AP_SOFT_DIR}/bin/nvim" "/usr/local/bin/nvim"
    fi
}

alias aprmglobalsymlinknvim="ap_func_rm_global_symlink_nvim"
ap_func_rm_global_symlink_nvim() {
    aplogshow "Remove [/usr/local/bin/nvim]\n"
    sudo rm -f "/usr/local/bin/nvim"
}

alias apsetupnvim="ap_func_setup_nvim"
ap_func_setup_nvim() {
    # https://github.com/neovim/neovim/wiki/Installing-Neovim
    # https://neovim.io/doc/user/provider.html
    # https://github.com/junegunn/vim-plug
    # Dependencies: python3, gem, npm
    # Installed packages: neovim, vim-plug, coc-extensions
    # Notes
    # - All coc extensions will be installed when openning neovim first time
    # - After finishing installing plugins and coc extensions, you should run `:checkhealh` in neovim
    aplogshow "Install [nvim]\n"

    # Remove old nvim dir
    rm -rf "${AP_SOFT_DIR}/nvim"

    # Install nvim
    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        if [[ "$(uname -m)" == 'arm64' ]]; then
            curl -SL \
                "$(curl --silent "https://api.github.com/repos/neovim/neovim/releases" | jq -r '.[0].assets[].browser_download_url' | grep "macos" | grep arm | grep -v sha256)" >neovim.tar.gz
        elif [[ "$(uname -m)" == 'x86_64' ]]; then
            curl -SL \
                "$(curl --silent "https://api.github.com/repos/neovim/neovim/releases" | jq -r '.[0].assets[].browser_download_url' | grep "macos" | grep x86_64 | grep -v sha256)" >neovim.tar.gz
        fi
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        curl -SL \
            "$(curl --silent "https://api.github.com/repos/neovim/neovim/releases" | jq -r '.[0].assets[].browser_download_url' | grep "linux" | grep "x86_64" | grep "tar.gz")" >neovim.tar.gz
    fi

    tar -zxf neovim.tar.gz
    # rm -f neovim.tar.gz
    mv nvim* nvim
    mv nvim "${AP_SOFT_DIR}/"
    cd "${AP_SOFT_DIR}/nvim"
    # rm -rf "${AP_TMP_DIR}/neovim"

    # Use [apt] to install nvim
    # sudo apt-get install python-dev python-pip python3-dev python3-pip # Require python (use pyenv to install)
    # sudo add-apt-repository ppa:neovim-ppa/stable
    # sudo apt-get update
    # sudo apt-get install neovim

    apinitnvim
    apcreateglobalsymlinknvim

    if alias apcreatedirstructnvim &>/dev/null; then
        apcreatedirstructnvim
    fi
}

alias aprmnvim="ap_func_rm_nvim"
ap_func_rm_nvim() {
    aplogshow "Remove [nvim]\n"

    rm -rf "${AP_SOFT_DIR}/nvim"
    rm -rf ~/.config/nvim
    rm -rf ~/.config/coc
    rm -rf ~/.local/share/nvim
    rm -rf ~/.local/state/nvim

    if alias aprmdirstructnvim &>/dev/null; then
        aprmdirstructnvim
    fi

    if alias aprmglobalsymlinknvim &>/dev/null; then
        aprmglobalsymlinknvim
    fi
}

alias vibulk='ap_func_nvim_bulk_edit'
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

    # aplogdebug "Input files = [${ap_input_files[*]}]\n"

    local ap_cmd
    local ap_file
    local ap_input_file

    for ap_input_file in "${ap_input_files[@]}"; do
        if [[ $(printf %s "${ap_cmd}" | tr -dc ' ' | wc -c) -gt $((ap_max_files - 1)) ]]; then
            apshowmsginfo "Cannot bulk edit more than [${ap_max_files}] files\n"
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
        # local ap_log_msg
        # ap_log_msg="$(echo "${ap_cmd}" | gsed "s@ @\n@g")"
        # aplogdebug "\nvi -p${ap_log_msg}\n"
        eval "$(printf "%s" "vi -p${ap_cmd}")"
    fi
}
