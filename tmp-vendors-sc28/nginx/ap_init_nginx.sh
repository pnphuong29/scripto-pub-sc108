# https://nginx.org/en/linux_packages.html

export AP_VENDORS_NGINX_SETUP_DIR="${AP_SCRIPTO_COMMON_DIR}/vendors/nginx"
export AP_VENDORS_NGINX_SETUP_CONFIGS_DIR="${AP_VENDORS_NGINX_SETUP_DIR}/configs"

alias zscnginxsetup="cd ${AP_VENDORS_NGINX_SETUP_DIR}"
alias zscnginxconfigs="cd ${AP_VENDORS_NGINX_SETUP_CONFIGS_DIR}"
alias znginxconfd="cd /etc/nginx/conf.d"
alias znginxlogs="cd /var/log/nginx"

alias nginxupdateconfigsddns1='sudo rm -f /etc/nginx/conf.d/*; sudo cp -f "${AP_VENDORS_NGINX_SETUP_CONFIGS_DIR}"/conf.d/ddns1/*.conf /etc/nginx/conf.d/; sudo systemctl restart nginx'

alias nginxupdateconfigsddns3='sudo rm -f /etc/nginx/conf.d/*; sudo cp -f "${AP_VENDORS_NGINX_SETUP_CONFIGS_DIR}"/conf.d/ddns3/*.conf /etc/nginx/conf.d/; sudo systemctl restart nginx'

alias nginxrestart='sudo systemctl restart nginx'
alias nginxreloadconfig='sudo nginx -s reload'

alias viscnginxddns1='vi -p \
	"${AP_VENDORS_NGINX_SETUP_DIR}/ap_init_nginx.sh" \
	"${AP_VENDORS_NGINX_SETUP_DIR}/configs/conf.d/renew/"/*.conf \
	"${AP_VENDORS_NGINX_SETUP_CONFIGS_DIR}/conf.d/ddns1"/*.conf \
	'

alias viscnginxddns3='vi -p \
	"${AP_VENDORS_NGINX_SETUP_DIR}/ap_init_nginx.sh" \
	"${AP_VENDORS_NGINX_SETUP_DIR}/configs/conf.d/renew/"/*.conf \
	"${AP_VENDORS_NGINX_SETUP_CONFIGS_DIR}/conf.d/ddns3"/*.conf \
	'
