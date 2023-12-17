# https://www.virtualbox.org/wiki/Downloads
# https://github.com/gryf/vboxmanage-bash-completion

export AP_VENDORS_VBOX_SETUP_DIR="${AP_SCRIPTO_COMMON_DIR}/vendors/vbox"
export AP_VENDORS_VBOX_SETUP_CONFIGS_DIR="${AP_VENDORS_VBOX_SETUP_DIR}/configs"

export AP_VBOX_VMS_DIR="${AP_VMS_DIR}/vbox"
[[ ! -d "${AP_VBOX_VMS_DIR}" ]] && mkdir -p "${AP_VBOX_VMS_DIR}"

export AP_VBOX_DEFAULT_USER='user-admin'
export AP_VBOX_NATPF_RULE_SSH_NAME='ssh'
export AP_VBOX_NATPF_RULE_SSH_PORT_MIN=2700
export AP_VBOX_NATPF_RULE_SSH_PORT_MAX=2750
export AP_VBOX_PREFIX_VAGRANT_NAME='vagrant-'

# Guest Additions
export AP_VBOX_GUEST_ADDITIONS_VERSION='6.1.18'
export AP_VBOX_GUEST_ADDITIONS_IMAGE="VBoxGuestAdditions_${AP_VBOX_GUEST_ADDITIONS_VERSION}.iso"
export AP_VBOX_GUEST_ADDITIONS_DOWNLOAD_URL="http://download.virtualbox.org/virtualbox/${AP_VBOX_GUEST_ADDITIONS_VERSION}/${AP_VBOX_GUEST_ADDITIONS_IMAGE}"

# Set default location to store all VMs of VirtualBox
VBoxManage setproperty machinefolder "${AP_VBOX_VMS_DIR}"

# Bash completion
source "${AP_VENDORS_VBOX_SETUP_CONFIGS_DIR}/ap_completion_vboxmanage.bash"

alias zvboxvms='cd "${AP_VBOX_VMS_DIR}"'
alias vbm='VBoxManage'

alias vbmdu1='VBoxManage unregistervm --delete "${AP_VG_VM_U1_NAME}"'
alias vbmpu1='VBoxManage controlvm "${AP_VG_VM_U1_NAME}" poweroff'

alias vbmdu2='VBoxManage unregistervm --delete "${AP_VG_VM_U2_NAME}"'
alias vbmpu2='VBoxManage controlvm "${AP_VG_VM_U2_NAME}" poweroff'

alias vbmdu3='VBoxManage unregistervm --delete "${AP_VG_VM_U3_NAME}"'
alias vbmpu3='VBoxManage controlvm "${AP_VG_VM_U3_NAME}" poweroff'

alias vbmdc1='VBoxManage unregistervm --delete "${AP_VG_VM_C1_NAME}"'
alias vbmpc1='VBoxManage controlvm "${AP_VG_VM_C1_NAME}" poweroff'

alias vbmdc2='VBoxManage unregistervm --delete "${AP_VG_VM_C2_NAME}"'
alias vbmpc2='VBoxManage controlvm "${AP_VG_VM_C2_NAME}" poweroff'

alias vbmdc3='VBoxManage unregistervm --delete "${AP_VG_VM_C3_NAME}"'
alias vbmpc3='VBoxManage controlvm "${AP_VG_VM_C3_NAME}" poweroff'

# @$alias $$ ap_func_vbox_generate_bash_completions {
alias ap_alias_vbox_generate_bash_completions='ap_func_vbox_generate_bash_completions'
alias vboxgenerate_bash_completions='ap_func_vbox_generate_bash_completions'
# }

# @$func $$ ap_func_vbox_generate_bash_completions {
# ap_func_vbox_generate_bash_completions
# Description
# 	Generate bash completion for VBoxManage command
# Return status
#	AP_CODE_SUCCESS
# }

ap_func_vbox_generate_bash_completions() {
	curl -L https://raw.githubusercontent.com/gryf/vboxmanage-bash-completion/master/VBoxManage -o "${AP_VENDORS_VBOX_SETUP_CONFIGS_DIR}/ap_completion_vboxmanage.bash"
	grep "complete -o default -F _VBoxManage vbm" "${AP_VENDORS_VBOX_SETUP_CONFIGS_DIR}/ap_completion_vboxmanage.bash" &>/dev/null
	if [[ "$?" != 0 ]]; then
		echo >>"${AP_VENDORS_VBOX_SETUP_CONFIGS_DIR}/ap_completion_vboxmanage.bash"
		echo "complete -o default -F _VBoxManage vbm # vbm is an alias of VBoxManage" >>"${AP_VENDORS_VBOX_SETUP_CONFIGS_DIR}/ap_completion_vboxmanage.bash"
	fi

	@rtn_success
}
