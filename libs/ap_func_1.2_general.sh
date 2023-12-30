alias showostype='ap_func_get_os_type'

# @$func $$ ap_func_get_os_type {
# ap_func_get_os_type
# Descriptions
# 	Get current OS type
# Return
# 	OS type [AP_OS_TYPE_MACOS, AP_OS_TYPE_UBUNTU, etc.]
# Return Status
# 	0: Success
# }
ap_func_get_os_type() {
    local ap_os_type=''

    if [ "$(uname)" == 'Darwin' ]; then
        ap_os_type="${AP_OS_TYPE_MACOS}"
    elif [ "$(uname)" == 'Linux' ] && [ "$(grep ^ID= /etc/os-release | cut -d = -f 2)" == 'ubuntu' ]; then
        ap_os_type="${AP_OS_TYPE_UBUNTU}"
    else
        ap_os_type="${AP_OS_TYPE_UNKNOWN}"
    fi

    printf "%s" "${ap_os_type}"
    @rtn_success
}

alias trim='ap_func_trim'
alias trimfile='ap_func_trim -f --'

# @$func $$ ap_func_trim {
# ap_func_trim [-f] [--] [input_text/input_file]
# Description
# 	Trim heading and trailing whitespace of [input_text] or [input_file]
# Options
# 	-f Input file
# Parameters
# 	[input_text]	Text to perform trimming
# Return
# 	Trimmed text
# Return Status
#	AP_CODE_SUCCESS
# }
ap_func_trim() {
    local ap_opts_string='f:'
    local ap_opt=''
    local ap_opt_input_file=''

    unset OPTIND

    while getopts "${ap_opts_string}" ap_opt; do
        case "${ap_opt}" in
        'f')
            ap_opt_input_file="${OPTARG}"
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
    if [ -z "${ap_opt_input_file}" ]; then
        local ap_text="${1:-}"
        [ -z "${ap_text}" ] && @rtn_success

        # trim heading spaces
        ap_text="$(printf "%s" "${ap_text}" | gsed -E 's/^ +//')"

        # trim trailing spaces
        ap_text="$(printf "%s" "${ap_text}" | gsed -E 's/ +$//')"

        # return text
        printf "%s" "${ap_text}"
    else
        if [ -f "${ap_opt_input_file}" ]; then
            # trim heading spaces
            gsed -E 's/^ +//' "${ap_opt_input_file}"

            # trim trailing spaces
            gsed -E 's/ +$//' "${ap_opt_input_file}"
        fi
    fi

    @rtn_success
}
