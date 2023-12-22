alias @m='ap_func_show_msg'
alias @mgreen='ap_func_show_msg -e -n -f "${AP_SCHEME_COLOR_GREEN}" --'
alias @mred='ap_func_show_msg -e -n -f "${AP_SCHEME_COLOR_RED}" --'
alias @myellow='ap_func_show_msg -e -n -f "${AP_SCHEME_COLOR_YELLOW}" --'
alias @mcyan='ap_func_show_msg -e -n -f "${AP_SCHEME_COLOR_CYAN}" --'
alias @mmegenta='ap_func_show_msg -e -n -f "${AP_SCHEME_COLOR_MAGENTA}" --'

alias @minfo="ap_func_show_msg -e -n -f \${AP_SCHEME_COLOR_GREEN} --"
alias @merr="ap_func_show_msg -e -n -f \${AP_SCHEME_COLOR_RED} --"
alias @mwarn="ap_func_show_msg -e -n -f \${AP_SCHEME_COLOR_YELLOW} --"
alias @mlog="ap_func_show_msg -e -n -f \${AP_SCHEME_COLOR_CYAN} --"

# @$func $$ ap_func_show_msg {
# ap_func_show_msg [-cfen] [color_scheme] [format_string] [--] *[texts...]
# Description
#   Print out color and formatted texts with trailing new line
# 	References
#		https://misc.flogisoft.com/bash/tip_colors_and_formatting
# Options
# 	-c [color_scheme] 	Color scheme, could be either [8] or [256fg] or [256bg] (default: [8])
# 	-f [format_string] 	Format string in type [fg_color_code,bg_color_code,format_code] for 8 colors
#						For example [RED,DEFAULT,DEFAULT]
#						For 256 colors, it will be color code in range [0..256]
# 	-e 					Proceed escaping for input texts before printing out formatted texts
# 	-n 					Suppress new line character at the end
# Parameters
#   *[texts...] 		Texts to display
# Return
#   Formatted text
# }
ap_func_show_msg() {
    local ap_opts_string='c:f:en'
    local ap_opt=''
    local ap_opt_color_scheme='8'
    local ap_opt_format_string="${AP_SCHEME_COLOR_DEFAULT}"
    local ap_opt_proceed_escape=0
    local ap_opt_suppress_new_line=0

    unset OPTIND

    while getopts "${ap_opts_string}" ap_opt; do
        case "${ap_opt}" in
        'c')
            ap_opt_color_scheme="${OPTARG}"
            ;;
        'f')
            ap_opt_format_string="${OPTARG}"
            ;;
        'e')
            ap_opt_proceed_escape=1
            ;;
        'n')
            ap_opt_suppress_new_line=1
            ;;
        ':')
            echo "Missing option argument"
            return 1
            ;;
        *)
            echo "Invalid option"
            return 1
            ;;
        esac
    done

    # Remove all options in parameter list
    shift $((OPTIND - 1))

    # Validation
    if [ "${ap_opt_color_scheme}" = '256fg' ] || [ "${ap_opt_color_scheme}" = '256bg' ]; then
        if ((ap_opt_format_string < 0)) || ((ap_opt_format_string > 256)); then
            echo "Invalid color [${ap_opt_format_string}]! Color scheme for 256 colors must be in range [0..256]"
            return 1
        fi
    fi

    local ap_param_text="${1:-}"
    shift

    [ -z "${ap_param_text}" ] && echo "Input text cannot be empty!" && return 1

    # Construct input texts
    while [ $# -gt 0 ]; do
        [ -z "${1:-}" ] && shift && continue

        if [ -z "${ap_param_text}" ]; then
            ap_param_text="${1}"
        else
            ap_param_text+=" ${1}"
        fi
        shift
    done

    if [ "${ap_opt_proceed_escape}" -eq 1 ]; then
        printf -v ap_param_text_escaped "%b" "${ap_param_text}"
    fi

    # Implementations
    local ap_format_prefix=''

    case "${ap_opt_color_scheme}" in
    '8')
        ap_format_prefix="${AP_ESCAPE_DEFAULT}"
        ;;
    '256fg')
        ap_format_prefix="${AP_ESCAPE_EXTENDED_FG}"
        ;;
    '256bg')
        ap_format_prefix="${AP_ESCAPE_EXTENDED_BG}"
        ;;
    *)
        echo "Invalid color scheme [${ap_opt_color_scheme}]!"
        return 1
        ;;
    esac

    printf "${ap_format_prefix}${ap_opt_format_string}m%s${AP_ESCAPE_RESET_ALL}" "${ap_param_text_escaped}"
    [ "${ap_opt_suppress_new_line}" -eq 0 ] && echo

    if [[ "${AP_LOGS_DEBUG_ENABLED}" == 1 ]]; then
        printf "%s" "${ap_param_text_escaped}" >>"${AP_LOGS_DEBUG_FILE}"
        [ "${ap_opt_suppress_new_line}" -eq 0 ] && echo >>"${AP_LOGS_DEBUG_FILE}"
    fi

    @rtn_success
}

