<?php


define('BASE_URL','/');
define('ROOT_PATH', $_SERVER['DOCUMENT_ROOT'].'/');

//MVC (model-view-controller) konstandid
define('PROJ_DATABASE_DIR', 'models/');     //currently inactive
define('PROJ_BACKEND_DIR', 'kontroller/');
define('PROJ_FRONTEND_DIR', 'vaated/');   

//front-end stuff ja pildid
define('CSS_DIR', 'assets/css/');
define('JS_DIR', 'assets/js/');
define('PLUG_DIR', 'assets/plugins/');
define('IMAGES_DIR', 'assets/images/');

//import database configuration:    
//DATABASE_HOSTNAME         DATABASE_USERNAME       DATABASE_PASSWORD       DATABASE_DATABASE
require_once 'db_conf.php';
