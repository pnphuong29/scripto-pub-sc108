alias apinitvagrant="ap_func_init_vagrant"
ap_func_init_vagrant() {
    # If the Vagrant guest is not trusted, you may want to disable symlink globally using below env variable
    export VAGRANT_DISABLE_VBOXSYMLINKCREATE=1
    # The above env variable is the same as below config in Vagrantfile
    # config.vm.synced_folder '/host/path', '/guest/path', SharedFoldersEnableSymlinksCreate: false

    alias vg='vagrant'
    alias vggs='vagrant global-status'
    alias vggsp='vagrant global-status --prune'
    alias vgglobalstatus='vagrant global-status'
    alias vgglobalstatusprune='vagrant global-status --prune'
    alias vgssh='vagrant ssh'
    alias vgstart='vagrant up'
    alias vgstop='vagrant halt'
    alias vgrestart='vagrant reload'
    alias vgreload='vagrant reload'
    alias vgrestartprovision='vagrant reload --provision'
    alias vgprovision='vagrant provision'
    alias vgrm='vagrant destroy -f; rm -rf .vagrant logs'
    alias vgrebuild='vgrm; vagrant up'
    alias vgstopall="vagrant stop \$(vagrant global-status | grep running | gawk '{print \$1}' | tr '\n' ' ')"
    alias vivagrantfile='vi Vagrantfile'

    if alias apinitvagrantshare &>/dev/null; then
        apinitvagrantshare
    fi

    if alias apinitvagrantcommon &>/dev/null; then
        apinitvagrantcommon
    fi
}

alias apcreatedirstructvagrant="ap_func_create_dirstruct_vagrant"
ap_func_create_dirstruct_vagrant() {
    aplogshow "Generate [vagrant] bash autocomplete\n"
    curl -SL "https://raw.githubusercontent.com/hashicorp/vagrant/main/contrib/bash/completion.sh" >"${AP_COMPLETIONS_DIR}/ap_completion_vagrant.bash"

    if ! grep "complete -F _vagrant vagrant vg" "${AP_COMPLETIONS_DIR}/ap_completion_vagrant.bash" &>/dev/null; then
        echo >>"${AP_COMPLETIONS_DIR}/ap_completion_vagrant.bash"
        echo "complete -F _vagrant vagrant vg # vg is an alias of 'vagrant' command" >>"${AP_COMPLETIONS_DIR}/ap_completion_vagrant.bash"
    fi

    if alias apcreatedirstructvagrantshare &>/dev/null; then
        apcreatedirstructvagrantshare
    fi

    if alias apcreatedirstructvagrantcommon &>/dev/null; then
        apcreatedirstructvagrantcommon
    fi
}

alias aprmdirstructvagrant="ap_func_rm_dirstruct_vagrant"
ap_func_rm_dirstruct_vagrant() {
    aplogshow "Remove [${AP_COMPLETIONS_DIR}/ap_completion_vagrant.bash]\n"
    rm -f "${AP_COMPLETIONS_DIR}/ap_completion_vagrant.bash"

    if alias aprmdirstructvagrantshare &>/dev/null; then
        aprmdirstructvagrantshare
    fi

    if alias aprmdirstructvagrantcommon &>/dev/null; then
        aprmdirstructvagrantcommon
    fi
}

alias apsetupvagrant="ap_func_setup_vagrant"
ap_func_setup_vagrant() {
    # https://developer.hashicorp.com/vagrant/install
    aplogshow "Install [vagrant]\n"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        brew tap hashicorp/tap
        brew install hashicorp/tap/hashicorp-vagrant
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
        echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
        sudo apt update
        sudo apt install -y vagrant
    fi

    apinitvagrant

    aplogshow "Install plugin [vagrant-vmware-desktop]\n"
    vagrant plugin install vagrant-vmware-desktop

    if alias apcreatedirstructvagrant &>/dev/null; then
        apcreatedirstructvagrant
    fi
}

alias aprmvagrant="ap_func_rm_vagrant"
ap_func_rm_vagrant() {
    aplogshow "Remove [vagrant]\n"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        brew uninstall vagrant
        sudo rm -rf /opt/vagrant /usr/local/bin/vagrant
        sudo pkgutil --forget com.vagrant.vagrant
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        sudo rm -rf /opt/vagrant
        sudo rm -f /usr/bin/vagrant
    fi

    rm -rf "${HOME}/.vagrant.d"

    if alias aprmdirstructvagrant &>/dev/null; then
        aprmdirstructvagrant
    fi

    if alias aprmglobalsymlinkvagrant &>/dev/null; then
        aprmglobalsymlinkvagrant
    fi
}
