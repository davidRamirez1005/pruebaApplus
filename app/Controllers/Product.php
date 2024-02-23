<?php

namespace App\Controllers;
use david\SimpleMVC\Database\Connection;

class Product
{
  protected $db;

  public function __construct($db)
  {
      $this->db = $db;
  }

  public function index()
  {
    $statement = $this->db->prepare("SELECT product.code AS codigo_producto, product.name AS nombre_producto, product.price AS precio_producto, product.createdAt AS fecha_creado, product.updatedAt AS fecha_actualizado, category.name AS nombre_categoria
    FROM product
    INNER JOIN category
    ON category.id = product.category"
    );
    $statement->execute();

    $people = $statement->fetchAll();

    echo json_encode($people);
  }


  public function insertProduct()
  {
      $json_input = file_get_contents('php://input');
      $data = json_decode($json_input, true);
      $statement = $this->db->prepare("INSERT INTO product (code, name, category, price, createdAt, updatedAt)
          VALUES (:code, :name, :category, :price, :createdAt, :updatedAt)
      ");
    var_dump($data);
      $statement->bindParam(':code', $data['code']);
      $statement->bindParam(':name', $data['name'] );
      $statement->bindParam(':category', $data['category'] );
      $statement->bindParam(':price', $data['price'] );
      $statement->bindParam(':createdAt', $data['createdAt'] );
      $statement->bindParam(':updatedAt', $data['updatedAt'] );
  
      $success = $statement->execute();
  
      if ($success) {
        echo json_encode(array("message" => "Product created successfully"));
        print_r($data);
      } else {
          echo json_encode(array("message" => "Error creating product"));
      }
  }



  public function deleteProduct()
  {
    $json_input = file_get_contents('php://input');
    $data = json_decode($json_input, true);

    if (!isset($data['code'])) {
        echo json_encode(array("message" => "No encontrado"));
        return;
    }

    $code = $data['code'];

    $statement = $this->db->prepare("DELETE FROM product WHERE code = :code");
    $statement->bindParam(':code', $code);

    $success = $statement->execute();

    if ($success) {
        echo json_encode(array("message" => "Product deleted successfully"));
    } else {
        echo json_encode(array("message" => "Error deleting product"));
    }
}



public function updateProduct()
{
    $json_input = file_get_contents('php://input');
    $data = json_decode($json_input, true);
    if (!isset($data['data']['code'])) {
        echo json_encode(array("message" => "No se proporcionó el código del producto"));
        return;
    }

    $code = $data['data']['code'];
    $existingProductStatement = $this->db->prepare("SELECT * FROM product WHERE code = :code");
    $existingProductStatement->bindParam(':code', $code);
    $existingProductStatement->execute();
    $existingProduct = $existingProductStatement->fetch();

    if (!$existingProduct) {
        echo json_encode(array("message" => "Producto no encontrado"));
        return;
    }

    $updateStatement = $this->db->prepare("UPDATE product SET 
        name = :name,
        category = :category,
        price = :price,
        updatedAt = :updatedAt
        WHERE code = :code"
    );

    print_r($data['data']);
    $updateStatement->bindParam(':name', $data['data']['name']);
    $updateStatement->bindParam(':category', $data['data']['category']);
    $updateStatement->bindParam(':price', $data['data']['price']);
    $updateStatement->bindParam(':updatedAt', $data['data']['updatedAt']);
    $updateStatement->bindParam(':code', $code);

    $success = $updateStatement->execute();

    if ($success) {
        echo json_encode(array("message" => "Producto actualizado correctamente"));
    } else {
        echo json_encode(array("message" => "Error al actualizar el producto"));
    }
}
}


