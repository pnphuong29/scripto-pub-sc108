alias aprtn_success="return \${AP_CODE_SUCCESS}"
alias aprtn_existed="return \${AP_CODE_EXISTED}"
alias aprtn_err_missing_argument="return \${AP_CODE_ERR_MISSING_ARGUMENT}"
alias aprtn_err_missing_info="return \${AP_CODE_ERR_MISSING_INFO}"
alias aprtn_err_not_enough_arguments="return \${AP_CODE_ERR_NOT_ENOUGH_ARGUMENTS}"
alias aprtn_err_invalid_argument="return \${AP_CODE_ERR_INVALID_ARGUMENT}"
alias aprtn_err_opt_invalid_option="return \${AP_CODE_ERR_OPT_INVALID_OPTION}"
alias aprtn_err_file_not_found="return \${AP_CODE_ERR_FILE_NOT_FOUND}"
alias aprtn_err_unknown="return \${AP_CODE_ERR_UNKNOWN}"

alias apshowmsggreen='ap_func_show_msg -e -n -f "${AP_SCHEME_COLOR_GREEN}" --'
alias apshowmsgred='ap_func_show_msg -e -n -f "${AP_SCHEME_COLOR_RED}" --'
alias apshowmsgyellow='ap_func_show_msg -e -n -f "${AP_SCHEME_COLOR_YELLOW}" --'
alias apshowmsgcyan='ap_func_show_msg -e -n -f "${AP_SCHEME_COLOR_CYAN}" --'
alias apshowmsgmagenta='ap_func_show_msg -e -n -f "${AP_SCHEME_COLOR_MAGENTA}" --'

alias apshowmsginfo="ap_func_show_msg -e -n -f \${AP_SCHEME_COLOR_CYAN} --"
alias apshowmsgsuccess="ap_func_show_msg -e -n -f \${AP_SCHEME_COLOR_GREEN} -- \${AP_SYM_SUCCESS} "
alias apshowmsgerror="ap_func_show_msg -e -n -f \${AP_SCHEME_COLOR_RED} --"
alias apshowmsgwarn="ap_func_show_msg -e -n -f \${AP_SCHEME_COLOR_YELLOW} --"
alias apshowmsglog="ap_func_show_msg -e -n -f \${AP_SCHEME_COLOR_CYAN} --"
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

    if [[ "${AP_LOGS_GENERAL_ENABLED}" == 1 ]]; then
        printf "%s" "${ap_param_text_escaped}" >>"${AP_LOGS_GENERAL_FILE}"
        [ "${ap_opt_suppress_new_line}" -eq 0 ] && echo >>"${AP_LOGS_GENERAL_FILE}"
    fi

    if [[ "${AP_LOGS_DEBUG_ENABLED}" == 1 ]]; then
        printf "%s" "${ap_param_text_escaped}" >>"${AP_LOGS_DEBUG_FILE}"
        [ "${ap_opt_suppress_new_line}" -eq 0 ] && echo >>"${AP_LOGS_DEBUG_FILE}"
    fi

    aprtn_success
}

alias apshowhyphen='ap_func_show_symbols -f "${AP_SCHEME_COLOR_RED}" -- "-" 70'
alias apshowhash='ap_func_show_symbols -f "${AP_SCHEME_COLOR_RED}" -- "#" 70'
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
        ap_func_show_msg -e -n -c "${ap_opt_color_scheme}" -f "${ap_opt_format_string}" -- "${ap_symbol_string}"
    else
        ap_func_show_msg -e -c "${ap_opt_color_scheme}" -f "${ap_opt_format_string}" -- "${ap_symbol_string}"
    fi

    aprtn_success
}

alias aplog='ap_func_log_msg "general" 0 "apshowmsggreen"'
alias aplogerror='ap_func_log_msg "error" 0 "apshowmsgred"'
alias aplogdebug='ap_func_log_msg "debug" 0 "apshowmsgyellow"'

alias aplogshow='ap_func_log_msg "general" 1 "apshowmsggreen"'
alias aplogshowerror='ap_func_log_msg "error" 1 "apshowmsgred"'
alias aplogshowdebug='ap_func_log_msg "debug" 1 "apshowmsgyellow"'

