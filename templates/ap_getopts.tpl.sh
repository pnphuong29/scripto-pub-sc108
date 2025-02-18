local ap_opts_string=':d:p'
local ap_opt=''
local ap_opt_d=0
local ap_opt_p=0
local ap_domain=""

unset OPTIND

while getopts "${ap_opts_string}" ap_opt; do
	case "${ap_opt}" in
	'd')
		ap_opt_d=1
		ap_domain_ip="${OPTARG}"
		;;
	'p')
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
