var app = angular.module('Controllers', []);


app.controller('Controller', ['$scope', 'Service', function ($scope, serviceHttp) {

    $scope.Lugares = [];
    $scope.Avistamientos = [];
    $scope.Especies = [];


    $scope.lugar = {};


    //metodos de listado
    serviceHttp.listar("/Persona/lugares").then(function (data) {
        $scope.Lugares = data.data.lugares;
        console.log("listado de lugares",$scope.Lugares);
    });

    serviceHttp.listar("/Persona/avistamientos").then(function (data) {
        $scope.Avistamientos = data.data.avistamientos;
        console.log("listado de avistamientos",$scope.Avistamientos);
    });

    serviceHttp.listar("/Persona/especies").then(function (data) {
        $scope.Especies = data.data.especies;
        console.log("listado de especies",$scope.Especies);
    });

    $scope.getEspecies = function (id) {
        var resp = '';
        for (var i = 0; i < $scope.Especies.length; i++) {
            if ($scope.Especies[i].id === id) {
                resp = $scope.Especies[i].nombreComun;
            }
        }
        return resp;
    }; 

    $scope.getLugar = function (id) {
        var resp = '';
        for (var i = 0; i < $scope.Lugares.length; i++) {
            if ($scope.Lugares[i].id === id) {
                resp = $scope.Lugares[i].departamento;
            }
        }
        return resp;
    }; 


    ////crear

    $scope.guardarLugar = function () {
        console.log($scope.lugar);
        if (!$scope.PersonarForm.$valid) {
            swal("Error", "verifique la información ingresada", "error")
            return;
        }
        serviceHttp.guardarLugares($scope.lugar).then(success);
        function success(data) {
            if (data.data.success) {
                $scope.Lugares.push(data.data.objRetornado);             
                $('#modalLugar').modal('hide');
                swal({
                    type: "success",
                    title: "Realizado",
                    text: "Se ha guardado satisfactoriamente el item.",
                    timer: 2000,
                    showConfirmButton: false
                });
            } else {
                $scope.errores = data.data.errores;
                console.log($scope.errores);
                swal("Error", "Verifique la información y vuelva a intentarlo.", "error");
            }
        }
        $("#modalLugar").modal('hide');
        $scope.PersonarForm.$setUntouched();
        $scope.PersonarForm.$setPristine();
        $scope.lugar = {};
    };

 



}]);



