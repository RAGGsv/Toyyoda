//------------------------------------------------------------------------------
// <auto-generated>
//     Este código se generó a partir de una plantilla.
//
//     Los cambios manuales en este archivo pueden causar un comportamiento inesperado de la aplicación.
//     Los cambios manuales en este archivo se sobrescribirán si se regenera el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace toyoda.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class persona
    {
        public int idPersona { get; set; }
        public Nullable<int> idDireccion { get; set; }
        public Nullable<int> idTelefono { get; set; }
        public Nullable<int> idCorreo { get; set; }
        public Nullable<int> idDocumento { get; set; }
        public string genero { get; set; }
        public string primerNombre { get; set; }
        public string segundoNombre { get; set; }
        public string primerApellido { get; set; }
        public string segundoApellido { get; set; }
    }
}