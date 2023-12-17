export AP_VENDORS_RUBY_VAGRANT_SETUP_DIR="${AP_SCRIPTO_COMMON_DIR}/vendors/ruby-vagrant"
export AP_VENDORS_RUBY_VAGRANT_SETUP_CONFIGS_DIR="${AP_VENDORS_RUBY_VAGRANT_SETUP_DIR}/configs"

# This will add aliases to default vagrant commands
export VAGRANT_ALIAS_FILE="${AP_VENDORS_RUBY_VAGRANT_SETUP_CONFIGS_DIR}/ap_alias_ruby_vagrant.rb"

# If the Vagrant guest is not trusted, you may want to disable symlink globally using below env variable
export VAGRANT_DISABLE_VBOXSYMLINKCREATE=1
# The above env variable is the same as below config in Vagrantfile
# config.vm.synced_folder '/host/path', '/guest/path', SharedFoldersEnableSymlinksCreate: false

# This private key is used to ssh to vagrant vm
export AP_VG_KEY_PRIVATE_PATH="${AP_SECRETS_DIR}/ap_vagrant.key.priv"
export AP_VG_KEY_PUBLIC_PATH="${AP_SECRETS_DIR}/ap_vagrant.key.pub"
export AP_VG_TOKEN_P29="${AP_SECRETS_DIR}/ap_pnphuong29_vagrant.token"

if [[ -f "${AP_VG_TOKEN_P29}" ]]; then
    # This will allow vagrant command to perform commands in vagrant cloud
    ATLAS_TOKEN="$(cat "${AP_VG_TOKEN_P29}")"
    export ATLAS_TOKEN
    alias cpvgtoken='cat "${AP_VG_TOKEN_P29}" | @copy'
    alias showvgtoken='cat "${AP_VG_TOKEN_P29}"'
    alias cpvgkeypublic='cat "${AP_VG_KEY_PUBLIC_PATH}" | @copy'
    alias showvgkeypublic='cat "${AP_VG_KEY_PUBLIC_PATH}"'
fi

# Vagrant completion
source "${AP_VENDORS_RUBY_VAGRANT_SETUP_CONFIGS_DIR}/ap_completion_ruby_vagrant.bash"

alias viscvgconfigs="vi \${AP_VENDORS_RUBY_VAGRANT_SETUP_DIR}/ap_init_ruby_vagrant.sh"

# Vagrantfile
## for sharing directories between host and guest machines
## below are directory structure in guest machines
export AP_VG_GUEST_HOME_DIR="/home/vagrant/${AP_USER}"
export AP_VG_GUEST_SHARES_LOCAL_DIR="${AP_VG_GUEST_HOME_DIR}/shares"
export AP_VG_GUEST_SECRETS_DIR="${AP_VG_GUEST_HOME_DIR}/secrets"
export AP_VG_GUEST_TMP_DIR="${AP_VG_GUEST_HOME_DIR}/tmp"
export AP_VG_GUEST_GH_P29_DIR="${AP_VG_GUEST_HOME_DIR}/projects/p29-github/pnphuong29"
export AP_VG_GUEST_PRJ_VMS28_DIR="${AP_VG_GUEST_GH_PNP29_DIR}/ap-vms-common-vm28"

# Vagrant machine naming
export AP_VG_VM_US1_NAME="vagrant-ubuntu-server-amd64-us1"
export AP_VG_VM_US2_NAME="vagrant-ubuntu-server-amd64-us2"
export AP_VG_VM_US3_NAME="vagrant-ubuntu-server-amd64-us3"
export AP_VG_VM_US4_NAME="vagrant-ubuntu-server-amd64-us4"

export AP_VG_VM_UD1_NAME="vagrant-ubuntu-desktop-amd64-ud1"
export AP_VG_VM_UD2_NAME="vagrant-ubuntu-desktop-amd64-ud2"

export AP_VG_VM_C1_NAME="vagrant-centos-x86-64-1"
export AP_VG_VM_C2_NAME="vagrant-centos-x86-64-2"
export AP_VG_VM_C3_NAME="vagrant-centos-x86-64-3"