alias @dash='ap_func_show_symbols -f "${AP_SCHEME_COLOR_RED}" -- "-" 49'
alias @hyphen='ap_func_show_symbols -f "${AP_SCHEME_COLOR_RED}" -- "#" 49'

alias @showsymred='ap_func_show_symbols -f "${AP_SCHEME_COLOR_RED}" --'
alias @showsymgreen='ap_func_show_symbols -f "${AP_SCHEME_COLOR_GREEN}" --'
alias @showsymyellow='ap_func_show_symbols -f "${AP_SCHEME_COLOR_YELLOW}" --'
alias @showsymcyan='ap_func_show_symbols -f "${AP_SCHEME_COLOR_CYAN}" --'
alias @showsymmagenta='ap_func_show_symbols -f "${AP_SCHEME_COLOR_MAGENTA}" --'
alias @showsymhash21='ap_func_show_symbols -f "${AP_SCHEME_COLOR_RED}" -- "#" 21'
alias @showsymhash49='ap_func_show_symbols -f "${AP_SCHEME_COLOR_RED}" -- "#" 49'
alias @showsymhyphen21='ap_func_show_symbols -f "${AP_SCHEME_COLOR_RED}" -- "-" 21'
alias @showsymhyphen49='ap_func_show_symbols -f "${AP_SCHEME_COLOR_RED}" -- "-" 49'

# @$func $$ ap_func_show_symbols {
# ap_func_show_symbols [-cnf] [format] [--] [symbol] [no_of_times]
# Description
#   Display a line of symbols basing on given input
# Options
# 	-c [color_scheme] 	Color scheme, could be either [8] or [256fg] or [256bg] (default: [8])
# 	-n 					Suppress new line character at the end
# 	-f [format_string] 	Format string in type [fg_color_code,bg_color_code,format_code] for 8 colors
#							For example [RED,DEFAULT,DEFAULT]
#							For 256 colors, it will be color code in range [0..256]
# Parameters
#   [symbol]      		Symbol to repeat
#   [no_of_times] 		Number of symbol characters
# Return
#   Symbol string
# }
ap_func_show_symbols() {
    local ap_opts_string='c:nf:'
    local ap_opt=''
    local ap_opt_color_scheme='8'
    local ap_opt_format_string="${AP_SCHEME_COLOR_DEFAULT}"
    local ap_opt_suppress_new_line=0

    unset OPTIND

    while getopts "${ap_opts_string}" ap_opt; do
        case "${ap_opt}" in
        'c')
            ap_opt_color_scheme="${OPTARG}"
            ;;
        'n')
            ap_opt_suppress_new_line=1
            ;;
        'f')
            ap_opt_format_string="${OPTARG}"
            ;;
        ':')
            echo "Missing option argument"
            return 1
            ;;
        *)
            echo "Invalid option"
            return 1
            ;;
        esac
    done

    # Remove all options in parameter list
    shift $((OPTIND - 1))

    # Concatenate symbols
    local ap_symbol_string="${1:--}"
    local ap_param_symbol="${1:--}"
    local ap_param_no_of_repeat_times="${2:-21}"

    while [ "${ap_param_no_of_repeat_times}" -gt 1 ]; do
        ap_symbol_string+="${ap_param_symbol}"
        ap_param_no_of_repeat_times=$((ap_param_no_of_repeat_times - 1))
    done

    # Display output
    if [ "${ap_opt_suppress_new_line}" -eq 1 ]; then
        @m -n -c "${ap_opt_color_scheme}" -f "${ap_opt_format_string}" -- "${ap_symbol_string}"
    else
        @m -c "${ap_opt_color_scheme}" -f "${ap_opt_format_string}" -- "${ap_symbol_string}"
    fi

    @rtn_success
}

