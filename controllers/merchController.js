angular
    .module('recordsApp')
    .controller('merchController', function ($scope, artistService, memberService, productService, tourDatesService, albumService, songService, cartService) {
        $scope.artists = artistService.getArtists(function (r) {
            $scope.artists = r;
        });
        $scope.members = memberService.getMembers(function (r) {
            $scope.members = r;
        });
        $scope.products = productService.getProducts(function (r) {
            $scope.products = r;
        });
        $scope.tourDates = tourDatesService.getTourDates(function (r) {
            $scope.tourDates = r;
        });
        $scope.albums = albumService.getAlbums(function (r) {
            $scope.albums = r;
        });
        $scope.songs = songService.getSongs(function (r) {
            $scope.songs = r;
        })
        cartService.getCart(function(r){
          $scope.cart = r;
      });
      $scope.thisCart = cartService.getThisCart();
                  
      $scope.addToCart = function(product){
          cartService.setThisCart(product);
            $scope.thisCart = cartService.getThisCart();
            console.log($scope.thisCart);
      }
      $scope.cartTotal = 0;

      $scope.cartTotalFunction =function(){
          for(var i =0; i< $scope.thisCart.length; i++){
              $scope.cartTotal += $scope.thisCart[i].price;
          }
          return $scope.cartTotal;
      }

      $scope.cartTotal = $scope.cartTotalFunction();
    })