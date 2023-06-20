using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
 
namespace toyoda.Models
{
    public class Usuarios
    {
        public int IdUsuario { get; set; }
        public string Correo { get; set; }
        public string Clave { get; set; }


        public string ConfirmarClave { get; set; }

    }
}