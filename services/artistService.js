angular
    .module("recordsApp")
    .service("artistService", function($http){
         var _artists = [];
         var _thisSong = {};

        this.getArtists = function(callback){
            $http.get("http://localhost:49791/api/artists")
            .success(function(response){
                callback(response);
                _artists = response;
            })
            .error(function(){
            })
        }
        this.getThisSong = function() {
            return _thisSong;
        }
        this.setThisSong = function(song) {
            _thisSong = song;
        }
    })