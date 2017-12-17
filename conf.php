<?php
// URL & path
$dolibarr_main_url_root = getenv('URL_ROOT');
$dolibarr_main_document_root = '/var/www/html';
$dolibarr_main_url_root_alt = '/custom';
$dolibarr_main_document_root_alt = '/var/www/html/custom';
$dolibarr_main_data_root = '/documents';

// Database
$dolibarr_main_db_host = getenv('DB_HOST');
$dolibarr_main_db_port = getenv('DB_PORT');
$dolibarr_main_db_name = getenv('DB_NAME');
$dolibarr_main_db_prefix = 'llx_';
$dolibarr_main_db_user = getenv('DB_USER');
$dolibarr_main_db_pass = getenv('DB_PASS');
$dolibarr_main_db_type = getenv('DB_TYPE');
$dolibarr_main_db_character_set = 'utf8';
$dolibarr_main_db_collation = 'utf8_unicode_ci';

// Security stuff
$dolibarr_main_authentication = 'dolibarr';
$dolibarr_main_force_https = '0'; // HTTPS should be enforced on the reverse proxy
$dolibarr_main_prod = '0';
$dolibarr_main_restrict_os_commands = 'mysqldump, mysql, pg_dump, pgrestore';
$dolibarr_nocsrfcheck = '0';
$dolibarr_main_cookie_cryptkey = getenv('COOKIE_CRYPT_KEY');
$dolibarr_mailing_limit_sendbyweb = '0';

