using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace EvaluacionQS.Models
{
    public class FacturaEmitida
    {
        public int FacturaId { get; set; }
        public decimal MontoFactura { get; set; }
        public string Moneda { get; set; }
        public string NombresCliente { get; set; }
        public string NombresVendedor { get; set; }
        public int VendedorId { get; set; }
        public int ClienteId { get; set; }
        public string Nic { get; set; }
        public string Dni { get; set; }
        public string FechaFactura { get; set; }
    }
}
