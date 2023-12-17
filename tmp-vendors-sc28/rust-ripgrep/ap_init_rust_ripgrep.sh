# https://github.com/BurntSushi/ripgrep
# Dependencies: ghq, asciidoctor (for generating manpage)

export AP_VENDORS_RUST_RIPGREP_DIR="${AP_SCRIPTO_COMMON_DIR}/vendors/rust-ripgrep"
export AP_VENDORS_RUST_RIPGREP_CONFIGS_DIR="${AP_VENDORS_RUST_RIPGREP_DIR}/configs"
export AP_VENDORS_RIPGREP_REPO_PATH="BurntSushi/ripgrep"
export AP_VENDORS_RIPGREP_REPO_URL="https://github.com/${AP_VENDORS_RIPGREP_REPO_PATH}"
export AP_VENDORS_RIPGREP_IGNORE_FILE="${AP_VENDORS_RUST_RIPGREP_CONFIGS_DIR}/ap_rust_ripgrep.ignore"

if [[ "${USER}" != 'root' ]]; then
    if type cargo &>/dev/null; then
        export AP_VENDORS_RIPGREP_DIR="${AP_GH_DIR}/${AP_VENDORS_RIPGREP_REPO_PATH}"
        @addpath "${AP_VENDORS_RIPGREP_DIR}/target/release"

        # Autocomplete
        source "$(gfind ${AP_VENDORS_RIPGREP_DIR} -name 'rg.bash' | grep release)"
    else
        export AP_VENDORS_RIPGREP_DIR="${AP_SOFT_DIR}/ripgrep"
        @addpath "${AP_VENDORS_RIPGREP_DIR}"

        # Autocomplete
        source "${AP_VENDORS_RIPGREP_DIR}/complete/rg.bash"
    fi
fi

# Aliases
# @@todo
alias viscrg="vi -p \
	${AP_VENDORS_RUST_RIPGREP_DIR}/ap_init_rust_ripgrep.sh \
	${AP_VENDORS_RUST_RIPGREP_CONFIGS_DIR}/ap_rust_ripgrep.conf \
	${AP_VENDORS_RUST_RIPGREP_CONFIGS_DIR}/ap_rust_ripgrep.ignore"

alias rgv='rg --color always --heading --smart-case --vimgrep --trim'
alias rgvc='rg --color always --heading --vimgrep --trim --case-sensitive'
alias rgi='rg --no-ignore --ignore-file "${AP_VENDORS_RIPGREP_IGNORE_FILE}" --color always --heading --smart-case --vimgrep --trim'
alias rgic='rg --no-ignore --ignore-file "${AP_VENDORS_RIPGREP_IGNORE_FILE}" --color always --heading --case-sensitive --vimgrep --trim'

## Find hidden files
alias rgvh='rg --hidden --color always --heading --smart-case --vimgrep --trim'
alias rgvhc='rg --hidden --color always --heading --case-sensitive --vimgrep --trim'
alias rgih='rg --hidden --no-ignore --ignore-file "${AP_VENDORS_RIPGREP_IGNORE_FILE}" --color always --heading --smart-case --vimgrep --trim'
alias rgihc='rg --hidden --no-ignore --ignore-file "${AP_VENDORS_RIPGREP_IGNORE_FILE}" --color always --heading --case-sensitive --vimgrep --trim'

# Update ripgrep ignore global file path in ripgrep config file
# export RIPGREP_CONFIG_PATH="${AP_CONFIGS_DIR}/ap_rust_ripgrep.conf"

# gsed -i'' "/ap_rust_ripgrep.ignore/d" "${RIPGREP_CONFIG_PATH}"
# ap_g_pos="$(grep -n "\-\-ignore\-file" "${RIPGREP_CONFIG_PATH}" | cut -d : -f 1)"
# gsed -i'' "${ap_g_pos}a${AP_VENDORS_RIPGREP_IGNORE_FILE}" "${RIPGREP_CONFIG_PATH}"

# @@ap-alias $$ ap_func_ripgrep {
alias ap_alias_ripgrep='ap_func_ripgrep'

alias rgf='ap_alias_ripgrep'
alias rgfr='rgf -r'
alias rgfrc='rgf -c -r'
alias rgfa10='rgf -i -h -a 10 --'
alias rgfa20='rgf -i -h -a 20 --'
alias rgfa30='rgf -i -h -a 30 --'
alias rgfab10='rgf -i -h -a 10 -b 10 --'
alias rgfab20='rgf -i -h -a 20 -b 20 --'
# }

# @@ap-func $$ ap_func_ripgrep {
# ap_func_ripgrep [-xabhi] <extra_options> <before_context_rows> <after_context_rows> [--] *<search_string>
# Description
# 	Perform custom `ripgrep` commands
# Options
#	-c 							Case sensitive
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
    local ap_opt_x=0
    local ap_opt_a=0
    local ap_opt_b=0
    local ap_opt_h=0
    local ap_opt_i=0
    local ap_opt_r=0
    local ap_opt_c=0

    local ap_lines_before_context=0
    local ap_lines_after_context=0
    local ap_replace_string=''
    local ap_cmd='rg --no-ignore --line-number --heading --vimgrep --trim'

    unset OPTIND

    while getopts "${ap_opts_string}" ap_opt; do
        case "${ap_opt}" in
        'x')
            ap_opt_x=1
            ap_extra_options="${OPTARG}"
            ap_cmd="${ap_cmd} ${ap_extra_options}"
            ;;
        'a')
            ap_opt_a=1
            ap_lines_after_context="${OPTARG}"
            ap_cmd="${ap_cmd} --after-context ${ap_lines_after_context}"
            ;;
        'b')
            ap_opt_b=1
            ap_lines_before_context="${OPTARG}"
            ap_cmd="${ap_cmd} --before-context ${ap_lines_before_context}"
            ;;
        'h')
            ap_opt_h=1
            ap_cmd="${ap_cmd} --hidden"
            ;;
        'i')
            ap_opt_i=1
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
            @rtn_err_opt_invalid_option
            ;;
        esac
    done

    # Remove all options in parameter list
    shift $((OPTIND - 1))

    # Implementation
    local ap_search_string="$1"
    [[ -z "${ap_search_string}" ]] && @merr "Missing <search_string>\n" && ap_alias_ret_err_missing_argument

    if [[ ${ap_opt_c} == 0 ]]; then
        ap_cmd="${ap_cmd} --smart-case"
    fi

    ap_cmd="${ap_cmd} ${ap_search_string}"

    if [[ "${ap_opt_r}" == 1 && -n "${ap_replace_string}" ]]; then
        local ap_file_name
        local ap_file_path

        eval "$(echo "${ap_cmd}")" | cut -d : -f 1 | while read -r ap_file_name; do
            ap_file_path="${PWD}/${ap_file_name}"
            @minfo "Replace [${ap_search_string}] by [${ap_replace_string}] in file [${ap_file_path}]\n"
            gsed -i'' "s/${ap_search_string}/${ap_replace_string}/g" "${ap_file_path}"
        done
    else
        eval "$(echo "${ap_cmd}")"
    fi

    @rtn_success
}
