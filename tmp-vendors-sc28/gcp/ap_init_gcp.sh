# https://cloud.google.com/sdk/gcloud/reference/topic/configurations
# Google Cloud SDK root dir
export AP_VENDORS_GC_SDK_DIR="${AP_SOFT_DIR}/google-cloud-sdk"

[[ -f "${AP_SECRETS_DIR}/ap_nidnos_gcp_service_account_credential.json" ]] && export GOOGLE_APPLICATION_CREDENTIALS="${AP_SECRETS_DIR}/ap_nidnos_gcp_service_account_credential.json"

# Your active configuration can also be set via the environment variable CLOUDSDK_ACTIVE_CONFIG_NAME
# This allows you to specify a certain configuration in a given terminal session
# without changing the global default configuration.
# export CLOUDSDK_ACTIVE_CONFIG_NAME=""

# Set current active project
# export CLOUDSDK_CORE_PROJECT=""

# Pass interpreter level arguments to the Python running gcloud
# export CLOUDSDK_PYTHON_ARGS=""

# Use the python3 interpreter on your path
# export CLOUDSDK_PYTHON=python3

# Use a python you have installed in a special location
# export CLOUDSDK_PYTHON=/usr/local/my-custom-python-install/python

# The next line updates PATH for the Google Cloud SDK.
if [ -f "${AP_VENDORS_GC_SDK_DIR}/path.bash.inc" ]; then . "${AP_VENDORS_GC_SDK_DIR}/path.bash.inc"; fi

# The next line enables shell command completion for gcloud.
if [ -f "${AP_VENDORS_GC_SDK_DIR}/completion.bash.inc" ]; then . "${AP_VENDORS_GC_SDK_DIR}/completion.bash.inc"; fi
