# https://cloud.google.com/sdk/docs/install
# Dependencies: python

export AP_VENDORS_GC_SDK_DIR="${AP_SOFT_DIR}/google-cloud-sdk"
# Pass interpreter level arguments to the Python running gcloud
# export CLOUDSDK_PYTHON_ARGS=""

# Use the python3 interpreter on your path
# export CLOUDSDK_PYTHON=python3

# Use a python you have installed in a special location
# export CLOUDSDK_PYTHON=/usr/local/my-custom-python-install/python

if ! type gcloud &>/dev/null; then
	ap_sdk_version='411.0.0'
	@logshow "Installing [Google Cloud SDK ${ap_sdk_version}]\n"

	if [ "${AP_OS_TYPE}" = 'macos' ]; then
		ap_sdk_dir_name="google-cloud-cli-${ap_sdk_version}-darwin-x86_64"
	else
		ap_sdk_dir_name="google-cloud-cli-${ap_sdk_version}-linux-x86_64"
	fi

	ap_sdk_src_file_name="${ap_sdk_dir_name}.tar.gz"
	ap_sdk_url="https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/${ap_sdk_src_file_name}"

	# Donwload Google Cloud SDK
	cd "${AP_TMP_DIR}"
	rm -rf "${ap_sdk_dir_name}"

	curl -OL "${ap_sdk_url}"
	tar -zxf "${ap_sdk_src_file_name}"

	mkdir -p "${AP_VENDORS_GC_SDK_DIR}"
	cp -R "google-cloud-sdk"/. "${AP_VENDORS_GC_SDK_DIR}"
	rm -rf "google-cloud-sdk"

	# Install Google Cloud SDK
	cd "${AP_VENDORS_GC_SDK_DIR}"
	./install.sh
fi
