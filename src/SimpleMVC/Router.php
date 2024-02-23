<?php

namespace david\SimpleMVC;

use david\SimpleMVC\Exceptions\KeyNotFoundException;
use david\SimpleMVC\Exceptions\MethodNotFoundException;

class Router
{

    protected $routes = [
        'GET' => [],
        'POST' => [], 
        'PUT' => [],
        'DELETE' => [],
    ];
    public static function load($file)
    {
        $router = new static;

        require $file;

        return $router;
    }

    public function get($uri, $controller)
    {
        $this->routes['GET'][$uri] = $controller;
    }

    public function post($uri, $controller)
    {
        $this->routes['POST'][$uri] = $controller;
    }

    public function put($uri, $controller)
    {
        $this->routes['PUT'][$uri] = $controller;
    }

    public function delete($uri, $controller)
    {
        $this->routes['DELETE'][$uri] = $controller;
    }

    public function direct($uri, $requestType)
    {
        if (array_key_exists($uri, $this->routes[$requestType])) {
            return $this->callAction(
                ...explode('@', $this->routes[$requestType][$uri])
            );
        }
        http_response_code(404);
        return view('404');
    }

    protected function callAction($controller, $method)
    {
        $controller = App::get('controllers-path') . "{$controller}";
        $controller = new $controller(App::get('database'));

        if (!method_exists($controller, $method)) {
            http_response_code(404);
            return view('404');
        }
        return $controller->$method();
    }
}
