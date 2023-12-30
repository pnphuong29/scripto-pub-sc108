alias @http="ap_func_httpie"
alias httpget="ap_func_httpie -t GET"
alias httppost="ap_func_httpie -t POST"
alias httppostform="ap_func_httpie -f -t POST"
alias httpput="ap_func_httpie -t PUT"
alias httppatch="ap_func_httpie -t PATCH"
alias httpdelete="ap_func_httpie -t DELETE"

# @$func $$ ap_func_httpie {
# ap_func_httpie [-tf] <request_type> [--] *<api_endpoint> <path> <data>
# Description
#	Run httpie to test api
# Options
# 	-t	Request type [GET, POST, PUT, DELETE]
# 	-f	Using form [application/x-www-form-urlencoded] instead of [application/json]
# Parameters
# 	<api_endpoint>	API Endpoint
# 	<data>	Data
# Return status
#	AP_CODE_SUCCESS
# }
ap_func_httpie() {
    local ap_opts_string="t:f"
    local ap_opt=""
    local ap_request_type="GET"
    local ap_cmd="http"

    unset OPTIND

    while getopts "${ap_opts_string}" ap_opt; do
        case "${ap_opt}" in
        "t")
            ap_request_type="${OPTARG}"
            ;;
        "f")
            ap_cmd="${ap_cmd} --form"
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
    local ap_api_root="$1"
    local ap_api_path="$2"
    ap_cmd="${ap_cmd} ${ap_request_type} ${ap_api_root}${ap_api_path}"

    if [[ $# -gt 2 ]]; then
        local ap_count=0
        for data in "$@"; do
            if [[ ${ap_count} -lt 2 ]]; then
                ap_count=$((ap_count + 1))
                continue
            fi
            ap_cmd="${ap_cmd} ${data}"
        done
    fi

    @minfo "Execute [${ap_cmd}]\n"
    eval "${ap_cmd}"
    @rtn_success
}
