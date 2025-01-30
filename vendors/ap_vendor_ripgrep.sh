alias apinitripgrep="ap_func_init_ripgrep"
ap_func_init_ripgrep() {
    if [ -f "${HOME}/scripto-share/vendors/ripgrep/ap_ripgrep.ignore" ]; then
        export AP_VENDORS_RIPGREP_IGNORE_FILE="${HOME}/scripto-share/vendors/ripgrep/ap_ripgrep.ignore"
    fi

    alias viscrg="vi -p \
        \${HOME}/scripto/vendors/ap_vendor_ripgrep.sh \
        \${HOME}/scripto-share/vendors/ripgrep/ap_ripgrep.conf \
        \${HOME}/scripto-share/vendors/ripgrep/ap_ripgrep.ignore \
    "

    # Find using vimgrep
    alias rgv='rg --color always --heading --smart-case --vimgrep --trim'
    alias rgvc='rg --color always --heading --vimgrep --trim --case-sensitive'
    alias rgi='rg --no-ignore --ignore-file "${AP_VENDORS_RIPGREP_IGNORE_FILE}" --color always --heading --smart-case --vimgrep --trim'
    alias rgic='rg --no-ignore --ignore-file "${AP_VENDORS_RIPGREP_IGNORE_FILE}" --color always --heading --case-sensitive --vimgrep --trim'

    # Find hidden files
    alias rgvh='rg --hidden --color always --heading --smart-case --vimgrep --trim'
    alias rgvhc='rg --hidden --color always --heading --case-sensitive --vimgrep --trim'
    alias rgih='rg --hidden --no-ignore --ignore-file "${AP_VENDORS_RIPGREP_IGNORE_FILE}" --color always --heading --smart-case --vimgrep --trim'
    alias rgihc='rg --hidden --no-ignore --ignore-file "${AP_VENDORS_RIPGREP_IGNORE_FILE}" --color always --heading --case-sensitive --vimgrep --trim'

    # Update ripgrep ignore global file path in ripgrep config file
    # export RIPGREP_CONFIG_PATH="/ap-symlinks/ripgrep/ap_ripgrep.conf"

    # gsed -i'' "/ap_ripgrep.ignore/d" "${RIPGREP_CONFIG_PATH}"
    # ap_g_pos="$(grep -n "\-\-ignore\-file" "${RIPGREP_CONFIG_PATH}" | cut -d : -f 1)"
    # gsed -i'' "${ap_g_pos}a${AP_VENDORS_RIPGREP_IGNORE_FILE}" "${RIPGREP_CONFIG_PATH}"

    if alias apinitripgrepshare &>/dev/null; then
        apinitripgrepshare
    fi

    if alias apinitripgrepcommon &>/dev/null; then
        apinitripgrepcommon
    fi
}

alias apcreatedirstructripgrep="ap_func_create_dirstruct_ripgrep"
ap_func_create_dirstruct_ripgrep() {
    aplogshow "Create symlink from [${AP_SOFT_DIR}/bin/rg] to [${AP_SOFT_DIR}/ripgrep/rg]\n"
    ln -sf "${AP_SOFT_DIR}/ripgrep/rg" "${AP_SOFT_DIR}/bin/rg"

    aplogshow "Create symlink from [${AP_COMPLETIONS_DIR}/ap_completion_rg.bash] to [${AP_SOFT_DIR}/ripgrep/complete/rg.bash]\n"
    ln -sf "${AP_SOFT_DIR}/ripgrep/complete/rg.bash" "${AP_COMPLETIONS_DIR}/ap_completion_rg.bash"

    aplogshow "Create symlink from [${AP_MAN_DIR}/man1/rg.1] to [${AP_SOFT_DIR}/ripgrep/doc/rg.1]\n"
    ln -sf "${AP_SOFT_DIR}/ripgrep/doc/rg.1" "${AP_MAN_DIR}/man1/rg.1"

    if alias apcreatedirstructripgrepshare &>/dev/null; then
        apcreatedirstructripgrepshare
    fi

    if alias apcreatedirstructripgrepcommon &>/dev/null; then
        apcreatedirstructripgrepcommon
    fi
}

