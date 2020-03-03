using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace EvaluacionQS.Models
{
    public class Producto
    {
       public int  ProductoId { get; set; }
       public string Descripcion { get; set; }
       public decimal PrecioUnitario { get; set; }
       public string Categoria { get; set; }
    }
}
