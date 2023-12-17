alias viscwdio="vi ${AP_SCRIPTO_COMMON_DIR}/vendors/wdio/ap_init_wdio.sh"

alias wdiorun="npx wdio run ./wdio.conf.js"
alias wdiorunsuite="wdiorun --suite"
alias wdiorunspec="wdiorun --spec"
alias wdiorunmochagrep="wdiorun --mochaOpts.grep"

# @$alias $$ ap_func_wdio {
alias ap_alias_wdio="ap_func_wdio"
alias wdiof="ap_func_wdio"
alias wdiofs="ap_func_wdio -s"
alias wdiofe="ap_func_wdio -e"
alias wdiofsm="ap_func_wdio -sm"
alias wdiofem="ap_func_wdio -em"
# }

# @$func $$ ap_func_wdio {
# ap_func_wdio [-sem] [--] <suite/spec> <mochaOpts>
# Description
#	Run wdio command
# Options
# 	-s	--suite
#	-e	--spec
# 	-m	--mochaOpts
# Parameters
# 	<suite/spec> Specify suite or spec in [wdio.conf.js]
# 	<mochaOpts> Specify mochaOpts.XXX parameters such as mochaOpts.grep "Bulk create"
# Return status
#	AP_CODE_SUCCESS
# }

ap_func_wdio() {
    local ap_opts_string=":sem"
    local ap_opt=""
    local ap_opt_s=0
    local ap_opt_e=0
    local ap_opt_m=0
    local ap_domain=""

    unset OPTIND

    while getopts "${ap_opts_string}" ap_opt; do
        case "${ap_opt}" in
        "s")
            ap_opt_s=1
            ;;
        "e")
            ap_opt_e=1
            ;;
        "m")
            ap_opt_m=1
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
    local ap_cmd="npx wdio run ./wdio.conf.js"

    if [ "${ap_opt_s}" == 1 ]; then
        local ap_suite="$1"
        ap_cmd="${ap_cmd} --suite ${ap_suite}"
    elif [ "${ap_opt_e}" == 1 ]; then
        local ap_spec="$1"
        ap_cmd="${ap_cmd} --spec ${ap_spec}"
    fi

    local ap_mocha_opts="$2"
    if [ -n "${ap_mocha_opts}" ]; then
        ap_cmd="${ap_cmd} --mochaOpts.${ap_mocha_opts}"
        local ap_mocha_params="$3"
        if [ -n "${ap_mocha_params}" ]; then
            ap_cmd="${ap_cmd} ${ap_mocha_params}"
        fi
    fi

    echo "${ap_cmd}"
    eval "${ap_cmd}"
    @retsuccess
}
