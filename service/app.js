angular
  .module("crud", [])
  .controller("MainController", function ($scope, $http, API_URL) {
    $http
     /**
     * !GET
     */
      .get(API_URL + "/product")
      .then(function (response) {
        if (Array.isArray(response.data) && response.data.length > 0) {
          $scope.products = response.data;
        } else {
          console.error(
            "La respuesta de la API no tiene el formato esperado",
            response.data
          );
        }
      })
      .catch(function (error) {
        console.error("Error al consumir la API", error);
      });


    $scope.abrirModalCrear = function () {
      $scope.nuevoProducto = {};
      $("#crearProductoModal").modal("show");
    };
    $scope.abrirModalEliminar = function (product) {
      $scope.nuevoProducto = {};
      $("#eliminarProductoModal").modal("show");
      $('#codeDelete').text(product[0])
    };
    $scope.abrirModalActualizar = function (product) {
      $scope.nuevoProducto = {};
      $("#actualizarProductoModal").modal("show");
      $('#codeActualizar').text(product[0])
    };


    /**
     * !POST
     */
    $scope.crearProducto = function () {
      // console.log("Crear Producto", $scope.nuevoProducto);
      $http
        .post(API_URL + "/product", $scope.nuevoProducto)
        .then(function (response) {
          console.log(response.data);
        })
        .catch(function (error) {
          console.error("Error al enviar la solicitud al servidor", error);
        })
        .finally(function () {
          $("#crearProductoModal").modal("hide");
        });
    };


    /**
     * !PUT
     */
    $scope.actualizarProducto = function (product) {
    
        $http.put(API_URL + '/product', { data: { code: $('#codeActualizar').text(), ...$scope.nuevoProducto } })
            .then(function (response) {
                console.log(response.data);
            })
            .catch(function (error) {
                console.error('Error al enviar la solicitud al servidor', error);
            });
    };


    /**
     * !DELETE
     */
    $scope.eliminarProducto = function () {
        console.log('Eliminar Producto', $('#codeDelete').text());
    
        $http.delete(API_URL + '/product', { data: { code: $('#codeDelete').text() } })
            .then(function (response) {
                console.log(response.data);
            })
            .catch(function (error) {
                console.error('Error al enviar la solicitud al servidor', error);
            });
    };
    
  });
