alias @initdocker="ap_func_init_docker"
ap_func_init_docker() {
    # https://github.com/docker/compose/tree/master/compose/config
    # https://github.com/docker/cli/tree/master/cli/compose/schema/data

    export DOCKER_CONFIG="${DOCKER_CONFIG:-${HOME}/.docker}"

    alias dk='docker'
    alias dkc="docker compose"

    alias dkbuild="docker build"
    alias dkrun="docker run"
    alias dkrmexistedcontainers="docker rm -f \$(docker ps -a --filter status=exited -q)"
    alias dkps="docker ps -a"
    alias dksysprune="docker system prune -a" # Remove all system cache, etc.

    alias dkvol="docker volume"
    alias dkvolls="docker volume ls"
    alias dkvolinspect='docker volume inspect'
    alias dkvolprune='docker volume prune'

    alias dknet="docker network"
    alias dknetls="docker network ls"
    alias dknetrm="docker network rm"
    alias dknetcreatebridge="docker network create -d bridge"

    alias dkimg="docker image"
    alias dkimgbuild="docker image build"
    alias dkimgls="docker images -a"
    alias dkimgrma="docker image rm -f \$(docker images -aq)"
    alias dkimgrmtmp="docker images | grep \"^<none>\" | awk '{ print \$3 }' | xargs docker image rm"
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

    if alias @initdockershare &>/dev/null; then
        @initdockershare
    fi

    if alias @initdockercommon &>/dev/null; then
        @initdockercommon
    fi
}

alias @createdirstructdocker="ap_func_create_dirstruct_docker"
ap_func_create_dirstruct_docker() {
    if alias @createdirstructdockershare &>/dev/null; then
        @createdirstructdockershare
    fi

    if alias @createdirstructdockercommon &>/dev/null; then
        @createdirstructdockercommon
    fi
}

alias @rmdirstructdocker="ap_func_rm_dirstruct_docker"
ap_func_rm_dirstruct_docker() {
    if alias @rmdirstructdockershare &>/dev/null; then
        @rmdirstructdockershare
    fi

    if alias @rmdirstructdockercommon &>/dev/null; then
        @rmdirstructdockercommon
    fi
}

