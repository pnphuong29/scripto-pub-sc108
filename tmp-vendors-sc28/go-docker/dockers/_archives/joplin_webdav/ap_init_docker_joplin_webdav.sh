alias dkexecjoplinwebdav="docker exec -it joplin-webdav bash"
alias dkrmjoplinwebdav="docker rm -f joplin-webdav"
alias dkcubjoplinwebdav="cd ${AP_DOCKERS_DIR}; docker compose -f ap_docker_compose_common.yml -f ap_docker_compose_joplin_webdav.yml up --build"
alias dkcubdjoplinwebdav="cd ${AP_DOCKERS_DIR}; docker compose -f ap_docker_compose_common.yml -f ap_docker_compose_joplin_webdav.yml up --build -d"
