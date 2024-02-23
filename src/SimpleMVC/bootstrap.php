<?php

use david\SimpleMVC\App;
use david\SimpleMVC\Database\Connection;

// Configuración de CORS
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: GET, POST, PUT, DELETE, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type, Authorization");

if ($_SERVER['REQUEST_METHOD'] == 'OPTIONS') {
    header("HTTP/1.1 200 OK");
    exit();
}

App::bind('config', require 'config.php');
App::bind('request', $_REQUEST);
App::bind('controllers-path', 'App\\Controllers\\');

$db = Connection::make([
    'connection' => 'mysql:host=localhost',
    'name' => 'primeraPrueba',
    'username' => 'root',
    'password' => '',
    'host' => 'localhost',
]);

App::bind('database', $db);
