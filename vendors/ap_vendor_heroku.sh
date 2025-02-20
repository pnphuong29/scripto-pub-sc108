# https://devcenter.heroku.com/articles/heroku-cli
alias apinitheroku="ap_func_init_heroku"
ap_func_init_heroku() {
    if alias apinitherokushare &>/dev/null; then
        apinitherokushare
    fi

    if alias apinitherokucommon &>/dev/null; then
        apinitherokucommon
    fi

    if alias apinitherokumain &>/dev/null; then
        apinitherokumain
    fi
}

alias apcreatedirstructheroku="ap_func_create_dirstruct_heroku"
ap_func_create_dirstruct_heroku() {
    if alias apcreatedirstructherokushare &>/dev/null; then
        apcreatedirstructherokushare
    fi

    if alias apcreatedirstructherokucommon &>/dev/null; then
        apcreatedirstructherokucommon
    fi

    if alias apcreatedirstructherokumain &>/dev/null; then
        apcreatedirstructherokumain
    fi
}

alias aprmdirstructheroku="ap_func_rm_dirstruct_heroku"
ap_func_rm_dirstruct_heroku() {
    if alias aprmdirstructherokushare &>/dev/null; then
        aprmdirstructherokushare
    fi

    if alias aprmdirstructherokucommon &>/dev/null; then
        aprmdirstructherokucommon
    fi

    if alias aprmdirstructherokumain &>/dev/null; then
        aprmdirstructherokumain
    fi
}

# alias apcreateglobalsymlinkheroku="ap_func_create_global_symlink_heroku"
# ap_func_create_global_symlink_heroku() {
#     if [ -f "${AP_SOFT_DIR}/bin/heroku" ]; then
#         apshowmsginfo "Create symlink from [/usr/local/bin/heroku] to [${AP_SOFT_DIR}/bin/heroku]\n"
#         sudo ln -sf "${AP_SOFT_DIR}/bin/heroku" "/usr/local/bin/heroku"
#     fi
# }

# alias aprmglobalsymlinkheroku="ap_func_rm_global_symlink_heroku"
# ap_func_rm_global_symlink_heroku() {
#     if [ -f "/usr/local/bin/heroku" ]; then
#         apshowmsginfo "Remove [/usr/local/bin/heroku]\n"
#         sudo rm -f "/usr/local/bin/heroku"
#     fi
# }

alias apsetupheroku="ap_func_setup_heroku"
ap_func_setup_heroku() {
    apshowmsginfo "Install [heroku]\n"

    # pnpm install -g heroku
    curl https://cli-assets.heroku.com/install.sh | sh

    apinitheroku
    if alias apcreatedirstructheroku &>/dev/null; then
        apcreatedirstructheroku
    fi
}

alias aprmheroku="ap_func_rm_heroku"
ap_func_rm_heroku() {
    apshowmsginfo "Remove [heroku]\n"

    # pnpm uninstall -g heroku
    # gem uninstall heroku --all # Uninstall the Legacy heroku Gem

    if [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]]; then
        rm -rf /usr/local/heroku /usr/local/lib/heroku /usr/local/bin/heroku ~/.local/share/heroku ~/Library/Caches/heroku

        # If using brew, uncomment the following lines
        # brew uninstall heroku
        # rm -rf ~/.local/share/heroku ~/Library/Caches/heroku
    elif [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]]; then
        rm /usr/local/bin/heroku
        rm -rf /usr/local/lib/heroku /usr/local/heroku
        rm -rf ~/.local/share/heroku ~/.cache/heroku

        # If using apt-get, uncomment the following lines
        # sudo apt remove heroku heroku-toolbelt
        # sudo rm /etc/apt/sources.list.d/heroku.list
    fi

    if alias aprmdirstructheroku &>/dev/null; then
        aprmdirstructheroku
    fi

    if alias aprmglobalsymlinkheroku &>/dev/null; then
        aprmglobalsymlinkheroku
    fi
}
