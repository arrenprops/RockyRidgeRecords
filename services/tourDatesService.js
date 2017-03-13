angular
    .module("recordsApp")
    .service("tourDatesService", function ($http) {
        var _tourDates = [];

        this.getTourDates = function (callback) {
            $http.get("http://localhost:49791/api/tourDates")
                .success(function (response) {
                    callback(response);
                    _tourDates = response;
                })
                .error(function () {
                })
        }
    })