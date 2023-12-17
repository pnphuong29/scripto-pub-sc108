export AP_VENDORS_TREE_SETUP_DIR="${AP_SCRIPTO_COMMON_DIR}/vendors/tree"
export AP_VENDORS_TREE_DIR="${AP_SOFT_DIR}/tree"

if ! type tree &>/dev/null; then
	@logshow "Installing [tree]\n"

	# Install tree
	cd "${AP_TMP_DIR}"

	# curl -LO "ftp://mama.indstate.edu/linux/tree/tree-2.0.2.tgz"
	cp -f "${AP_VENDORS_TREE_SETUP_DIR}/tree-2.0.2.tgz" "${AP_TMP_DIR}/"

	# Remove old tree dir if any
	rm -rf "${AP_VENDORS_TREE_DIR}"
	tar -C "${AP_SOFT_DIR}" -zxf "tree-2.0.2.tgz"
	mv "${AP_SOFT_DIR}/tree-2.0.2" "${AP_VENDORS_TREE_DIR}"

	cd "${AP_VENDORS_TREE_DIR}"
	make

	# Man page
	ln -sf "${AP_VENDORS_TREE_DIR}/doc/tree.1" "${AP_MAN_DIR}/man1/tree.1"

	@addpath "${AP_VENDORS_TREE_DIR}"

	if type tree &>/dev/null; then
		@logshowpassed "[tree] has been installed successfully\n"
	else
		@logshowfailed "[tree] has been installed unsuccessfully\n"
	fi
fi
