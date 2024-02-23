<?php

$router->get('product', 'Product@index');
$router->post('product', 'Product@insertProduct');
$router->put('product', 'Product@updateProduct');
$router->delete('product', 'Product@deleteProduct');
