# Dependencies: fzf, bat, delta

export FORGIT_INSTALL_DIR="${AP_GH_DIR}/wfxr/forgit"
@addpath "${FORGIT_INSTALL_DIR}/bin"

# Disable all default aliases
export FORGIT_NO_ALIASES=1

# For linux users, available when the selection contains a commit hash
export FORGIT_COPY_CMD='xclip -selection clipboard'

# export FORGIT_FZF_DEFAULT_OPTS=""
# export FORGIT_CMD_FZF_OPTS=""
# export forgit_log=glo
# export forgit_diff=gd
# export forgit_add=ga
# export forgit_reset_head=grh
# export forgit_ignore=gi
# export forgit_checkout_file=gcf
# export forgit_checkout_branch=gcb
# export forgit_checkout_commit=gco
# export forgit_clean=gclean
# export forgit_stash_show=gss
# export forgit_cherry_pick=gcp
# export forgit_rebase=grb
# export forgit_fixup=gfu

# Aliases
alias fga='git forgit add'
alias fgd='git forgit diff'
alias fgl='git forgit log'
