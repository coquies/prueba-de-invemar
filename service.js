var app = angular.module('Services', []);

app.factory('Service', function ($http, $q) {

    return {


        listar: function (ruta) {
            var defered = $q.defer();
            var promise = defered.promise;
            $http.get(ruta)
                .then(function (data) {
                    defered.resolve(data);
                },
                function (err) {
                    defered.reject(err);
                }
                );
            return promise;
        },


        guardarLugares: function (obj) {
            var defered = $q.defer();
            var promise = defered.promise;
            $http.post('/Persona/Crearlugar', obj).then(function (data) {
                defered.resolve(data);
            }, function (err) {
                defered.reject(err);
            });
            return promise;
        },

        //Editar: function (obj) {
        //    var defered = $q.defer();
        //    var promise = defered.promise;
        //    $http.post('/Persona/EditarPersonas', obj).then(function (data) {
        //        defered.resolve(data);
        //    }, function (err) {
        //        defered.reject(err);
        //    });
        //    return promise;
        //},

        //Eliminar: function (obj) {
        //    var defered = $q.defer();
        //    var promise = defered.promise;
        //    $http.post('/Persona/Eliminar', obj).then(function (data) {
        //        defered.resolve(data);
        //    }, function (err) {
        //        defered.reject(err);
        //    });
        //    return promise;
        //},
    }
});
