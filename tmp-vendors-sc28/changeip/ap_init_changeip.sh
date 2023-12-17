# https://www.changeip.com/accounts/index.php?rp=/download/category/4/Linux-or-OSX.html

export AP_VENDORS_CHANGEIP_SETUP_DIR="${AP_SCRIPTO_COMMON_DIR}/vendors/changeip"
export AP_VENDORS_CHANGEIP_DIR="${AP_SOFT_DIR}/changeip"

alias changeip="${AP_SOFT_DIR}/changeip/rinker.sh"
alias changeipviewlogs='cat /tmp/changeip.log'
alias changeipviewcurrentip='cat /tmp/IP'
alias changeipclearcurrentip='echo -n "" > /tmp/IP'
