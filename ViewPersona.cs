using prueba.Models;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace prueba.ViewModel
{
    public class ViewPersona : IValidatableObject
    {
        public pruebaEntities db = new pruebaEntities();
        //Campos de generales de publicacion
        public int? id { get; set; }

        [Required(ErrorMessage = "El pais es requerido")]
        public string pais { get; set; }

        [Required(ErrorMessage = "El departamento es requerido")]
        public string departamento { get; set; }

        [Required(ErrorMessage = "El nombre  es requerido")]
        public string nombre { get; set; }

        [Required(ErrorMessage = "El alias es requerido")]
        public string alias { get; set; }



        public IEnumerable<ValidationResult> Validate(ValidationContext validationContext)
        {
            if (id != null)
            {
                if (db.Lugares.Where(x => x.id == id).FirstOrDefault() == null)
                {
                    yield return new ValidationResult("El elemento no se encuentra registrado en el sistema.", new List<string> { "lugar" });
                }
            }
        }
    }
}