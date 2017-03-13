angular
    .module("recordsApp")
    .service("albumService", function ($http) {

        var _albums = [];

        this.getAlbums = function (callback) {
            $http.get("http://localhost:49791/api/albums")
                .success(function (response) {
                    callback(response);
                    _albums = response;
                })
                .error(function () {
                })
        }
    })