export AP_VG_VM_HIPPOKIDS_NAME="vagrant-hippokids"
export AP_VG_VM_NEXTCLOUD_NAME="vagrant-nextcloud"
export AP_VG_VM_JOPLIN_WEBDAV_NAME="vagrant-joplin-webdav"
export AP_VG_VM_SOFEA_NAME="vagrant-sofea"
export AP_VG_VM_MATTERMOST_NAME="vagrant-mattermost"
export AP_VG_VM_GITLAB_NAME="vagrant-gitlab"

# Aliases
export AP_SC28_VAGRANT_VMS_DIR="${AP_SCRIPTO_COMMON_DIR}/vendors/ruby-vagrant/vg-vms"
export AP_SCRIPTS_VAGRANT_VMS_DIR="${AP_PRJ_SCRIPTS_VENDORS_DIR}/ruby-vagrant/vg-vms"

alias zscvg='cd "${AP_SC28_VAGRANT_VMS_DIR}"'
alias zsvg='cd "${AP_SCRIPTS_VAGRANT_VMS_DIR}"'

alias vg='vagrant'
alias vggs='vagrant global-status'
alias vggsp='vagrant global-status --prune'
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

## CentOS - 1
if [[ ! -d "${AP_SCRIPTS_VAGRANT_VMS_DIR}/vg-c1" ]]; then
    alias zvgc1='cd "${AP_SC28_VAGRANT_VMS_DIR}/vg-c1"'
else
    alias zvgc1='cd "${AP_SCRIPTS_VAGRANT_VMS_DIR}/vg-c1"'
fi

## CentOS - 2
if [[ ! -d "${AP_SCRIPTS_VAGRANT_VMS_DIR}/vg-c2" ]]; then
    alias zvgc2='cd "${AP_SC28_VAGRANT_VMS_DIR}/vg-c2"'
else
    alias zvgc2='cd "${AP_SCRIPTS_VAGRANT_VMS_DIR}/vg-c2"'
fi

## CentOS - 3
if [[ ! -d "${AP_SCRIPTS_VAGRANT_VMS_DIR}/vg-c3" ]]; then
    alias zvgc3='cd "${AP_SC28_VAGRANT_VMS_DIR}/vg-c3"'
else
    alias zvgc3='cd "${AP_SCRIPTS_VAGRANT_VMS_DIR}/vg-c3"'
fi

## Ubuntu Server - 1
if [[ ! -d "${AP_SCRIPTS_VAGRANT_VMS_DIR}/vg-us1" ]]; then
    alias zvgus1='cd "${AP_SC28_VAGRANT_VMS_DIR}/vg-us1"'
else
    alias zvgus1='cd "${AP_SCRIPTS_VAGRANT_VMS_DIR}/vg-us1"'
fi

alias vgsus1='zvgus1; vagrant up'
alias vghus1='zvgus1; vagrant halt'
alias vgrus1='zvgus1; vagrant reload'
alias vgbus1='zvgus1; vgrebuild'
alias vgrmus1='zvgus1; vgrm'
alias sshvgus1='zvgus1; vagrant ssh'
alias vivgus1='zvgus1; vi Vagrantfile'

## Ubuntu Server - 2
if [[ ! -d "${AP_SCRIPTS_VAGRANT_VMS_DIR}/vg-us2" ]]; then
    alias zvgus2='cd "${AP_SC28_VAGRANT_VMS_DIR}/vg-us2"'
else
    alias zvgus2='cd "${AP_SCRIPTS_VAGRANT_VMS_DIR}/vg-us2"'
fi

alias vgsus2='zvgus2; vagrant up'
alias vghus2='zvgus2; vagrant halt'
alias vgrus2='zvgus2; vagrant reload'
alias vgbus2='zvgus2; vgrebuild'
alias vgrmus2='zvgus2; vgrm'
alias sshvgus2='zvgus2; vagrant ssh'
alias vivgus2='zvgus2; vi Vagrantfile'

## Ubuntu Server - 3
if [[ ! -d "${AP_SCRIPTS_VAGRANT_VMS_DIR}/vg-us3" ]]; then
    alias zvgus3='cd "${AP_SC28_VAGRANT_VMS_DIR}/vg-us3"'
else
    alias zvgus3='cd "${AP_SCRIPTS_VAGRANT_VMS_DIR}/vg-us3"'
