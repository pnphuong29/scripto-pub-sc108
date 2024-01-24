alias @initsshlog="ap_func_init_sshlog"
ap_func_init_sshlog() {
    alias @sshlog="sudo sshlog"
    alias lssshsessions="sshlog sessions"
    alias watchsshsessions="sshlog watch"
    alias zsshlog="cd /var/log/sshlog"
    alias zsshlogsessions="cd /var/log/sshlog/sessions"
    alias showsshlogevents="sudo cat /var/log/sshlog/event.log"
    alias showsshlogdlogs="sudo cat /var/log/sshlog/sshlogd.log"

    if alias @initsshlogshare &>/dev/null; then
        @initsshlogshare
    fi

    if alias @initsshlogcommon &>/dev/null; then
        @initsshlogcommon
    fi
}

alias @createdirstructsshlog="ap_func_create_dirstruct_sshlog"
ap_func_create_dirstruct_sshlog() {
    if alias @createdirstructsshlogshare &>/dev/null; then
        @createdirstructsshlogshare
    fi

    if alias @createdirstructsshlogcommon &>/dev/null; then
        @createdirstructsshlogcommon
    fi
}

alias @rmdirstructsshlog="ap_func_rm_dirstruct_sshlog"
ap_func_rm_dirstruct_sshlog() {
    if alias @rmdirstructsshlogshare &>/dev/null; then
        @rmdirstructsshlogshare
    fi

    if alias @rmdirstructsshlogcommon &>/dev/null; then
        @rmdirstructsshlogcommon
    fi
}

alias @setupsshlog="ap_func_setup_sshlog"
ap_func_setup_sshlog() {
    # https://github.com/sshlog/agent
    @logshow "Install [sshlog]\n"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        sudo apt update && sudo apt install -y curl gnupg
        curl https://repo.sshlog.com/sshlog-ubuntu/public.gpg | sudo gpg --yes --dearmor -o /usr/share/keyrings/repo-sshlog-ubuntu.gpg
        echo "deb [arch=any signed-by=/usr/share/keyrings/repo-sshlog-ubuntu.gpg] https://repo.sshlog.com/sshlog-ubuntu/ stable main" | sudo tee /etc/apt/sources.list.d/repo-sshlog-ubuntu.list
        sudo apt update && sudo apt install -y sshlog

        @minfo "Append group [sshlog] to current user [${USER}]\n"
        sudo usermod -aG sshlog "${USER}"

        @minfo "Start [sshlogd] service"
        sudo systemctl start sshlog
    fi

    @initsshlog
    if alias @createdirstructsshlog &>/dev/null; then
        @createdirstructsshlog
    fi
}

alias @rmsshlog="ap_func_rm_sshlog"
ap_func_rm_sshlog() {
    @logshow "Remove [sshlog]\n"

    sudo apt purge -y sshlog
    sudo rm -f /usr/share/keyrings/repo-sshlog-ubuntu.gpg
    sudo rm -f /etc/apt/sources.list.d/repo-sshlog-ubuntu.list
    sudo apt update

    if alias @rmdirstructsshlog &>/dev/null; then
        @rmdirstructsshlog
    fi

    if alias @rmglobalsymlinksshlog &>/dev/null; then
        @rmglobalsymlinksshlog
    fi
}
