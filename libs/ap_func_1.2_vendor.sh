alias genbashcompletions='ap_func_generate_bash_completions'

# @$func $$ ap_func_generate_bash_completions {
# ap_func_generate_bash_completions [--] [vendor_name...]
# Description
# 	Generate bash completions for input vendor
# Parameters
# 	[vendor_name]	Vendor name
# Return Status
#	AP_CODE_SUCCESS
# }
ap_func_generate_bash_completions() {
    local ap_cmd

    if [ "$#" -gt 0 ]; then
        for ap_vendor_name in "$@"; do
            echo "Generate bash completion for [${ap_vendor_name}]"
            ap_cmd="@gen${ap_vendor_name}completion"
            eval "$(printf "%s" "${ap_cmd}")"
        done
    else
        for ap_cmd in $(grep -hE -o "@gen.+?=" "${AP_SCRIPTO_DIR}/vendors/ap_vendor_"*.sh | gsed "s/=//g"); do
            eval "$(printf "%s" "${ap_cmd}")"
        done

        if [ -d "${AP_SCRIPTO_COMMON_DIR}" ]; then
            for ap_cmd in $(grep -hE -o "@gen.+?=" "${AP_SCRIPTO_COMMON_DIR}/vendors/ap_vendor_"*.sh | gsed "s/=//g"); do
                eval "$(printf "%s" "${ap_cmd}")"
            done
        fi
    fi

    @rtn_success
}