alias aplogshow='ap_func_log_msg "general" 1 "apshowmsggreen"'
alias aplogshowpassed='ap_func_log_msg -p "${AP_SYM_PASSED} " -- "general" 1 "apshowmsggreen"'
alias aplogshowfailed='ap_func_log_msg -p "${AP_SYM_FAILED} " -- "general" 1 "apshowmsggreen"'
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
            echo "Invalid option [${OPTARG}]"
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

    if [[ "${ap_param_msg_type}" == "general" ]]; then
        ap_log_file_path="${AP_LOGS_GENERAL_FILE}"
    elif [[ "${ap_param_msg_type}" == "debug" ]]; then
        ap_log_file_path="${AP_LOGS_DEBUG_FILE}"
    elif [[ "${ap_param_msg_type}" == "error" ]]; then
        ap_log_file_path="${AP_LOGS_ERROR_FILE}"
    fi

    # Add more information to log messages
    ap_msg="$(gdate "+%Y-%m-%d %H:%M:%S"): ${ap_opt_msg_prefix}${ap_param_msg}"

    # Write messages to log file
    case "${ap_param_msg_type}" in
    'general')
        if [[ "${AP_LOGS_GENERAL_ENABLED}" == 1 ]]; then
            printf "%b" "${ap_msg}" >>"${ap_log_file_path}"
        fi
        ;;
    'debug')
        if [[ "${AP_LOGS_DEBUG_ENABLED}" == 1 ]]; then
            printf "%b" "${ap_msg}" >>"${ap_log_file_path}"
        fi
        ;;
    'error')
        printf "%b" "${ap_msg}" >>"${ap_log_file_path}"
        ;;
    ':')
        echo "Missing message type argument"
        return 1
        ;;
    *)
        echo "Unknown message type [${OPTARG}]"
        return 1
        ;;
    esac

    # if [[ "${ap_param_msg_type}" == "debug" ]]; then
    #     # Only write debug log if enabled
    #     if [[ "${AP_LOGS_DEBUG_ENABLED}" == 1 ]]; then
    #         printf "%b" "${ap_msg}" >>"${ap_log_file_path}"
    #     fi
    # else
    #     printf "%b" "${ap_msg}" >>"${ap_log_file_path}"
    # fi

    # Show message on terminal
    [[ "${ap_param_show_msg_on_terminal}" == 1 ]] && eval "$(printf "%b" "${ap_param_cmd_show_msg} \"${ap_opt_msg_prefix}${ap_param_msg}\"")"

    aprtn_success
}

alias apaddpath="ap_func_add_path_var"
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
            aprtn_err_opt_invalid_option
            ;;
        esac
    done

    # Remove all options in parameter list
    shift $((OPTIND - 1))

    local ap_path="$1"

    if [ -z "${ap_path:-}" ]; then
        echo "Missing argument <PATH_VAR>"
        aprtn_err_missing_argument
    fi

    if [ ! -d "${ap_path}" ]; then
        # apshowmsgwarn "Path [${ap_path}] does not exist!\n"
        aprtn_err_file_not_found
    fi

    local ap_ref_path="PATH"
    if [ "${ap_opt_manpath}" == 1 ]; then
        ap_ref_path="MANPATH"
    fi

    local ap_grep_matched=0

    echo "${!ap_ref_path}" | grep "^${ap_path}:" &>/dev/null && ap_grep_matched=1
    echo "${!ap_ref_path}" | grep ":${ap_path}$" &>/dev/null && ap_grep_matched=1
    echo "${!ap_ref_path}" | grep ":${ap_path}:" &>/dev/null && ap_grep_matched=1

    # Exit if ap_path already existed in ap_ref_path
    # if [ "${ap_grep_matched}" == 1 ]; then
    #     # apshowmsgwarn "${ap_path} already existed in ${ap_ref_path} variable!\n"
    #     aprtn_existed
    # fi

    # Remove all occurrences of ap_path in ap_ref_path
    # This to make sure there is only one occurrence of ap_path in ap_ref_path after prepending or appending
    if [ "${ap_grep_matched}" == 1 ]; then
        local ap_ref_path_new
        ap_ref_path_new="$(printf "%s" "${!ap_ref_path}" | gsed "s@:${ap_path}@@g" | gsed "s@${ap_path}:@@g" | gsed "s@:${ap_path}:@@g")"
        # aplogdebug "Old ref path = [${!ap_ref_path}\n\n]"
        eval "$(printf "%s" "export ${ap_ref_path}=${ap_ref_path_new}")"
        # aplogdebug "New ref path = [${ap_ref_path_new}\n]"
    fi

    if [ "${ap_opt_append}" == 0 ]; then
        eval "$(printf "%s" "export ${ap_ref_path}=${ap_path}:${!ap_ref_path}")"
    else
        eval "$(printf "%s" "export ${ap_ref_path}=${!ap_ref_path}:${ap_path}")"
    fi

    aprtn_success
}

alias aprmpath='ap_func_rm_path_var'
# @$func $$ ap_func_rm_path_var {
# ap_func_rm_path_var *<path_var>
# Descriptions
# 	Remove all occurrences of <path_var> in $PATH
# Return status
# 	AP_CODE_SUCCESS
# 	AP_CODE_ERR_MISSING_ARGUMENT: Missing argument <path_var>
# }
ap_func_rm_path_var() {
    local ap_path="$1"

    if [[ -z "${ap_path:-}" ]]; then
        echo "Missing argument <PATH_VAR>"
        aprtn_err_missing_argument
    fi

    printf "Removing [%s] in PATH variable\n" "${ap_path}"
    echo "New PATH variable as below"
    local ap_new_path
    ap_new_path="$(echo "${ap_path}" | gsed "s@:${ap_path}@@g" | gsed "s@${ap_path}:@@g")"
    echo "${ap_new_path}"
    export PATH="${ap_new_path}"
    aprtn_success
}
