alias apinitdocker="ap_func_init_docker"
ap_func_init_docker() {
    # https://github.com/docker/compose/tree/master/compose/config
    # https://github.com/docker/cli/tree/master/cli/compose/schema/data

    export DOCKER_CONFIG="${DOCKER_CONFIG:-${HOME}/.docker}"

    alias dk='docker'
    alias dkc="docker compose"

    alias dkbuild="docker build"
    alias dkrun="docker run"
    alias dkstats="docker stats"
    alias dksysprune="docker system prune -a"   # Remove all system cache, etc.
    alias dkbuilderprune="docker builder prune" # Remove build cache

    alias dkps="docker ps -a"

    alias dkrmexistedcontainers="docker rm -f \$(docker ps -a --filter status=exited -q)"
    alias dkrma="docker rm -f \$(docker ps -aq)"
    alias dkrmbuildcache="docker builder prune" # Remove build cache
    alias dkrmtmpimages="docker images | grep \"^<none>\" | awk '{ print \$3 }' | xargs docker image rm"

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
    alias dkinspectmounts="docker inspect --format='{{json .Mounts}}'"

    if alias apinitdockershare &>/dev/null; then
        apinitdockershare
    fi

    if alias apinitdockercommon &>/dev/null; then
        apinitdockercommon
    fi
}

alias apcreatedirstructdocker="ap_func_create_dirstruct_docker"
ap_func_create_dirstruct_docker() {
    if alias apcreatedirstructdockershare &>/dev/null; then
        apcreatedirstructdockershare
    fi

    if alias apcreatedirstructdockercommon &>/dev/null; then
        apcreatedirstructdockercommon
    fi
}

alias aprmdirstructdocker="ap_func_rm_dirstruct_docker"
ap_func_rm_dirstruct_docker() {
    aplogshow "Generate [docker] bash autocomplete\n"
    docker completion bash >"${AP_COMPLETIONS_DIR}/ap_completion_docker.bash"

    if alias aprmdirstructdockershare &>/dev/null; then
        aprmdirstructdockershare
    fi

    if alias aprmdirstructdockercommon &>/dev/null; then
        aprmdirstructdockercommon
    fi
}

alias apsetupdocker="ap_func_setup_docker"
ap_func_setup_docker() {
    # https://docs.docker.com/engine/install/ubuntu/
    # https://docs.docker.com/compose/install/
    aplogshow "Install [docker]\n"

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

    apinitdocker
    if alias apcreatedirstructdocker &>/dev/null; then
        apcreatedirstructdocker
    fi
}

alias aprmdocker="ap_func_rm_docker"
ap_func_rm_docker() {
    aplogshow "Remove [docker]\n"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        brew remove --cask docker
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        sudo apt purge -y docker-ce docker-ce-cli containerd.io
        sudo rm -rf /var/lib/docker
        sudo rm -rf /var/lib/containerd
    fi

    if alias aprmdirstructdocker &>/dev/null; then
        aprmdirstructdocker
    fi
}

alias dkinspectfmt="ap_func_dk_inspect_fmt"
ap_func_dk_inspect_fmt() {
    docker inspect --format '{{ "$1" }}'
    aprtn_success
}

alias dkrm="ap_func_dk_rm"
ap_func_dk_rm() {
    docker rm -f $(docker ps -aq --filter "name=${1}")
    aprtn_success
}

alias dkimgrm="ap_func_dk_img_rm"
ap_func_dk_img_rm() {
    docker rmi -f $(docker images -aq "${1}"*)
    aprtn_success
}

alias dkvolrm="ap_func_dk_vol_rm"
ap_func_dk_vol_rm() {
    docker volume rm -f $(docker volume ls -q --filter "name=${1}")
}

alias dkpsfiltername="ap_func_dk_ps_filter_name"
ap_func_dk_ps_filter_name() {
    docker ps -a --filter "name=${1}"
}

alias dkpsfilterstatusexited="ap_func_dk_ps_filter_status exited"
alias dkpsfilterstatus="ap_func_dk_ps_filter_status"
ap_func_dk_ps_filter_status() {
    docker ps -a --filter "status=${1}"
}

alias dkexec="ap_func_dk_exec bash"
alias dkexecsh="ap_func_dk_exec sh"
ap_func_dk_exec() {
    docker exec -it "$2" "$1"
}

