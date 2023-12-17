if type gcloud; then
	@logshow "Removing [Google Cloud SDK]\n"
	rm -rf "${AP_VENDORS_GC_SDK_DIR}"

	if [[ ! -d "${AP_VENDORS_GC_SDK_DIR}" ]]; then
		@logshowpassed "[Google Cloud SDK] has been removed successfully\n"
	else
		@logshowfailed "[Google Cloud SDK] has been removed unsuccessfully\n"
	fi
fi
