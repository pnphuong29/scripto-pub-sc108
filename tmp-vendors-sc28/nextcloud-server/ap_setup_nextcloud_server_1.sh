# https://docs.nextcloud.com/server/stable/admin_manual/installation/source_installation.html
# https://docs.nextcloud.com/server/stable/admin_manual/installation/example_ubuntu.html
# https://github.com/nextcloud/server
# https://docs.nextcloud.com/server/stable/admin_manual/installation/source_installation.html#pretty-urls

export AP_NEXTCLOUD_SERVER_DIR="${AP_DATA1_DIR}/nextcloud"
export AP_VENDORS_NEXTCLOUD_SERVER_SETUP_DIR="${AP_SCRIPTO_COMMON_DIR}/vendors/nextcloud-server"
export AP_NEXTCLOUD_SERVER_DOCUMENT_ROOT='/var/www/nextcloud'
export AP_NEXTCLOUD_SERVER_CONFIG_FILE="${AP_NEXTCLOUD_SERVER_DOCUMENT_ROOT}/config/config.php"
export AP_NEXTCLOUD_SERVER_DB_TYPE='mysql'
export AP_NEXTCLOUD_SERVER_DB_NAME='nextcloud'
export AP_NEXTCLOUD_SERVER_DB_USER='nextcloud'
export AP_NEXTCLOUD_USER_ADMIN='pnphuong29'

if [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]]; then
	export AP_NEXTCLOUD_SERVER_APACHE_OWNER='_www'
elif [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]]; then
	export AP_NEXTCLOUD_SERVER_APACHE_OWNER='www-data'
fi

## Create nextcloud data dir
@logshow "Create nextcloud data dir\n"
sudo mkdir -p "${AP_NEXTCLOUD_SERVER_DIR}/data"
sudo chown -R "${AP_NEXTCLOUD_SERVER_APACHE_OWNER}.${AP_NEXTCLOUD_SERVER_APACHE_OWNER}" "${AP_NEXTCLOUD_SERVER_DIR}/data"

## Download nextcloud
@logshow "Download nextcloud\n"
cd "${AP_TMP_DIR}"
rm -f latest.tar.bz2
curl -SLO "https://download.nextcloud.com/server/releases/latest.tar.bz2"

## Checksum
@logshow "Verify checksum using md5\n"
curl -SLO "https://download.nextcloud.com/server/releases/latest.tar.bz2.md5"
md5 -c latest.tar.bz2.md5 <latest.tar.bz2

## Verify authenticity
@logshow "Verify authenticity\n"
curl -SLO "https://download.nextcloud.com/server/releases/latest.tar.bz2.asc"
curl -SLO "https://nextcloud.com/nextcloud.asc"
gpg --import nextcloud.asc
gpg --verify latest.tar.bz2.asc latest.tar.bz2

## Uncompress nextcloud
@logshow "Uncompress and move nextcloud to appropriate location\n"
tar -jxf latest.tar.bz2
sudo rm -rf "${AP_NEXTCLOUD_SERVER_DOCUMENT_ROOT}"
sudo mv nextcloud /var/www/

# Update ownership
@logshow "Update ownership of nextcloud\n"
sudo chown -R "${AP_NEXTCLOUD_SERVER_APACHE_OWNER}:${AP_NEXTCLOUD_SERVER_APACHE_OWNER}" "${AP_NEXTCLOUD_SERVER_DOCUMENT_ROOT}"

# Create apache httpd site config for nextcloud
@logshow "Create apache httpd site config for nextcloud\n"
cp -f "${AP_VENDORS_NEXTCLOUD_SERVER_SETUP_DIR}/configs/ap_apache_httpd_nextcloud.conf" "${AP_TMP_DIR}/ap_nextcloud.conf"
gsed -i'' "s#@{AP_PORT_NEXTCLOUD}@#${AP_PORT_NEXTCLOUD}#" "${AP_TMP_DIR}/ap_nextcloud.conf"
gsed -i'' "s#@{AP_NEXTCLOUD_SERVER_DOCUMENT_ROOT}@#${AP_NEXTCLOUD_SERVER_DOCUMENT_ROOT}#" "${AP_TMP_DIR}/ap_nextcloud.conf"
gsed -i'' "s#@{AP_DOMAIN_NEXTCLOUD}@#${AP_DOMAIN_NEXTCLOUD}#" "${AP_TMP_DIR}/ap_nextcloud.conf"
gsed -i'' "s#@{AP_NEXTCLOUD_SERVER_LOGS_DIR}@#${AP_NEXTCLOUD_SERVER_LOGS_DIR}#" "${AP_TMP_DIR}/ap_nextcloud.conf"
gsed -i'' "s#@{AP_APACHE_HTTPD_ROTATELOGS_FILE_PATH}@#${AP_APACHE_HTTPD_ROTATELOGS_FILE_PATH}#" "${AP_TMP_DIR}/ap_nextcloud.conf"
sudo cp -f "${AP_TMP_DIR}/ap_nextcloud.conf" /etc/apache2/sites-available/

