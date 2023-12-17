export AP_VENDORS_TREE_SETUP_DIR="${AP_SCRIPTO_COMMON_DIR}/vendors/tree"
export AP_VENDORS_TREE_DIR="${AP_SOFT_DIR}/tree"

if type tree &>/dev/null; then
	@logshow "Removing [tree]\n"

	rm -rf "${AP_VENDORS_TREE_DIR}"
	rm -f "${AP_MAN_DIR}/man1/tree.1"

	if ! type tree; then
		@logshowpassed "[tree] has been removed successfully\n"
	else
		@logshowfailed "[tree] has been removed unsuccessfully\n"
	fi
fi