alias @setupdocker="ap_func_setup_docker"
ap_func_setup_docker() {
    # https://docs.docker.com/engine/install/ubuntu/
    # https://docs.docker.com/compose/install/
    @logshow "Install [docker]\n"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        brew install --cask docker
        # curl -SOL https://desktop.docker.com/mac/main/amd64/Docker.dmg # Intel chip
        # curl -SOL https://desktop.docker.com/mac/main/arm64/Docker.dmg # Apple chip
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        sudo apt update
        sudo apt install -y \
            ca-certificates \
            curl \
            gnupg \
            lsb-release

        sudo mkdir -m 0755 -p /etc/apt/keyrings
        curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
        sudo chmod a+r /etc/apt/keyrings/docker.gpg

        echo \
            "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
			$(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list >/dev/null

        # Remove old versions (keep data)
        sudo apt remove -y docker docker-engine docker.io containerd runc

        # Install docker
        sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

        # cd "${AP_TMP_DIR}"
        # curl -fsSL https://get.docker.com -o get-docker.sh
        # DRY_RUN=1 sudo sh get-docker.sh

        # Install docker-compose v2
        # DOCKER_CONFIG=${DOCKER_CONFIG:-$HOME/.docker}
        # mkdir -p $DOCKER_CONFIG/cli-plugins
        # curl -SL https://github.com/docker/compose/releases/download/v2.4.1/docker-compose-linux-x86_64 -o $DOCKER_CONFIG/cli-plugins/docker-compose
        # chmod +x $DOCKER_CONFIG/cli-plugins/docker-compose
    fi

    @initdocker
    if alias @createdirstructdocker &>/dev/null; then
        @createdirstructdocker
    fi
}

alias @rmdocker="ap_func_rm_docker"
ap_func_rm_docker() {
    @logshow "Remove [docker]\n"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        brew remove --cask docker
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        sudo apt purge -y docker-ce docker-ce-cli containerd.io
        sudo rm -rf /var/lib/docker
        sudo rm -rf /var/lib/containerd
    fi

    if alias @rmdirstructdocker &>/dev/null; then
        @rmdirstructdocker
    fi
}

alias dkrm="ap_func_dk_rm"
# @$func $$ ap_func_dk_rm {
# ap_func_dk_rm <container_pattern>
# Description
# 	Perform `docker rm -f` command for <container_pattern>
# }
ap_func_dk_rm() {
    docker rm -f $(docker ps -a --filter name="$1" -q)
    @rtn_success
}

alias dkimgrm="ap_func_dk_img_rm"
# @$func $$ ap_func_dk_img_rm {
# ap_func_dk_img_rm <img_repo_pattern>
# Description
# 	Perform `docker rmi -f` command for <img_repo_pattern>
# }
ap_func_dk_img_rm() {
    docker rmi -f $(docker images -aq "$1"*)
    @rtn_success
}

alias dkvolrm="ap_func_dk_vol_rm"
# @$func $$ ap_func_dk_vol_rm {
# ap_func_dk_vol_rm <volume_pattern>
# Description
# 	Perform `docker volume rm -f` command for <volume_pattern>
# }
ap_func_dk_vol_rm() {
    docker volume rm -f $(docker volume ls --filter name="$1" -q)
    @rtn_success
}

alias dkps="ap_func_dk_ps"
# @$func $$ ap_func_dk_ps {
# ap_func_dk_ps <container_pattern>
# Description
# 	Perform `docker ps --filter name=` command for <container_pattern>
# }
ap_func_dk_ps() {
    docker ps -a --filter name="$1"
    @rtn_success
}

alias dkexec="ap_func_dk_exec bash"
alias dkexecsh="ap_func_dk_exec sh"
# @$func $$ ap_func_dk_exec {
# ap_func_dk_exec <shell> <container>
# Description
# 	Perform `docker compose up --build` command for the input container
# }
ap_func_dk_exec() {
    docker exec -it "$2" "$1"
    @rtn_success
}

alias dkup="ap_func_dkc_up"
# @$func $$ ap_func_dkc_up {
# ap_func_dkc_up <docker_container_names...>
# Description
# 	Perform `docker compose up --build -d` command for the input docker compose names
# }
ap_func_dkc_up() {
    local ap_cmd="docker compose"

    local ap_dk_con_name
    for ap_dk_con_name in "$@"; do
        if [ -f "${HOME}/scripto-common/dockers/ap_dkc_${ap_dk_con_name}.yml" ]; then
            ap_cmd="${ap_cmd} -f ${HOME}/scripto-common/dockers/ap_dkc_${ap_dk_con_name}.yml"
        elif [ -f "${HOME}/scripto-share/dockers/ap_dkc_${ap_dk_con_name}.yml" ]; then
            ap_cmd="${ap_cmd} -f ${HOME}/scripto-share/dockers/ap_dkc_${ap_dk_con_name}.yml"
        else
            ap_cmd="${ap_cmd} -f ${HOME}/scripto/dockers/ap_dkc_${ap_dk_con_name}.yml"
        fi
    done

    ap_cmd="${ap_cmd} up --build -d"
    @minfo "Execute [${ap_cmd}]\n"
    eval "$(printf "%s" "${ap_cmd}")"
    @rtn_success
}

alias dklogs="ap_func_dk_logs"
alias dklogsrm="ap_func_dk_logs -t"
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
            @rtn_err_opt_invalid_option
            ;;
        esac
    done

    # Remove all options in parameter list
    shift $((OPTIND - 1))

    # Implementation
    local ap_dk_con="$1"

    if [ ${ap_opt_t} == 1 ]; then
        echo "" | sudo tee "$(docker inspect --format='{{.LogPath}}' "${ap_dk_con}")"
    fi

    @rtn_success
}
