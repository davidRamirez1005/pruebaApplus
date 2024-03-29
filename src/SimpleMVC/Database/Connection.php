<?php

namespace david\SimpleMVC\Database;

use PDO;
use PDOException;

class Connection
{

    public static function make($config)
    {
        try {
            return new PDO(
                $config['connection'] . ';dbname=' . $config['name'],
                $config['username'],
                $config['password']
            );
        }
        catch (PDOException $e) {
            die($e->getMessage());
        }
    }
}
