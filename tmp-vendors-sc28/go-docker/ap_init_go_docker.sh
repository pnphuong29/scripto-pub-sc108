# https://github.com/docker/compose/tree/master/compose/config
# https://github.com/docker/cli/tree/master/cli/compose/schema/data

export DOCKER_CONFIG="${DOCKER_CONFIG:-$HOME/.docker}"
export AP_VENDORS_DOCKER_SETUP_DIR="${AP_SCRIPTO_COMMON_DIR}/vendors/go-docker"
export AP_DOCKERS_DIR="${AP_VENDORS_DOCKER_SETUP_DIR}/dockers"

# Append current user to group [docker] to prevent typing sudo for every docker command
if [[ "${AP_OS_TYPE}" != "${AP_OS_TYPE_MACOS}" ]]; then
    if ! groups "${USER}" | grep docker &>/dev/null; then
        @minfo "Append current user to group [docker]\n"
        sudo usermod -a -G docker "${USER}"
    fi
fi

# Environment variables
export AP_DKCF_VER="3.11"

export AP_DK_CON_MYSQL="mysql"
export AP_DK_CON_PG="pg"
export AP_DK_CON_ADMINER="adminer"
export AP_DK_CON_PMA="pma"
export AP_DK_CON_PGA="pga"
export AP_DK_CON_FILEPUBLIC="filepublic"
export AP_DK_CON_OPENPROJECT="openproject"
export AP_DK_CON_ORANGEHRM="orangehrm"
export AP_DK_CON_NEXTCLOUD="nextcloud"
export AP_DK_CON_GITLAB="gitlab"
export AP_DK_CON_TMP="tmp"
export AP_DK_CON_NODETUS="nodetus"
export AP_DK_CON_JL="jl"
export AP_DK_CON_JL_PG="jlpg"
export AP_DK_CON_FILEBROWSER="filebrowser"
export AP_DK_CON_HEDGEDOC="hedgedoc"
export AP_DK_CON_HEDGEDOC_PG="hedgedocpg"
export AP_DK_CON_PICOSHARE="picoshare"
export AP_DK_CON_DUFS="dufs"
export AP_DK_CON_MB="mb"
export AP_DK_CON_MB_PG="mbpg"
export AP_DK_CON_WP="wp"
export AP_DK_CON_WP_MYSQL="wpmysql"
export AP_DK_CON_WOO="woo"
export AP_DK_CON_WOO_MYSQL="woomysql"

# Execute init script for each docker
for ap_file in ${AP_DOCKERS_DIR}/ap_dk_init_*; do
    source "${ap_file}"
done

# Aliases
alias zscdockers='cd "${AP_DOCKERS_DIR}"'

alias viscdockers="zscdockers; vibulk \
	\${AP_VENDORS_DOCKER_SETUP_DIR}/ap_init_go_docker.sh \
	\${AP_VENDORS_DOCKER_SETUP_DIR}/ap_setup_go_docker.sh \
	\${AP_VENDORS_DOCKER_SETUP_DIR}/ap_remove_go_docker.sh \
	ap_dkc_common.yml \
	\${AP_SCRIPTO_COMMON_DIR}/ap_servers.sh \
	\${AP_SCRIPTO_COMMON_DIR}/ap_init_secrets.sh \
	\${AP_SECRETS_DIR}/ap_init_secrets.sh"

alias dk='docker'
alias dkc="docker compose"

alias dkbld="docker build"
alias dkrun="docker run"
alias dkrm="docker rm -f"
alias dkrmexistedcontainers="docker rm -f \$(docker ps --filter status=exited -q)"
alias dkps="docker ps -a"
alias dksysprune="docker system prune -a" # Remove all system cache, etc.

alias dkvol="docker volume"
alias dkvolls="docker volume ls"
alias dkvolrm="docker volume rm"
alias dkvolinspect='docker volume inspect'
alias dkvolprune='docker volume prune'

alias dknet="docker network"
alias dknetls="docker network ls"
alias dknetrm="docker network rm"
alias dknetcreatebridge="docker network create -d bridge"

alias dkimg="docker image"
alias dkimgbld="docker image build"
alias dkimgls="docker image ls -a"
alias dkimgrm="docker image rm"
alias dkimgrma="docker image rm -f \$(docker image ls -aq)"
alias dkimgrmtmp="docker images | grep \"^<none>\" | awk '{ print $3 }' | xargs docker image rm"
alias dkimgprune="docker image prune -a"

alias dklogs="docker logs"
alias dklogsfollow="docker logs --follow"
alias dklogsfollowtimestamps="docker logs --follow --timestamps"

alias dkcon="docker container"
alias dkconls="docker container ls -a"
alias dkconrm="docker container rm -f"
alias dkconrestart="docker container restart"
alias dkconrma="docker rm -f \$(docker container ls -aq)"