alias @log='ap_func_log_msg "general" 0 "@mgreen"'
alias @logerr='ap_func_log_msg "error" 0 "@mred"'
alias @logdbg='ap_func_log_msg "debug" 0 "@myellow"'

alias @logln='ap_func_log_msg "general" 0 "@mgreen" "\n"'
alias @logerrln='ap_func_log_msg "error" 0 "@mred" "\n"'
alias @logdbgln='ap_func_log_msg "debug" 0 "@myellow" "\n"'

alias @logshow='ap_func_log_msg "general" 1 "@mgreen"'
alias @logshowerr='ap_func_log_msg "error" 1 "@mred"'
alias @logshowdbg='ap_func_log_msg "debug" 1 "@myellow"'

alias @logshowln='ap_func_log_msg "general" 1 "@mgreen" "\n"'
alias @logshowerrln='ap_func_log_msg "error" 1 "@mred" "\n"'
alias @logshowdbgln='ap_func_log_msg "debug" 1 "@myellow" "\n"'

alias @logshow='ap_func_log_msg "general" 1 "@mgreen"'
alias @logshowpassed='ap_func_log_msg -p "${AP_SYM_PASSED} " -- "general" 1 "@mgreen"'
alias @logshowfailed='ap_func_log_msg -p "${AP_SYM_FAILED} " -- "general" 1 "@mgreen"'

# @$func $$ ap_func_log_msg {
# ap_func_log_msg -p [msg_prefix] [--] *<msg_type> *<show_msg_on_terminal> *<cmd_log_msg> *<msg>
# Description
# 	Write log message and/or display on terminal
# Options
# 	-p [msg_prefix]			Input prefix of message and will be prepended to <msg>
# Parameters
# 	<msg_type>				Message types [general, error, debug]
#	<show_msg_on_terminal> 	Show messages on terminal [1: activate]
# 	<cmd_log_msg			Name of command (alias) which is used to show msg on terminal
# 	<msg>					Messages
# Return Status
#		0: Successful
# }
ap_func_log_msg() {
    local ap_opts_string=':p:'
    local ap_opt=''
    local ap_opt_msg_prefix=''

    unset OPTIND

    while getopts "${ap_opts_string}" ap_opt; do
        case "${ap_opt}" in
        'p')
            ap_opt_msg_prefix="${OPTARG}"
            ;;
        ':')
            echo "Missing option argument"
            return 1
            ;;
        *)
            echo "Invalid option"
            return 1
            ;;
        esac
    done

    # Remove all options in parameter list
    shift $((OPTIND - 1))

    ap_param_msg_type="${1:-}"
    ap_param_show_msg_on_terminal="${2:-}"
    ap_param_cmd_show_msg="${3:-}"
    ap_param_msg="${4:-}"
    ap_log_file_path="${AP_LOGS_GENERAL_FILE}"

    [[ -z "${ap_param_msg}" ]] && return 1

    if [[ "${ap_param_msg_type}" == "error" ]]; then
        ap_log_file_path="${AP_LOGS_ERROR_FILE}"
    elif [[ "${ap_param_msg_type}" == "debug" ]]; then
        ap_log_file_path="${AP_LOGS_DEBUG_FILE}"
    fi

    # Add more information to log messages
    ap_msg="$(gdate "+%Y-%m-%d %H:%M:%S"): ${ap_opt_msg_prefix}${ap_param_msg}"

    # Write messages to log file
    if [[ "${ap_param_msg_type}" == "debug" ]]; then
        # Only write debug log if enabled
        if [[ "${AP_LOGS_DEBUG_ENABLED}" == 1 ]]; then
            printf "%s" "${ap_msg}" >>"${ap_log_file_path}"
        fi
    else
        printf "%s" "${ap_msg}" >>"${ap_log_file_path}"
    fi

    # Show message on terminal
    [[ "${ap_param_show_msg_on_terminal}" == 1 ]] && eval "$(printf "%s" "${ap_param_cmd_show_msg} \"${ap_opt_msg_prefix}${ap_param_msg}\"")"

    @rtn_success
}

alias @showostype='ap_func_get_os_type'

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

alias @addpath="ap_func_add_path_var"

