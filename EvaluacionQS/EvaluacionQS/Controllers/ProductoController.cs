using EvaluacionQS.DataProvider;
using EvaluacionQS.Models;
using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace EvaluacionQS.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ProductoController : ControllerBase
    {
        private IProductoDataProvider productoDataProvider;

        public ProductoController(IProductoDataProvider productoDataProvider)
        {
            this.productoDataProvider = productoDataProvider;
        }

        // GET: api/Producto
        [HttpGet]
        public async Task<IEnumerable<Producto>> Get()
        {
            return await this.productoDataProvider.GetProductos();
        }

    }
}
