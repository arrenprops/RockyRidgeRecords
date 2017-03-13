angular
  .module('recordsApp')
  .controller('albumsController', function ($scope, artistService, memberService, productService, tourDatesService, albumService, songService, cartService) {

    artistService.getArtists(function(r){
          $scope.artists = r;
      });
      memberService.getMembers(function(r){
          $scope.members = r;
      });
      productService.getProducts(function(r){
          $scope.products = r;
      });
      tourDatesService.getTourDates(function(r){
          $scope.tourDates = r;
      });
      albumService.getAlbums(function(r){
          $scope.albums = r;
      });
      songService.getSongs(function(r){
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