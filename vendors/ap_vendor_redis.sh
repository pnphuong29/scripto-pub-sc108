alias @initredis="ap_func_init_redis"
ap_func_init_redis() {
    if alias @initredisshare &>/dev/null; then
        @initredisshare
    fi

    if alias @initrediscommon &>/dev/null; then
        @initrediscommon
    fi
}

alias @createdirstructredis="ap_func_create_dirstruct_redis"
ap_func_create_dirstruct_redis() {
    if alias @createdirstructredisshare &>/dev/null; then
        @createdirstructredisshare
    fi

    if alias @createdirstructrediscommon &>/dev/null; then
        @createdirstructrediscommon
    fi
}

alias @rmdirstructredis="ap_func_rm_dirstruct_redis"
ap_func_rm_dirstruct_redis() {
    if alias @rmdirstructredisshare &>/dev/null; then
        @rmdirstructredisshare
    fi

    if alias @rmdirstructrediscommon &>/dev/null; then
        @rmdirstructrediscommon
    fi
}

alias @setupredis="ap_func_setup_redis"
ap_func_setup_redis() {
    # https://redis.io/docs/getting-started/installation/install-redis-on-linux/
    # https://redis.io/docs/getting-started/installation/install-redis-from-source/
    # https://redis.io/docs/getting-started/
    @logshow "Install [Redis]\n"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        brew install redis
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        sudo apt install -y lsb-release
        curl -fsSL https://packages.redis.io/gpg | sudo gpg --dearmor -o /usr/share/keyrings/redis-archive-keyring.gpg

        echo "deb [signed-by=/usr/share/keyrings/redis-archive-keyring.gpg] https://packages.redis.io/deb $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/redis.list

        sudo apt-get update
        sudo apt-get install -y redis redis-server redis-tools
        # sudo snap install redis

        sudo systemctl enable redis-server
        sudo systemctl start redis-server
    fi

    @initredis
    if alias @createdirstructredis &>/dev/null; then
        @createdirstructredis
    fi
}

alias @rmredis="ap_func_rm_redis"
ap_func_rm_redis() {
    @logshow "Remove [redis]\n"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        brew uninstall redis
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        sudo apt purge -y redis redis-server redis-tools
        sudo apt autoremove -y
    fi

    if alias @rmdirstructredis &>/dev/null; then
        @rmdirstructredis
    fi
}

alias showredispasswd='ap_func_get_redis_passwd'
# @$func $$ ap_func_get_redis_passwd
# ap_func_get_redis_passwd [--]
# Description
# 	Get redis passwd in local machine
# Return
# 	AP_CODE_SUCCESS
ap_func_get_redis_passwd() {
    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        printf "%s" "$(grep ^requirepass "$(brew --prefix)"/etc/redis.conf | awk '{print $2}')"
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        printf "%s" "$(sudo grep ^requirepass /etc/redis/redis.conf | awk '{print $2}')"
    fi
    @rtn_success
}