alias dkinspect="docker inspect"
alias dkinspectlogpath="docker inspect --format='{{.LogPath}}'"

alias dkupessentialdockers="\
	dkup \${AP_DK_CON_MYSQL}; \
	dkup \${AP_DK_CON_PG}; \
	dkup \${AP_DK_CON_ADMINER}; \
	dkup \${AP_DK_CON_PMA}; \
	dkup \${AP_DK_CON_PGA}; \
	dkup \${AP_DK_CON_FILEBROWSER}; \
	dkup \${AP_DK_CON_FILEPUBLIC}; \
	dkup \${AP_DK_CON_OPENPROJECT}; \
	dkup \${AP_DK_CON_GITLAB}; \
	dkup \${AP_DK_CON_JL}; \
	dkup \${AP_DK_CON_HEDGEDOC}; \
	dkup \${AP_DK_CON_MB}"

# @$alias $$ ap_func_dk_rm {
alias ap_alias_dk_rm="ap_func_dk_rm"
alias dkrmf="ap_alias_dk_rm"
# }

# @$func $$ ap_func_dk_rm {
# ap_func_dk_rm <container_pattern>
# Description
# 	Perform `docker rm -f` command for <container_pattern>
# }
ap_func_dk_rm() {
    docker rm -f $(docker ps -a --filter name="$1" -q)
    @retsuccess
}

# @$alias $$ ap_func_dk_vol_rm {
alias ap_alias_dk_vol_rm="ap_func_dk_vol_rm"
alias dkvolrmf="ap_alias_dk_vol_rm"
# }

# @$func $$ ap_func_dk_vol_rm {
# ap_func_dk_vol_rm <volume_pattern>
# Description
# 	Perform `docker volume rm -f` command for <volume_pattern>
# }
ap_func_dk_vol_rm() {
    docker volume rm -f $(docker volume ls --filter name="$1" -q)
    @retsuccess
}

# @$alias $$ ap_func_dk_ps {
alias ap_alias_dk_ps="ap_func_dk_ps"
alias dkpsf="ap_alias_dk_ps"
# }

# @$func $$ ap_func_dk_ps {
# ap_func_dk_ps <container_pattern>
# Description
# 	Perform `docker ps --filter name=` command for <container_pattern>
# }
ap_func_dk_ps() {
    docker ps -a --filter name="$1"
    @retsuccess
}

# @$alias $$ ap_func_dk_exec {
alias ap_alias_dk_exec="ap_func_dk_exec"
alias dkexec="ap_alias_dk_exec bash"
alias dkexecsh="ap_alias_dk_exec sh"
# }

# @$func $$ ap_func_dk_exec {
# ap_func_dk_exec <shell> <container>
# Description
# 	Perform `docker compose up --build` command for the input container
# }
ap_func_dk_exec() {
    docker exec -it "$2" "$1"
    @retsuccess
}

# @$alias $$ ap_func_dkc_up {
alias ap_alias_dkc_up="ap_func_dkc_up"
alias dkup="ap_alias_dkc_up"
# }

# @$func $$ ap_func_dkc_up {
# ap_func_dkc_up <docker_container_names...>
# Description
# 	Perform `docker compose up --build` command for the input docker compose names
# }
ap_func_dkc_up() {
    local ap_cmd="docker compose -f ${AP_DOCKERS_DIR}/ap_dkc_common.yml"

    local ap_dk_con_name
    for ap_dk_con_name in $@; do
        ap_cmd="${ap_cmd} -f ${AP_DOCKERS_DIR}/ap_dkc_${ap_dk_con_name}.yml"
    done

    ap_cmd="${ap_cmd} up --build -d"
    @logdbg "${ap_cmd}\n"
    eval "$(echo "${ap_cmd}")"
    @retsuccess
}

# @$alias $$ ap_func_dk_logs {
alias ap_alias_dk_logs="ap_func_dk_logs"
alias dklogsf="ap_alias_dk_logs"
alias dklogsrm="ap_alias_dk_logs -t"
# }

# @$func $$ ap_func_dk_logs {
# ap_func_dk_logs [-t] <container>
# Description
# 	Perform `docker logs` command for the input container
# Options
# 	-t	Truncate
# Parameters
# 	<container>	Docker container
# Return status
#	AP_CODE_SUCCESS
# }
ap_func_dk_logs() {
    local ap_opts_string=":t"
    local ap_opt_t=0

    unset OPTIND

    while getopts "${ap_opts_string}" ap_opt; do
        case "${ap_opt}" in
        "t")
            ap_opt_t=1
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
    local ap_dk_con="$1"

    if [ ${ap_opt_t} == 1 ]; then
        echo "" | sudo tee $(docker inspect --format='{{.LogPath}}' "${ap_dk_con}")
    fi

    @retsuccess
}
