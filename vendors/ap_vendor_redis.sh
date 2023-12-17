alias @initredis="ap_func_init_redis"
ap_func_init_redis() {
    if alias @initrediscommon &>/dev/null; then
        @initrediscommon
    fi
}

alias @createdirstructredis="ap_func_create_dirstruct_redis"
ap_func_create_dirstruct_redis() {
    if alias @createdirstructrediscommon &>/dev/null; then
        @createdirstructrediscommon
    fi
}

alias @rmdirstructredis="ap_func_remove_dirstruct_redis"
ap_func_remove_dirstruct_redis() {
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

    if alias @createdirstructredis &>/dev/null; then
        @createdirstructredis
    fi
}

alias @rmredis="ap_func_remove_redis"
ap_func_remove_redis() {
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
