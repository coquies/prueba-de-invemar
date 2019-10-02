using prueba.Models;
using prueba.ViewModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Script.Serialization;

namespace prueba.Controllers
{
    public class PersonaController : Controller
    {
        private JavaScriptSerializer serializer = new JavaScriptSerializer();
        public pruebaEntities db = new pruebaEntities();


        // GET: Persona
        public ActionResult Index()
        {
            return View();
        }

        //metodos de listar
        public String lugares()
        {
            var lista = db.Lugares.Select(x => new
            {
                pais = x.pais,
                departamento   = x.departamento, 
                nombre = x.nombre,
                alias = x.alias,
            }).ToList();

            return serializer.Serialize(new { lugares = lista });
        }

        public String avistamientos()
        {
            var lista = db.Avistamientos.Select(x => new
            {
                especie = x.especie_id,
                lugar =  x.lugar_id,
                latitud = x.longitud,
                longitud = x.latitud,
                autor = x.autor,
                observacion = x.observacion,
            }).ToList();

            return serializer.Serialize(new { avistamientos = lista });
        }

        public String especies()
        {
            var lista = db.Especies.Select(x => new
            {
                nombreComun =x.nombre_Comun,
                nombreCientifico = x.nombre_Cientifico,
                familia = x.familia
           
            }).ToList();

            return serializer.Serialize(new { especies = lista });
        }
   

        //metodo post de crear un lugar
        [HttpPost]
        public String Crearlugar(ViewPersona model)
        {
            if (!ModelState.IsValid)
            {
                var errores = ModelState.Select(v => new { key = v.Key, errores = v.Value.Errors });
                return serializer.Serialize(new { success = false, errores = errores });
            }

            Lugare lugar = new Lugare();
            lugar.pais = model.pais;
            lugar.departamento = model.departamento;
            lugar.nombre = model.nombre;
            lugar.alias = model.alias;

            db.Lugares.Add(lugar);
            db.SaveChanges();

            Lugare x = db.Lugares.Find(lugar.id);
            var objRetornado = new
            {
                pais = x.pais,
                departamento = x.departamento,
                nombre = x.nombre,
                alias = x.alias,

            };
            return serializer.Serialize(new { success = true, objRetornado = objRetornado });
        }

    }
}