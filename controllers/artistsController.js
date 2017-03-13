angular
    .module('recordsApp')
    .controller('artistsController', function ($scope, $http, artistService, memberService, productService, tourDatesService, albumService, songService, cartService) {

        $scope.thisSong = artistService.getThisSong();
        console.log($scope.artists)
        memberService.getMembers(function (r) {
            $scope.members = r;
            console.log($scope.members)
        });
        productService.getProducts(function (r) {
            $scope.products = r;
            console.log($scope.products)
        });
        tourDatesService.getTourDates(function (r) {
            $scope.tourDates = r;
            console.log($scope.tourDates)
        });
        albumService.getAlbums(function (r) {
            $scope.albums = r;
            console.log($scope.albums)
        });
        songService.getSongs(function (r) {
            $scope.songs = r;
            console.log($scope.artists);
        })
        artistService.getArtists(function (r) {
            $scope.artists = r;
            console.log($scope.artists);
        });
        cartService.getCart(function(r){
          $scope.cart = r;
      });
        console.log();
        $scope.show = false;
        $scope.showSongs = function () {
            if ($scope.show == true) {
                $scope.show = false;
            } else if ($scope.show == false) {
                $scope.show = true;
            }
        }
        $scope.showThisSong = function (song) {
            artistService.setThisSong(song);
            $scope.thisSong = artistService.getThisSong();
            console.log($scope.thisSong);
        }
        $scope.thisCart = cartService.getThisCart();
        $scope.addToCart = function(product){
          cartService.setThisCart(product);
            $scope.thisCart = cartService.getThisCart();
            console.log($scope.thisCart);
      }
    })