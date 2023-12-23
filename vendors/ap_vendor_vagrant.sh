alias @initvagrant="ap_func_init_vagrant"
ap_func_init_vagrant() {
    # This will add aliases to default vagrant commands
    export VAGRANT_ALIAS_FILE="${AP_SCRIPTO_COMMON_DIR}/vendors/vagrant/configs/ap_alias_vagrant.rb"

    # If the Vagrant guest is not trusted, you may want to disable symlink globally using below env variable
    export VAGRANT_DISABLE_VBOXSYMLINKCREATE=1
    # The above env variable is the same as below config in Vagrantfile
    # config.vm.synced_folder '/host/path', '/guest/path', SharedFoldersEnableSymlinksCreate: false

    alias @vg='vagrant'
    alias @vggs='vagrant global-status'
    alias @vggsp='vagrant global-status --prune'
    alias @vgssh='vagrant ssh'
    alias @vgstart='vagrant up'
    alias @vgstop='vagrant halt'
    alias @vgrestart='vagrant reload'
    alias @vgreload='vagrant reload'
    alias @vgrestartprovision='vagrant reload --provision'
    alias @vgprovision='vagrant provision'
    alias @vgrm='vagrant destroy -f; rm -rf .vagrant logs'
    alias @vgrebuild='vgrm; vagrant up'
    alias @vgstopall="vagrant stop \$(vagrant global-status | grep running | gawk '{print \$1}' | tr '\n' ' ')"

    if alias @initvagrantcommon &>/dev/null; then
        @initvagrantcommon
    fi
}

alias @createdirstructvagrant="ap_func_create_dirstruct_vagrant"
ap_func_create_dirstruct_vagrant() {
    @logshow "Generate [vagrant] bash autocomplete\n"
    curl -SL "https://raw.githubusercontent.com/hashicorp/vagrant/main/contrib/bash/completion.sh" >"${AP_COMPLETIONS_DIR}/ap_completion_vagrant.bash"

    if ! grep "complete -o default -F _vagrant @vg" "${AP_COMPLETIONS_DIR}/ap_completion_vagrant.bash" &>/dev/null; then
        echo >>"${AP_COMPLETIONS_DIR}/ap_completion_vagrant.bash"
        echo "complete -o default -F _vagrant @vg # @vg is an alias of 'vagrant' command" >>"${AP_COMPLETIONS_DIR}/ap_completion_vagrant.bash"
    fi

    if alias @createdirstructvagrantcommon &>/dev/null; then
        @createdirstructvagrantcommon
    fi
}

alias @rmdirstructvagrant="ap_func_remove_dirstruct_vagrant"
ap_func_remove_dirstruct_vagrant() {
    @logshow "Remove [${AP_COMPLETIONS_DIR}/ap_completion_vagrant.bash]\n"
    rm -f "${AP_COMPLETIONS_DIR}/ap_completion_vagrant.bash"

    if alias @rmdirstructvagrantcommon &>/dev/null; then
        @rmdirstructvagrantcommon
    fi
}

alias @setupvagrant="ap_func_setup_vagrant"
ap_func_setup_vagrant() {
    # https://developer.hashicorp.com/vagrant/install
    @logshow "Install [vagrant]\n"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        brew tap hashicorp/tap
        brew install hashicorp/tap/hashicorp-vagrant
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
        echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
        sudo apt update
        sudo apt install -y vagrant
    fi

    if alias @createdirstructvagrant &>/dev/null; then
        @createdirstructvagrant
    fi
}

alias @rmvagrant="ap_func_remove_vagrant"
ap_func_remove_vagrant() {
    @logshow "Remove [vagrant]\n"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        sudo rm -rf /opt/vagrant /usr/local/bin/vagrant
        sudo pkgutil --forget com.vagrant.vagrant
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        sudo rm -rf /opt/vagrant
        sudo rm -f /usr/bin/vagrant
    fi

    rm -rf "${HOME}/.vagrant.d"

    if alias @rmdirstructvagrant &>/dev/null; then
        @rmdirstructvagrant
    fi
}
