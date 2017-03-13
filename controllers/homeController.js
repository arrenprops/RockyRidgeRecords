angular
  .module('recordsApp')
  .controller('homeController', function ($scope, artistService, memberService, productService, tourDatesService, albumService, songService, cartService) {

    $scope.thisCart = [];

    $scope.artists = artistService.getArtists(function(r){
          $scope.artists = r;
      });
      $scope.members = memberService.getMembers(function(r){
          $scope.members = r;
      });
      $scope.products = productService.getProducts(function(r){
          $scope.products = r;
      });
      $scope.tourDates = tourDatesService.getTourDates(function(r){
          $scope.tourDates = r;
      });
      $scope.albums = albumService.getAlbums(function(r){
          $scope.albums = r;
      });
      $scope.songs = songService.getSongs(function(r){
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
      
  })