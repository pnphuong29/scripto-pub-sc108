ap_ga_dir='/media/guestadditions'

if [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]]; then
	# Install kernel-headers and essential libraries to build guest additions
	apt update
	apt install -y linux-headers-$(uname -r) build-essential

	# Download Guest Additions
	mkdir -p "${ap_ga_dir}"
	curl -OL "${AP_VIRTUALBOX_GUEST_ADDITIONS_DOWNLOAD_URL}"
	mount -o loop,ro "${AP_VIRTUALBOX_GUEST_ADDITIONS_IMAGE}" "${ap_ga_dir}"

	# Install Guest Additions
	cd "${ap_ga_dir}"
	./VBoxLinuxAdditions.run --nox11

	# Cleanup procedures
	rm -f "${AP_VIRTUALBOX_GUEST_ADDITIONS_IMAGE}"
	umount "${ap_ga_dir}"
	rm -rf "${ap_ga_dir}"

	reboot
fi
