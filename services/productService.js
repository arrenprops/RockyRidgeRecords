angular
    .module("recordsApp")
    .service("productService", function ($http) {
        var _products = [];

        this.getProducts = function (callback) {
            $http.get("http://localhost:49791/api/products")
                .success(function (response) {
                    callback(response);
                    _products = response;
                })
                .error(function () {
                })
        }
    })