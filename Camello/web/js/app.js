var app = angular.module('appCamello', []);

app.config(function ($routeProvider) {
    $routeProvider
            .when("/", {
                templateUrl: "vista/inicioSesion.jsp",
                controller: "inicioSesionController"
            })
            .when("/registro_empresa", {
                templateUrl: "vista/registroEmpresa.jsp"
            })
            .when("/registo_persona", {
                templateUrl: "vista/registroPersona.jsp"
            })
            .otherwise({
                redirectTo: '/'
            });
});

app.controller('inicioSesionController', function ($scope, $window, $rootScope, $location) {

});