# Enable apache httpd site config for nextcloud
@logshow "Enable site config for nextcloud\n"
sudo a2ensite ap_nextcloud.conf

# Activate apache httpd site config for nextcloud
@logshow "Enable mod rewrite, headers, env, dirs, mime\n"
sudo a2enmod rewrite
sudo a2enmod headers
sudo a2enmod env
sudo a2enmod dir
sudo a2enmod mime
sudo a2enmod setenvif # If you’re running `mod_fcgi` instead of the standard `mod_php` then need to enable mod `setenvif`

# Restart Apache2
@logshow "Restart Apache2\n"
sudo service apache2 restart

# Setup database
@logshow "Setup mysql database\n"
mysql -uroot -p <<-EOF
	CREATE USER IF NOT EXISTS ${AP_NEXTCLOUD_SERVER_DB_USER}@localhost IDENTIFIED WITH mysql_native_password BY '${AP_NEXTCLOUD_SERVER_DB_USER}';
	CREATE DATABASE IF NOT EXISTS ${AP_NEXTCLOUD_SERVER_DB_NAME} CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
	GRANT ALL PRIVILEGES ON ${AP_NEXTCLOUD_SERVER_DB_NAME}.* TO ${AP_NEXTCLOUD_SERVER_DB_USER}@localhost;
	FLUSH PRIVILEGES;
EOF

# Install nextcloud using `occ` commands
@logshow "Install nextcloud\n"
cd "${AP_NEXTCLOUD_SERVER_DOCUMENT_ROOT}"
sudo -u "${AP_NEXTCLOUD_SERVER_APACHE_OWNER}" php occ maintenance:install -vv \
	--database ${AP_NEXTCLOUD_SERVER_DB_TYPE} --database-name "${AP_NEXTCLOUD_SERVER_DB_NAME}" --database-user "${AP_NEXTCLOUD_SERVER_DB_USER}" --database-pass "${AP_NEXTCLOUD_SERVER_DB_USER}" \
	--admin-user "${AP_NEXTCLOUD_USER_ADMIN}" --admin-pass "${AP_NEXTCLOUD_USER_ADMIN}" \
	--data-dir "${AP_NEXTCLOUD_SERVER_DIR}/data"

# Configure nextcloud
@logshow "Configure nextcloud\n"
sudo cp -f "${AP_NEXTCLOUD_SERVER_CONFIG_FILE}" "${AP_TMP_DIR}/ap_nextcloud_config.php"
sudo chown "${USER}.${USER}" "${AP_TMP_DIR}/ap_nextcloud_config.php"

## Configure trusted domain
ap_g_pos=$(sudo grep -n trusted_domains "${AP_TMP_DIR}/ap_nextcloud_config.php" | cut -d ':' -f 1)
ap_g_pos=$((ap_g_pos + 2))
gsed -i'' "${ap_g_pos}a1 => '$AP_DOMAIN_NEXTCLOUD'" "${AP_TMP_DIR}/ap_nextcloud_config.php"

## Configure pretty URLs
ap_g_nc_tmp="$(echo "${AP_URL_NEXTCLOUD}" | gsed 's@\.@\\\.@g')"
gsed -i'' -E "s@('overwrite\.cli\.url') => '.+',@\1 => '${ap_g_nc_tmp}',@" "${AP_TMP_DIR}/ap_nextcloud_config.php"
ap_g_pos=$(sudo grep -n ");" "${AP_TMP_DIR}/ap_nextcloud_config.php" | cut -d ':' -f 1)
gsed -i'' "${ap_g_pos}i'htaccess.RewriteBase' => '/'," "${AP_TMP_DIR}/ap_nextcloud_config.php"

## Overwrite current nextcloud config file
sudo cp -f "${AP_TMP_DIR}/ap_nextcloud_config.php" "${AP_NEXTCLOUD_SERVER_CONFIG_FILE}"
sudo chown "${AP_NEXTCLOUD_SERVER_APACHE_OWNER}.${AP_NEXTCLOUD_SERVER_APACHE_OWNER}" "${AP_NEXTCLOUD_SERVER_CONFIG_FILE}"
sudo chmod 640 "${AP_NEXTCLOUD_SERVER_CONFIG_FILE}"

# Update .htaccess file
@logshow "Update nextcloud .htaccess\n"
sudo -u "${AP_NEXTCLOUD_SERVER_APACHE_OWNER}" php "${AP_NEXTCLOUD_SERVER_DOCUMENT_ROOT}/occ" maintenance:update:htaccess
