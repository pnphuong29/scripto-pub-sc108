# https://github.com/jarun/nnn/wiki/Usage
# https://github.com/jarun/nnn/tree/master/plugins#nnn-plugins

export AP_NNN_SETUP_VERSION='4.6'
export AP_VENDORS_NNN_SETUP_DIR="${AP_SCRIPTO_COMMON_DIR}/vendors/nnn"
export AP_VENDORS_NNN_SETUP_CONFIGS_DIR="${AP_VENDORS_NNN_SETUP_DIR}/configs"
export AP_VENDORS_NNN_DIR="${AP_SOFT_DIR}/nnn/nnn-${AP_NNN_SETUP_VERSION}"
export AP_VENDORS_NNN_REPO_URL="https://github.com/jarun/nnn"

@addpath "${AP_VENDORS_NNN_DIR}/bin"
source "${AP_VENDORS_NNN_SETUP_CONFIGS_DIR}/ap_completion_nnn.bash"

# One line configure plugin
export NNN_PLUG='p:preview-tui;'

# Multi-lines configure plugins
# NNN_PLUG_PERSONAL='g:personal/convert2zoom;p:personal/echo'
# NNN_PLUG_WORK='j:work/prettyjson;d:work/foobar'
# NNN_PLUG_INLINE='e:!go run $nnn*'
# NNN_PLUG_DEFAULT='1:ipinfo;p:preview-tui;o:fzz;b:nbak'
# NNN_PLUG="$NNN_PLUG_PERSONAL;$NNN_PLUG_WORK;$NNN_PLUG_DEFAULT;$NNN_PLUG_INLINE"
# export NNN_PLUG

# Single instance: export a global FIFO path in, e.g., .profile:
export NNN_FIFO="${AP_TMP_DIR}/nnn.fifo"

# Multiple instances: use the option -a to create a new FIFO path for each instance.