# @$func $$ ap_func_add_path_var {
# ap_func_add_path_var -[am] *<path_var>
# Descriptions
# 	Check if <path_var> already existed in $PATH, if not then prepend it to $PATH
# Options
# 	a : Append to $PATH
# 	m : Use $MANPATH instead of $PATH
# }
ap_func_add_path_var() {
    local ap_opt_str="am"
    local ap_opt_append=0
    local ap_opt_manpath=0

    # @#NOTICE ## OPTIND | DO NOT shift any arguments/parameters if no options are presented
    # Prevent shifting paremeter by mistakes if no options are presented
    unset OPTIND

    while getopts "${ap_opt_str}" opt; do
        case "${opt}" in
        a)
            ap_opt_append=1
            ;;
        m)
            ap_opt_manpath=1
            ;;
        ?)
            echo "Invalid option [${OPTARG}]"
            @rtn_err_opt_invalid_option
            ;;
        esac
    done

    # Remove all options in parameter list
    shift $((OPTIND - 1))

    local ap_path="$1"

    if [ -z "${ap_path:-}" ]; then
        echo "Missing argument <PATH_VAR>"
        @rtn_err_missing_argument
    fi

    local ap_ref_path="PATH"
    if [ "${ap_opt_manpath}" == 1 ]; then
        ap_ref_path="MANPATH"
    fi

    local ap_grep_matched=0

    echo "${!ap_ref_path}" | grep "^${ap_path}:" &>/dev/null && ap_grep_matched=1
    echo "${!ap_ref_path}" | grep ":${ap_path}$" &>/dev/null && ap_grep_matched=1
    echo "${!ap_ref_path}" | grep ":${ap_path}:" &>/dev/null && ap_grep_matched=1

    if [[ "${ap_grep_matched}" == 1 ]]; then
        @mwarn "${ap_path} already existed in ${ap_ref_path} variable!\n"
        @rtn_existed
    fi

    if [ "${ap_opt_append}" == 0 ]; then
        eval "$(printf "%s" "export ${ap_ref_path}=${ap_path}:${!ap_ref_path}")"
    else
        eval "$(printf "%s" "export ${ap_ref_path}=${!ap_ref_path}:${ap_path}")"
    fi

    @rtn_success
}

alias @rmpath='ap_func_remove_path_var'

# @$func $$ ap_func_remove_path_var {
# ap_func_remove_path_var *<path_var>
# Descriptions
# 	Remove all occurrences of <path_var> in $PATH
# Return status
# 	AP_CODE_SUCCESS
# 	AP_CODE_ERR_MISSING_ARGUMENT: Missing argument <path_var>
# }
ap_func_remove_path_var() {
    local ap_path="$1"

    if [[ -z "${ap_path:-}" ]]; then
        echo "Missing argument <PATH_VAR>"
        @rtn_err_missing_argument
    fi

    printf "Removing [%s] in PATH variable\n" "${ap_path}"
    echo "New PATH variable as below"
    local ap_new_path
    ap_new_path="$(echo "${ap_path}" | gsed "s@:${ap_path}@@g" | gsed "s@${ap_path}:@@g")"
    echo "${ap_new_path}"
    export PATH="${ap_new_path}"
    @rtn_success
}

alias @trim='ap_func_trim'
alias @trimfile='@trim -f --'

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

alias @newsshkey='ap_func_new_ssh_key'

# @$func $$ ap_func_new_ssh_key {
# ap_func_new_ssh_key -- <key_priv_name> <comment>
# Description
# 	Create new SSH key (ed25519) at AP_PRJ_SEC7_DIR or current directory
# Return status
# 	AP_CODE_SUCCESS
# }
ap_func_new_ssh_key() {
    local ap_key_name="$1"
    local ap_key_comment="Albert"
    local ap_key_dir="${PWD}"

    if [ -d "${AP_PRJ_SEC7_DIR}" ]; then
        ap_key_dir="${AP_PRJ_SEC7_DIR}"
    fi

    printf "Generate new SSH key (ed25519) at [%s]\n" "${ap_key_dir}/${ap_key_name}"
    ssh-keygen -t ed25519 -C "${ap_key_comment}" -f "${ap_key_name}" -N "" -q
    mv "${ap_key_dir}/${ap_key_name}" "${ap_key_dir}/${ap_key_name}.key.priv"
    mv "${ap_key_dir}/${ap_key_name}.pub" "${ap_key_dir}/${ap_key_name}.key.pub"
    cat "${ap_key_dir}/${ap_key_name}.key.pub" | copy

    @rtn_success
}
