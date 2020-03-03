using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace EvaluacionQS.Models
{
    public class Factura
    {
        public int  FacturaId { get; set; }
        public string Serie { get; set; }
        public string Codigo { get; set; }
        public int VendedorId { get; set; }
        public int ClienteId { get; set; }
        public string Fecha { get; set; }
        public string Moneda { get; set; }
        public int CantidadProductos { get; set; }
        public int CantidadDetalle { get; set; }
    }
}
