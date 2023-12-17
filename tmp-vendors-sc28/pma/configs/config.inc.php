<?php

declare(strict_types=1);

/**
 * ******* General *******
 */
$cfg['blowfish_secret'] = 'SKY CENTER SKY CENTER SKY CENTER'; /* YOU MUST FILL IN THIS FOR COOKIE AUTH! */

$cfg['UploadDir'] = '/Users/pnphuong29/pnphuong29/Coding/tmp/phpmyadmin/upload';
$cfg['SaveDir'] = '/Users/pnphuong29/pnphuong29/Coding/tmp/phpmyadmin/save';
$cfg['TempDir'] = '/Users/pnphuong29/pnphuong29/Coding/tmp/phpmyadmin/tmp';

$cfg['MaxRows'] = 75;
$cfg['QueryHistoryDB'] = true;
$cfg['QueryHistoryMax'] = 100;
$cfg['DefaultLang'] = 'en';
$cfg['ShowAll'] = true;

/**
 * ******* Servers *******
 */
$i = 0;

/**
 * localhost
 */
$i++;

$cfg['Servers'][$i]['auth_type'] = 'cookie';
$cfg['Servers'][$i]['host'] = '127.0.0.1';
$cfg['Servers'][$i]['compress'] = false;
$cfg['Servers'][$i]['AllowNoPassword'] = false;
$cfg['Servers'][$i]['port'] = 3306;
