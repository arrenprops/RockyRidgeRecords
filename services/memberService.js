angular
    .module("recordsApp")
    .service("memberService", function($http){
       var _members = [];

        this.getMembers = function(callback){
            $http.get("http://localhost:49791/api/members")
            .success(function(response){
                callback(response);
                _members = response;
            })
            .error(function(){
            })
        }  
    })