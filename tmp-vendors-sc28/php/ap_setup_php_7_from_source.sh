# Dependencies: apache-httpd, openssl v1.1, icu4c, openldap, libiconv, cyrus-sasl (libsasl2)
ap_php_version='7.4.28'

# Download PHP
# ap_g_download_url="https://www.php.net/distributions/{php-${ap_php_version}.tar.gz}"
# curl -L "${ap_g_download_url}" -o "${AP_TMP_DIR}/#1"
# rm -rf "${AP_TMP_DIR}/php-${ap_php_version}"
# tar -C "${AP_TMP_DIR}" -zxf "${AP_TMP_DIR}/php-${ap_php_version}.tar.gz"

# echo "Installing additional libraries before setting up [${ap_php_version}]"

if [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]]; then
	# brew install openssl libiconv icu4c openldap cyrus-sasl

	# With PHP 7.4, should use openssl v1.1 instead of newer version
	export PKG_CONFIG_PATH="/usr/local/opt/openssl@1.1/lib/pkgconfig:/usr/local/opt/icu4c/lib/pkgconfig"

	# Create symbolic links for openldap headers and libraries
	# cd /usr/local/include
	# [[ ! -L ldap.h ]] && ln -s ../opt/openldap/include/ldap.h

	# cd /usr/local/lib
	# [[ ! -L libldap.a ]] && ln -s ../opt/openldap/lib/libldap.a
	# [[ ! -L libldap.dylib ]] && ln -s ../opt/openldap/lib/libldap.dylib
	# [[ ! -L libldap.2.dylib ]] && ln -s ../opt/openldap/lib/libldap.2.dylib

	printf "Installing [PHP %s]\n" "${ap_php_version}"
	cd "${AP_TMP_DIR}/php-${ap_php_version}"

	./configure \
		--prefix="${AP_SOFT_DIR}/php/php@${ap_php_version}" \
		--includedir="${AP_MACOS_SDK_CLI_TOOLS_DIR}/usr/include" \
		--libdir="${AP_MACOS_SDK_CLI_TOOLS_DIR}/usr/lib" \
		--with-iconv="${AP_MACOS_SDK_CLI_TOOLS_DIR}/usr" \
		--with-bz2=/usr/local/opt/bzip2 \
		--with-curl \
		--with-libxml \
		--with-openssl \
		--with-xmlrpc \
		--enable-mbstring \
		--enable-soap \
		--with-mysqli \
		--with-pgsql \
		--with-ldap \
		--enable-intl \
		--with-xsl \
		--with-zlib \
		--enable-maintainer-zts
	# --includedir="${AP_MACOS_SDK_CLI_TOOLS_DIR}/usr/include" \
	# --libdir="${AP_MACOS_SDK_CLI_TOOLS_DIR}/usr/lib" \

	[[ "$?" == 0 ]] && make
	[[ "$?" == 0 ]] && make install
elif [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]]; then
	echo "Installing [PHP ${ap_php_version}]\n"
	cd "${AP_SOFT_DIR}/php-${ap_php_version}"
fi
