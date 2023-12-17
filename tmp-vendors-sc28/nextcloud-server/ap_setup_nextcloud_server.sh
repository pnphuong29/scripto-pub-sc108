# https://docs.nextcloud.com/server/stable/admin_manual/installation/source_installation.html
# https://docs.nextcloud.com/server/stable/admin_manual/installation/example_ubuntu.html
# https://github.com/nextcloud/server
# https://docs.nextcloud.com/server/stable/admin_manual/installation/source_installation.html#pretty-urls

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
