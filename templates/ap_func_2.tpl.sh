alias apxxx="ap_alias_xxx"
# @$func $$ ap_func_xxx {
# ap_func_xxx [-dp] <domain/ip> <port> [--] *<src_path> <dst_path>
# Description
#
# Options
# 	-d
# Parameters
# 	<dst>	dest
# Return status
#	AP_CODE_SUCCESS
# }
ap_func_xxx() {
    local ap_opts_string=":dp:"
    local ap_opt=""
    local ap_opt_d=0
    local ap_opt_p=0
    local ap_domain=""

    unset OPTIND

    while getopts "${ap_opts_string}" ap_opt; do
        case "${ap_opt}" in
        "d")
            ap_opt_d=1
            ap_domain_ip="${OPTARG}"
            ;;
        "p")
            ap_opt_p=1
            ;;
        ?)
            echo "Invalid option [${OPTARG}]"
            @reterr_opt_invalid_option
            ;;
        esac
    done

    # Remove all options in parameter list
    shift $((OPTIND - 1))

    # Implementation
    local ap_input_file="$2"

    if [ "${ap_opt_p}" == 1 ]; then

    elif [ "${ap_opt_p}" == 1 ]; then

    else

    fi

    aprtn_success
}
