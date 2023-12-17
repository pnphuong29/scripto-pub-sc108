# https://my.noip.com/dynamic-dns/duc

export AP_VENDORS_NOIP_SETUP_DIR="${AP_SCRIPTO_COMMON_DIR}/vendors/noip"
export AP_VENDORS_NOIP_DIR="${AP_SOFT_DIR}/noip"
# alias noip="${AP_SOFT_DIR}/noip/binaries/noip2-x86_64"

if [[ ! -L /usr/local/bin/noip ]]; then
	@minfo "Create symbolic link to [${AP_VENDORS_NOIP_DIR}/binaries/noip2-x86_64] from [/usr/local/bin/noip]\n"
	sudo ln -s "${AP_VENDORS_NOIP_DIR}/binaries/noip2-x86_64" /usr/local/bin/noip
fi
