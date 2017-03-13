angular
    .module("recordsApp")
    .service("songService", function ($http) {
        var _songs = [];

        this.getSongs = function (callback) {
            $http.get("http://localhost:49791/api/songs")
                .success(function (response) {
                    callback(response);
                    _songs = response;
                })
                .error(function () {
                })
        }
    })