using EvaluacionQS.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace EvaluacionQS.DataProvider
{
    public interface IFacturaDataProvider
    {

        Task<IEnumerable<FacturaEmitida>> GetFacturas();

        Task<int> PostFactura(Factura factura);
    }
}