alias dkcup="ap_func_dkc_up"
alias dkcdown="ap_func_dkc_up -d"
alias dkcupdev="ap_func_dkc_up -p dev"
alias dkcdowndev="ap_func_dkc_up -d -p dev"
alias dkcuptest="ap_func_dkc_up -p test"
alias dkcdowntest="ap_func_dkc_up -d -p test"
alias dkcupuat="ap_func_dkc_up -p uat"
alias dkcdownuat="ap_func_dkc_up -d -p uat"
alias dkcupstaging="ap_func_dkc_up -p staging"
alias dkcdownstaging="ap_func_dkc_up -d -p staging"
alias dkcupprod="ap_func_dkc_up -p prod"
alias dkcdownprod="ap_func_dkc_up -d -p prod"
# @$func $$ ap_func_dkc_up {
# ap_func_dkc_up [-pn] <profile> [--] <docker_container_names...>
# Description
# 	Perform `docker compose up --build -d` command for the input docker compose names
# Options
#   -d  Perform docker compose down instead
#   -n  No cache when building image
# 	-p	Profile
# Parameters
# 	docker_container_names	Docker containers
# }
ap_func_dkc_up() {
    local ap_opts_string=":p:nd"
    local ap_opt_profile=""
    local ap_opt_cache=""
    local ap_opt_d=0

    unset OPTIND

    while getopts "${ap_opts_string}" ap_opt; do
        case "${ap_opt}" in
        "p")
            ap_opt_profile="${OPTARG}"
            ;;
        "n")
            ap_opt_cache="--no-cache"
            ;;
        "d")
            ap_opt_d=1
            ;;
        ?)
            echo "Invalid option [${OPTARG}]"
            aprtn_err_opt_invalid_option
            ;;
        esac
    done

    # Remove all options in parameter list
    shift $((OPTIND - 1))

    local ap_cmd
    ap_cmd="docker compose"

    # Environments
    for ap_dk_con_name in "$@"; do
        if [ -f "${HOME}/scripto-share/dockers/environments/${ap_dk_con_name}.env" ]; then
            ap_cmd="${ap_cmd} --env-file ${HOME}/scripto-share/dockers/environments/${ap_dk_con_name}.env"
        fi

        if [ -f "${HOME}/scripto-common/dockers/environments/${ap_dk_con_name}.env" ]; then
            ap_cmd="${ap_cmd} --env-file ${HOME}/scripto-common/dockers/environments/${ap_dk_con_name}.env"
        fi

        if [ -f "${HOME}/scripto-main/dockers/environments/${ap_dk_con_name}.env" ]; then
            ap_cmd="${ap_cmd} --env-file ${HOME}/scripto-main/dockers/environments/${ap_dk_con_name}.env"
        fi
    done

    # profile
    if [[ -n "${ap_opt_profile}" ]]; then
        ap_cmd="${ap_cmd} --profile ${ap_opt_profile}"
    fi

    # common
    if [ -f "${HOME}/scripto-share/dockers/ap_dkc_common.yml" ]; then
        ap_cmd="${ap_cmd} -f ${HOME}/scripto-share/dockers/ap_dkc_common.yml"
    fi

    if [ -f "${HOME}/scripto-common/dockers/ap_dkc_common.yml" ]; then
        ap_cmd="${ap_cmd} -f ${HOME}/scripto-common/dockers/ap_dkc_common.yml"
    fi

    if [ -f "${HOME}/scripto-main/dockers/ap_dkc_common.yml" ]; then
        ap_cmd="${ap_cmd} -f ${HOME}/scripto-main/dockers/ap_dkc_common.yml"
    fi

    # specific
    local ap_dk_con_name
    for ap_dk_con_name in "$@"; do
        if [ -f "${PWD}/ap_dkc_${ap_dk_con_name}.yml" ]; then
            ap_cmd="${ap_cmd} -f ${PWD}/ap_dkc_${ap_dk_con_name}.yml"
        elif [ -f "${HOME}/scripto-main/dockers/ap_dkc_${ap_dk_con_name}.yml" ]; then
            ap_cmd="${ap_cmd} -f ${HOME}/scripto-main/dockers/ap_dkc_${ap_dk_con_name}.yml"
        elif [ -f "${HOME}/scripto-common/dockers/ap_dkc_${ap_dk_con_name}.yml" ]; then
            ap_cmd="${ap_cmd} -f ${HOME}/scripto-common/dockers/ap_dkc_${ap_dk_con_name}.yml"
        elif [ -f "${HOME}/scripto-share/dockers/ap_dkc_${ap_dk_con_name}.yml" ]; then
            ap_cmd="${ap_cmd} -f ${HOME}/scripto-share/dockers/ap_dkc_${ap_dk_con_name}.yml"
        elif [ -f "${PWD}/scripto/dockers/ap_dkc_${ap_dk_con_name}.yml" ]; then
            ap_cmd="${ap_cmd} -f ${HOME}/scripto/dockers/ap_dkc_${ap_dk_con_name}.yml"
        fi
    done

    if [[ "${ap_opt_d}" == 1 ]]; then
        ap_cmd="${ap_cmd} down"
    else
        ap_cmd="${ap_cmd} up --build -d ${ap_opt_cache}"
    fi

    apshowmsginfo "Execute [${ap_cmd}]\n"
    eval "$(printf "%s" "${ap_cmd}")"

    aprtn_success
}

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
            aprtn_err_opt_invalid_option
            ;;
        esac
    done

    # Remove all options in parameter list
    shift $((OPTIND - 1))

    # Implementation
    local ap_dk_container="$1"

    if [ ${ap_opt_t} == 1 ]; then
        echo "" | sudo tee "$(docker inspect --format='{{.LogPath}}' "${ap_dk_container}")"
    fi

    aprtn_success
}
