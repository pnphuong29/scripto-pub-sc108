alias apinitredis="ap_func_init_redis"
ap_func_init_redis() {
    alias rds='redis-cli'

    if alias apinitredisshare &>/dev/null; then
        apinitredisshare
    fi

    if alias apinitrediscommon &>/dev/null; then
        apinitrediscommon
    fi
}

alias apcreatedirstructredis="ap_func_create_dirstruct_redis"
ap_func_create_dirstruct_redis() {
    if alias apcreatedirstructredisshare &>/dev/null; then
        apcreatedirstructredisshare
    fi

    if alias apcreatedirstructrediscommon &>/dev/null; then
        apcreatedirstructrediscommon
    fi
}

alias aprmdirstructredis="ap_func_rm_dirstruct_redis"
ap_func_rm_dirstruct_redis() {
    if alias aprmdirstructredisshare &>/dev/null; then
        aprmdirstructredisshare
    fi

    if alias aprmdirstructrediscommon &>/dev/null; then
        aprmdirstructrediscommon
    fi
}

alias apsetupredis="ap_func_setup_redis"
ap_func_setup_redis() {
    # https://redis.io/docs/latest/operate/oss_and_stack/install/install-stack/docker/
    # https://redis.io/docs/latest/operate/oss_and_stack/install/install-stack/linux/
    # https://redis.io/docs/latest/operate/oss_and_stack/install/install-stack/mac-os/
    aplogshow "Install [Redis]\n"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        brew tap redis-stack/redis-stack
        brew install redis-stack
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        sudo apt install -y lsb-release curl gpg
        curl -fsSL https://packages.redis.io/gpg | sudo gpg --dearmor -o /usr/share/keyrings/redis-archive-keyring.gpg
        sudo chmod 644 /usr/share/keyrings/redis-archive-keyring.gpg
        echo "deb [signed-by=/usr/share/keyrings/redis-archive-keyring.gpg] https://packages.redis.io/deb $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/redis.list
        sudo apt-get update
        sudo apt-get install -y redis-stack-server
        # sudo apt-get install -y redis redis-server redis-tools # old method
        # sudo snap install redis # obsolete

        sudo systemctl enable redis-stack-server
        sudo systemctl start redis-stack-server
        # sudo systemctl enable redis-server
        # sudo systemctl start redis-server
    fi

    apinitredis
    if alias apcreatedirstructredis &>/dev/null; then
        apcreatedirstructredis
    fi
}

alias rapshowmsgredis="ap_func_rm_redis"
ap_func_rm_redis() {
    aplogshow "Remove [redis]\n"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        brew uninstall redis
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        sudo apt purge -y redis-stack-server
        # sudo apt purge -y redis redis-server redis-tools
        sudo apt autoremove -y
    fi

    if alias aprmdirstructredis &>/dev/null; then
        aprmdirstructredis
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
    aprtn_success
}