alias aprmdirstructripgrep="ap_func_rm_dirstruct_ripgrep"
ap_func_rm_dirstruct_ripgrep() {
    aplogshow "Remove [${AP_SOFT_DIR}/bin/rg]\n"
    rm -f "${AP_SOFT_DIR}/bin/rg"

    aplogshow "Remove [${AP_COMPLETIONS_DIR}/ap_completion_rg.bash]\n"
    rm -f "${AP_COMPLETIONS_DIR}/ap_completion_rg.bash"

    aplogshow "Remove [${AP_MAN_DIR}/man1/rg.1]\n"
    rm -f "${AP_MAN_DIR}/man1/rg.1"

    if alias aprmdirstructripgrepshare &>/dev/null; then
        aprmdirstructripgrepshare
    fi

    if alias aprmdirstructripgrepcommon &>/dev/null; then
        aprmdirstructripgrepcommon
    fi
}

alias apcreateglobalsymlinkripgrep="ap_func_create_global_symlink_ripgrep"
ap_func_create_global_symlink_ripgrep() {
    if [ -f "${AP_SOFT_DIR}/bin/rg" ]; then
        aplogshow "Create symlink from [/usr/local/bin/rg] to [${AP_SOFT_DIR}/bin/rg]\n"
        sudo ln -sf "${AP_SOFT_DIR}/bin/rg" "/usr/local/bin/rg"
    fi
}

alias aprmglobalsymlinkripgrep="ap_func_rm_global_symlink_ripgrep"
ap_func_rm_global_symlink_ripgrep() {
    if [ -f "/usr/local/bin/rg" ]; then
        aplogshow "Remove [/usr/local/bin/rg]\n"
        sudo rm -f "/usr/local/bin/rg"
    fi
}

alias apsetupripgrep="ap_func_setup_ripgrep"
ap_func_setup_ripgrep() {
    # Require [asciidoctor, jq] for generating manpage (use `gem install asciidoctor`)
    # https://github.com/BurntSushi/ripgrep
    aplogshow "Install [ripgrep]\n"

    # Remove old app dir if any
    rm -rf "${AP_SOFT_DIR}/ripgrep"
    rm -rf "${AP_TMP_DIR}/ripgrep"

    # Install ripgrep
    local ap_os="darwin"
    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        ap_os="linux"
    fi

    mkdir -p "${AP_TMP_DIR}/ripgrep"
    cd "${AP_TMP_DIR}/ripgrep"
    curl -SL \
        "$(curl --silent https://api.github.com/repos/BurntSushi/ripgrep/releases | jq -r '.[0].assets[].browser_download_url' | grep "${ap_os}" | grep x86_64 | grep -v sha256)" >ripgrep.tar.gz
    tar -zxf ripgrep.tar.gz
    rm -f ripgrep.tar.gz
    mv ripgrep* ripgrep
    mv ripgrep "${AP_SOFT_DIR}/"
    cd "${AP_SOFT_DIR}"
    rm -rf "${AP_TMP_DIR}/ripgrep"

    apinitripgrep
    if alias apcreatedirstructripgrep &>/dev/null; then
        apcreatedirstructripgrep
    fi
}

alias aprmripgrep="ap_func_rm_ripgrep"
ap_func_rm_ripgrep() {
    aplogshow "Remove [ripgrep]\n"
    rm -rf "${AP_SOFT_DIR}/ripgrep"

    if alias aprmdirstructripgrep &>/dev/null; then
        aprmdirstructripgrep
    fi

    if alias aprmglobalsymlinkripgrep &>/dev/null; then
        aprmglobalsymlinkripgrep
    fi
}

