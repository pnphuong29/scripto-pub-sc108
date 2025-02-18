alias apinitsshlog="ap_func_init_sshlog"
ap_func_init_sshlog() {
    alias @sshlog="sudo sshlog"
    alias lssshsessions="sshlog sessions"
    alias watchsshsessions="sshlog watch"
    alias zsshlog="cd /var/log/sshlog"
    alias zsshlogsessions="cd /var/log/sshlog/sessions"
    alias showsshlogevents="sudo cat /var/log/sshlog/event.log"
    alias showsshlogdlogs="sudo cat /var/log/sshlog/sshlogd.log"

    if alias apinitsshlogshare &>/dev/null; then
        apinitsshlogshare
    fi

    if alias apinitsshlogcommon &>/dev/null; then
        apinitsshlogcommon
    fi
}

alias apcreatedirstructsshlog="ap_func_create_dirstruct_sshlog"
ap_func_create_dirstruct_sshlog() {
    if alias apcreatedirstructsshlogshare &>/dev/null; then
        apcreatedirstructsshlogshare
    fi

    if alias apcreatedirstructsshlogcommon &>/dev/null; then
        apcreatedirstructsshlogcommon
    fi
}

alias aprmdirstructsshlog="ap_func_rm_dirstruct_sshlog"
ap_func_rm_dirstruct_sshlog() {
    if alias aprmdirstructsshlogshare &>/dev/null; then
        aprmdirstructsshlogshare
    fi

    if alias aprmdirstructsshlogcommon &>/dev/null; then
        aprmdirstructsshlogcommon
    fi
}

alias apsetupsshlog="ap_func_setup_sshlog"
ap_func_setup_sshlog() {
    # https://github.com/sshlog/agent
    aplogshow "Install [sshlog]\n"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        sudo apt update && sudo apt install -y curl gnupg
        curl https://repo.sshlog.com/sshlog-ubuntu/public.gpg | sudo gpg --yes --dearmor -o /usr/share/keyrings/repo-sshlog-ubuntu.gpg
        echo "deb [arch=any signed-by=/usr/share/keyrings/repo-sshlog-ubuntu.gpg] https://repo.sshlog.com/sshlog-ubuntu/ stable main" | sudo tee /etc/apt/sources.list.d/repo-sshlog-ubuntu.list
        sudo apt update && sudo apt install -y sshlog

        apshowmsginfo "Append group [sshlog] to current user [${USER}]\n"
        sudo usermod -aG sshlog "${USER}"

        apshowmsginfo "Start [sshlogd] service\n"
        sudo systemctl start sshlog
    fi

    apinitsshlog
    if alias apcreatedirstructsshlog &>/dev/null; then
        apcreatedirstructsshlog
    fi
}

alias aprmsshlog="ap_func_rm_sshlog"
ap_func_rm_sshlog() {
    aplogshow "Remove [sshlog]\n"

    sudo apt purge -y sshlog
    sudo rm -f /usr/share/keyrings/repo-sshlog-ubuntu.gpg
    sudo rm -f /etc/apt/sources.list.d/repo-sshlog-ubuntu.list
    sudo apt update

    if alias aprmdirstructsshlog &>/dev/null; then
        aprmdirstructsshlog
    fi

    if alias aprmglobalsymlinksshlog &>/dev/null; then
        aprmglobalsymlinksshlog
    fi
}
