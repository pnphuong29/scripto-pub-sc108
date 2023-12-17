export AP_VENDORS_TREE_SETUP_DIR="${AP_SCRIPTO_COMMON_DIR}/vendors/tree"
export AP_VENDORS_TREE_DIR="${AP_SOFT_DIR}/tree"

@addpath "${AP_VENDORS_TREE_DIR}"

alias t='tree -ugpshaC -I .git -I node_modules'                               # list all hidden files & dirs & ignore dirs (.git, etc.)
alias t1='tree -L 1 -ugpshaC --metafirst --dirsfirst -I .git -I node_modules' # list level 1 of all hidden files & dirs & ignore dirs (.git, etc.)
alias t2='tree -L 2 -ugpshaC --metafirst --dirsfirst -I .git -I node_modules' # list level 2 of all hidden files & dirs & ignore dirs (.git, etc.)
alias t3='tree -L 3 -ugpshaC --metafirst --dirsfirst -I .git -I node_modules' # list level 2 of all hidden files & dirs & ignore dirs (.git, etc.)
alias t4='tree -L 4 -ugpshaC --metafirst --dirsfirst -I .git -I node_modules' # list level 2 of all hidden files & dirs & ignore dirs (.git, etc.)
alias t5='tree -L 5 -ugpshaC --metafirst --dirsfirst -I .git -I node_modules' # list level 2 of all hidden files & dirs & ignore dirs (.git, etc.)