alias rgf="ap_func_ripgrep"
alias rgr="ap_func_ripgrep -r"
alias rgrc="ap_func_ripgrep -c -r"
alias rga10="ap_func_ripgrep -i -h -a 10 --"
alias rga20="ap_func_ripgrep -i -h -a 20 --"
alias rga30="ap_func_ripgrep -i -h -a 30 --"
alias rgab10="ap_func_ripgrep -i -h -a 10 -b 10 --"
alias rgab20="ap_func_ripgrep -i -h -a 20 -b 20 --"
# @@ap-func $$ ap_func_ripgrep {
# ap_func_ripgrep [-xabhiv] <extra_options> <before_context_rows> <after_context_rows> [--] *<search_string>
# Description
# 	Perform custom `ripgrep` commands
# Options
#	-c 							Case sensitive
#	-v 							Vimgrep
#	-x <extra_options>			Append extra options to ripgrep
# 	-a <after_context_rows>		Specify number of rows after found row to include in search results
#	-b <before_context_rows>	Specify number of rows before found row to include in search results
#	-h							Add `--hidden` option to `ripgrep` command
#	-i							Add `--ignore-file ${AP_VENDORS_RIPGREP_IGNORE_FILE}` option to `ripgrep` command
# 	-r <replace_string>			Replace string
# Parameters
# 	*<search_string>			Search string
# Return status
#	AP_CODE_SUCCESS
# }
ap_func_ripgrep() {
    local ap_opts_string=':x:a:b:hir:c'
    local ap_opt=''
    local ap_opt_r=0
    local ap_opt_c=0

    local ap_lines_before_context=0
    local ap_lines_after_context=0
    local ap_replace_string=''
    local ap_cmd='rg --color always --no-ignore --line-number --heading --vimgrep --trim'

    unset OPTIND

    while getopts "${ap_opts_string}" ap_opt; do
        case "${ap_opt}" in
        'x')
            ap_extra_options="${OPTARG}"
            ap_cmd="${ap_cmd} ${ap_extra_options}"
            ;;
        'a')
            ap_lines_after_context="${OPTARG}"
            ap_cmd="${ap_cmd} --after-context ${ap_lines_after_context}"
            ;;
        'b')
            ap_lines_before_context="${OPTARG}"
            ap_cmd="${ap_cmd} --before-context ${ap_lines_before_context}"
            ;;
        'h')
            ap_cmd="${ap_cmd} --hidden"
            ;;
        'i')
            ap_cmd="${ap_cmd} --ignore-file \"${AP_VENDORS_RIPGREP_IGNORE_FILE}\""
            ;;

        'r')
            ap_opt_r=1
            ap_replace_string="${OPTARG}"
            ;;
        'c')
            ap_opt_c=1
            ap_cmd="${ap_cmd} --case-sensitive"
            ;;
        ?)
            echo "Invalid option [${OPTARG}]"
            aprtn_err_opt_invalid_option
            ;;
        esac
    done

    # Remove all options in parameter list
    shift $((OPTIND - 1))

    # Implementation
    local ap_search_string="$*"
    [ -z "${ap_search_string}" ] && apshowmsgerror "Missing <search_string>\n" && aprtn_err_missing_argument

    if [ ${ap_opt_c} -eq 0 ]; then
        ap_cmd="${ap_cmd} --smart-case"
    fi

    ap_cmd="${ap_cmd} \"${ap_search_string}\""

    if [ "${ap_opt_r}" -eq 1 ] && [ -n "${ap_replace_string}" ]; then
        local ap_file_name
        local ap_file_path

        eval "$(printf "%s" "${ap_cmd}")" | cut -d : -f 1 | while read -r ap_file_name; do
            ap_file_path="${PWD}/${ap_file_name}"
            apshowmsginfo "Replace [${ap_search_string}] by [${ap_replace_string}] in file [${ap_file_path}]\n"
            gsed -i'' "s@${ap_search_string}@${ap_replace_string}@g" "${ap_file_path}"
        done
        # rg -r "${ap_replace_string}" "${ap_search_string}" "${PWD}"
    else
        eval "$(printf "%s" "${ap_cmd}")"
    fi

    aprtn_success
}
