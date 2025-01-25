alias apinitfigmaagent="ap_func_init_figmaagent"
ap_func_init_figmaagent() {
    alias ssfigmaagent='systemctl --user status figma-agent.agent'
    alias rrfigmaagent='systemctl --user restart figma-agent.agent'
    alias ssfigmasocket='systemctl --user status figma-agent.socket'
    alias rrfigmasocket='systemctl --user restart figma-agent.socket'

    if alias apinitfigmaagentshare &>/dev/null; then
        apinitfigmaagentshare
    fi

    if alias apinitfigmaagentcommon &>/dev/null; then
        apinitfigmaagentcommon
    fi

    if alias apinitfigmaagentmain &>/dev/null; then
        apinitfigmaagentmain
    fi
}

alias apcreatedirstructfigmaagent="ap_func_create_dirstruct_figmaagent"
ap_func_create_dirstruct_figmaagent() {
    if alias apcreatedirstructfigmaagentshare &>/dev/null; then
        apcreatedirstructfigmaagentshare
    fi

    if alias apcreatedirstructfigmaagentcommon &>/dev/null; then
        apcreatedirstructfigmaagentcommon
    fi

    if alias apcreatedirstructfigmaagentmain &>/dev/null; then
        apcreatedirstructfigmaagentmain
    fi
}

alias aprmdirstructfigmaagent="ap_func_rm_dirstruct_figmaagent"
ap_func_rm_dirstruct_figmaagent() {
    if alias aprmdirstructfigmaagentshare &>/dev/null; then
        aprmdirstructfigmaagentshare
    fi

    if alias aprmdirstructfigmaagentcommon &>/dev/null; then
        aprmdirstructfigmaagentcommon
    fi

    if alias aprmdirstructfigmaagentmain &>/dev/null; then
        aprmdirstructfigmaagentmain
    fi
}

alias apsetupfigmaagent="ap_func_setup_figmaagent"
ap_func_setup_figmaagent() {
    aplogshow "Install [figmaagent]\n"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        bash -c "$(curl -fsSL https://raw.githubusercontent.com/neetly/figma-agent-linux/main/scripts/install.sh)"
    fi

    apinitfigmaagent
    if alias apcreatedirstructfigmaagent &>/dev/null; then
        apcreatedirstructfigmaagent
    fi
}

alias aprmfigmaagent="ap_func_rm_figmaagent"
ap_func_rm_figmaagent() {
    aplogshow "Remove [figmaagent]\n"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        systemctl --user disable --now figma-agent.{service,socket}
        rm -rf ~/.local/share/figma-agent ~/.local/share/systemd/user/figma-agent.{service,socket} ~/.cache/figma-agent
    fi

    if alias aprmdirstructfigmaagent &>/dev/null; then
        aprmdirstructfigmaagent
    fi

    if alias aprmglobalsymlinkfigmaagent &>/dev/null; then
        aprmglobalsymlinkfigmaagent
    fi
}
