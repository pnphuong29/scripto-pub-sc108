# Aliases - Dynamic
if [[ "${AP_DATA_DIR}" == "/mnt/lvm/data1" || "${AP_DATA_DIR}" == "/data1" ]]; then
    alias @@mkdir="sudo mkdir"
    alias @@chmod="sudo chmod"
    alias @@rm="sudo rm"
else
    alias @@mkdir="mkdir"
    alias @@chmod="chmod"
    alias @@rm="rm"
fi
