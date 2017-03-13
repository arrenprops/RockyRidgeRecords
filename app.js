var app = angular.module('recordsApp', ["ui.router"])

app.config(function ($stateProvider, $urlRouterProvider) {

  $urlRouterProvider.otherwise("/");

  $stateProvider.state("home", {
    url: "/",
    templateUrl: "./views/homeView.html",
    controller: "homeController"
  })
  $stateProvider.state("The States", {
    url: "/2",
    templateUrl: "./views/statesView.html",
    controller: "artistsController"
  })
  $stateProvider.state("The Districts", {
    url: "/3",
    templateUrl: "./views/districtsView.html",
    controller: "artistsController"
  })
  $stateProvider.state("Buran Buran", {
    url: "/4",
    templateUrl: "./views/buranView.html",
    controller: "artistsController"
  })
  $stateProvider.state("albumStore", {
    url: "/5",
    templateUrl: "./views/albumStoreView.html",
    controller: "merchController"
  })
  $stateProvider.state("merchStore", {
    url: "/6",
    templateUrl: "./views/merchStoreView.html",
    controller: "merchController"
  })
  $stateProvider.state("calendar", {
    url: "/7",
    templateUrl: "./views/calendarView.html",
    controller: "homeController"
  })
  $stateProvider.state("lyrics", {
    url: "/8",
    templateUrl: "./views/lyricsView.html",
    controller: "artistsController"
  })
  $stateProvider.state("cart", {
    url: "/9",
    templateUrl: "./views/cartView.html",
    controller: "merchController"
  })
})