fi

alias vgsus3='zvgus3; vagrant up'
alias vghus3='zvgus3; vagrant halt'
alias vgrus3='zvgus3; vagrant reload'
alias vgbus3='zvgus3; vgrebuild'
alias vgrmus3='zvgus3; vgrm'
alias sshvgus3='zvgus3; vagrant ssh'
alias vivgus3='zvgus3; vi Vagrantfile'

## Ubuntu Server - 4
if [[ ! -d "${AP_SCRIPTS_VAGRANT_VMS_DIR}/vg-us4" ]]; then
    alias zvgus4='cd "${AP_SC28_VAGRANT_VMS_DIR}/vg-us4"'
else
    alias zvgus4='cd "${AP_SCRIPTS_VAGRANT_VMS_DIR}/vg-us4"'
fi

alias vgsus4='zvgus4; vagrant up'
alias vghus4='zvgus4; vagrant halt'
alias vgrus4='zvgus4; vagrant reload'
alias vgbus4='zvgus4; vgrebuild'
alias vgrmus4='zvgus4; vgrm'
alias sshvgus4='zvgus4; vagrant ssh'
alias vivgus4='zvgus4; vi Vagrantfile'

## Ubuntu Desktop - 1
if [[ ! -d "${AP_SCRIPTS_VAGRANT_VMS_DIR}/vg-ud1" ]]; then
    alias zvgud1='cd "${AP_SC28_VAGRANT_VMS_DIR}/vg-ud1"'
else
    alias zvgud1='cd "${AP_SCRIPTS_VAGRANT_VMS_DIR}/vg-ud1"'
fi

alias vgsud1='zvgud1; vagrant up'
alias vghud1='zvgud1; vagrant halt'
alias vgrud1='zvgud1; vagrant reload'
alias vgbud1='zvgud1; vgrebuild'
alias vgrmud1='zvgud1; vgrm'
alias sshvgud1='zvgud1; vagrant ssh'
alias vivgud1='zvgud1; vi Vagrantfile'

## Ubuntu Desktop - 2
if [[ ! -d "${AP_SCRIPTS_VAGRANT_VMS_DIR}/vg-ud2" ]]; then
    alias zvgud2='cd "${AP_SC28_VAGRANT_VMS_DIR}/vg-ud2"'
else
    alias zvgud2='cd "${AP_SCRIPTS_VAGRANT_VMS_DIR}/vg-ud2"'
fi

alias vgsud2='zvgud2; vagrant up'
alias vghud2='zvgud2; vagrant halt'
alias vgrud2='zvgud2; vagrant reload'
alias vgbud2='zvgud2; vgrebuild'
alias vgrmud2='zvgud2; vgrm'
alias sshvgud2='zvgud2; vagrant ssh'
alias vivgud2='zvgud2; vi Vagrantfile'

## Hippokids
if [[ ! -d "${AP_SCRIPTS_VAGRANT_VMS_DIR}/vg-hippokids" ]]; then
    alias zvghk='cd "${AP_SC28_VAGRANT_VMS_DIR}/vg-hippokids"'
else
    alias zvghk='cd "${AP_SCRIPTS_VAGRANT_VMS_DIR}/vg-hippokids"'
fi

alias vgshk='zvghk; vagrant up'
alias vghhk='zvghk; vagrant halt'
alias vgrhk='zvghk; vagrant reload'
alias vgbhk='zvghk; vgrebuild'
alias vgrmhk='zvghk; vgrm'
alias sshvghk='zvghk; vagrant ssh'
alias vivghk='zvghk; vi Vagrantfile'

## Nextcloud
if [[ ! -d "${AP_SCRIPTS_VAGRANT_VMS_DIR}/vg-nextcloud" ]]; then
    alias zvgnc='cd "${AP_SC28_VAGRANT_VMS_DIR}/vg-nextcloud"'
else
    alias zvgnc='cd "${AP_SCRIPTS_VAGRANT_VMS_DIR}/vg-nextcloud"'
fi

alias vgsnc='zvgnc; vagrant up'
alias vghnc='zvgnc; vagrant halt'
alias vgrnc='zvgnc; vagrant reload'
alias vgbnc='zvgnc; vgrebuild'
alias vgrmnc='zvgnc; vgrm'
alias sshvgnc='zvgnc; vagrant ssh'
alias vivgnc='zvgnc; vi Vagrantfile'

