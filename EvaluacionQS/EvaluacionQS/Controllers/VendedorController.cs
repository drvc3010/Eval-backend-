using EvaluacionQS.DataProvider;
using EvaluacionQS.Models;
using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace EvaluacionQS.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class VendedorController : ControllerBase
    {
        private IVendedorDataProvider vendedorDataProvider;

        public VendedorController(IVendedorDataProvider vendedorDataProvider)
        {
            this.vendedorDataProvider = vendedorDataProvider;
        }

        // GET: api/Vendedor
        [HttpGet]
        public async Task<IEnumerable<Vendedor>> GetAsync()
        {
            return await this.vendedorDataProvider.GetVendedores();
        }

        
    }
}
