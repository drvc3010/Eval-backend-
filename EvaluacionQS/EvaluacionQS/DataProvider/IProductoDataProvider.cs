using EvaluacionQS.Models;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace EvaluacionQS.DataProvider
{
    public interface IProductoDataProvider
    {
        Task<IEnumerable<Producto>> GetProductos();
    }
}