## Joplin WebDAV
if [[ ! -d "${AP_SCRIPTS_VAGRANT_VMS_DIR}/vg-joplin-webdav" ]]; then
    alias zvgjoplin='cd "${AP_SC28_VAGRANT_VMS_DIR}/vg-joplin-webdav"'
else
    alias zvgjoplin='cd "${AP_SCRIPTS_VAGRANT_VMS_DIR}/vg-joplin-webdav"'
fi

alias vgsjoplin='zvgjoplin; vagrant up'
alias vghjoplin='zvgjoplin; vagrant halt'
alias vgrjoplin='zvgjoplin; vagrant reload'
alias vgbjoplin='zvgjoplin; vgrebuild'
alias vgrmjoplin='zvgjoplin; vgrm'
alias sshvgjoplin='zvgjoplin; vagrant ssh'
alias vivgjoplin='zvgjoplin; vi Vagrantfile'

## Sofea
if [[ ! -d "${AP_SCRIPTS_VAGRANT_VMS_DIR}/vg-sofea" ]]; then
    alias zvgsofea='cd "${AP_SC28_VAGRANT_VMS_DIR}/vg-sofea"'
else
    alias zvgsofea='cd "${AP_SCRIPTS_VAGRANT_VMS_DIR}/vg-sofea"'
fi

alias vgssofea='zvgsofea; vagrant up'
alias vghsofea='zvgsofea; vagrant halt'
alias vgrsofea='zvgsofea; vagrant reload'
alias vgbsofea='zvgsofea; vgrebuild'
alias vgrmsofea='zvgsofea; vgrm'
alias sshvgsofea='zvgsofea; vagrant ssh'
alias vivgsofea='zvgsofea; vi Vagrantfile'

## Mattermost
if [[ ! -d "${AP_SCRIPTS_VAGRANT_VMS_DIR}/vg-mattermost" ]]; then
    alias zvgmm='cd "${AP_SC28_VAGRANT_VMS_DIR}/vg-mattermost"'
else
    alias zvgmm='cd "${AP_SCRIPTS_VAGRANT_VMS_DIR}/vg-mattermost"'
fi

alias vgsmm='zvgmm; vagrant up'
alias vghmm='zvgmm; vagrant halt'
alias vgrmm='zvgmm; vagrant reload'
alias vgbmm='zvgmm; vgrebuild'
alias vgrmmm='zvgmm; vgrm'
alias sshvgmm='zvgmm; vagrant ssh'
alias vivgmm='zvgmm; vi Vagrantfile'

# @$alias $$ ap_func_vagrant_generate_bash_completions {
alias ap_alias_vagrant_generate_bash_completions='ap_func_vagrant_generate_bash_completions'
alias vggenerate_bash_completions='ap_func_vagrant_generate_bash_completions'
# }

# @$func $$ ap_func_vagrant_generate_bash_completions {
# ap_func_vagrant_generate_bash_completions
# Description
# 	Generate bash completion for vagrant command
# Return status
#	AP_CODE_SUCCESS
# }

ap_func_vagrant_generate_bash_completions() {
    curl -SL "https://raw.githubusercontent.com/hashicorp/vagrant/main/contrib/bash/completion.sh" >"${AP_VENDORS_RUBY_VAGRANT_SETUP_CONFIGS_DIR}/ap_completion_ruby_vagrant.bash"

    grep "complete -o default -F _vagrant vg" "${AP_VENDORS_RUBY_VAGRANT_SETUP_CONFIGS_DIR}/ap_completion_ruby_vagrant.bash" &>/dev/null
    if [[ "$?" != 0 ]]; then
        echo >>"${AP_VENDORS_RUBY_VAGRANT_SETUP_CONFIGS_DIR}/ap_completion_ruby_vagrant.bash"
        echo "complete -o default -F _vagrant vg # vg is an alias of 'vagrant' command" >>"${AP_VENDORS_RUBY_VAGRANT_SETUP_CONFIGS_DIR}/ap_completion_ruby_vagrant.bash"
    fi

    @rtn_success
}
