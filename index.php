<?php
require 'vendor/autoload.php';
require 'src/SimpleMVC/bootstrap.php';

use david\SimpleMVC\Router;
use david\SimpleMVC\Request;

Router::load(__DIR__.'/app/routes.php')->direct(Request::uri(), Request::method());
