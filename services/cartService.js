angular
    .module("recordsApp")
    .service("cartService", function ($http) {

        var _cart = [];
        var _thisCart = [];

        this.getCart = function (callback) {
            $http.get("http://localhost:49791/api/carts")
                .success(function (response) {
                    callback(response);
                    _cart = response;
                })
                .error(function () {

                })
        }
        this.getThisCart = function () {
            return _thisCart;
        }
        this.setThisCart = function (product) {
            _thisCart.push(product);
            console.log(_thisCart)
        }
        this.updateCart = function (_thisCart) {
            $http.post('http://localhost:49791/api/carts', _thisCart, function (response) {
                _cart.push(_thisCart);
            })
        }
    })