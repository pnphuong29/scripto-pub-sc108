export AP_DK_CON_NAME_APACHE_WEBDAV='apache_webdav'

alias dkexecapachewebdav="docker exec -it ${AP_DK_CON_NAME_APACHE_WEBDAV} bash"
alias dkrmapachewebdav="docker rm -f ${AP_DK_CON_NAME_APACHE_WEBDAV}"
alias upapachewebdav="cd ${AP_DOCKERS_DIR}; docker compose -f ap_docker_compose_common.yml -f ap_docker_compose_${AP_DK_CON_NAME_APACHE_WEBDAV}.yml up --build -d"
