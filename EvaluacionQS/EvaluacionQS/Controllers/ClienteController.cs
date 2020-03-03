using EvaluacionQS.DataProvider;
using EvaluacionQS.Models;
using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace EvaluacionQS.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ClienteController : Controller
    {
        private IClienteDataProvider clienteDataProvider;

        public ClienteController    (IClienteDataProvider clienteDataProvider)
        {
            this.clienteDataProvider = clienteDataProvider;
        }

        // GET: api/Cliente
        [HttpGet]
        public async Task<IEnumerable<Cliente>> GetAsync()
        {
            return await this.clienteDataProvider.GetClientes();
        }
        
    }
}
