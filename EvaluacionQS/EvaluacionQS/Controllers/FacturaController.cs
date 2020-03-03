using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using EvaluacionQS.DataProvider;
using EvaluacionQS.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace EvaluacionQS.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class FacturaController : ControllerBase
    {

        private IFacturaDataProvider facturaDataProvider;

        public FacturaController(IFacturaDataProvider facturaDataProvider)
        {
            this.facturaDataProvider = facturaDataProvider;
        }

        // GET: api/Factura
        [HttpGet]
        public async Task<IEnumerable<FacturaEmitida>> Get()
        {
            return await this.facturaDataProvider.GetFacturas();
        }

        // GET: api/Factura/5
        [HttpGet("{id}", Name = "Get")]
        public string Get(int id)
        {
            return "value";
        }

        // POST: api/Factura
        [HttpPost]
        public void Post([FromBody] string value)
        {
        }

        // PUT: api/Factura/5
        [HttpPut("{id}")]
        public void Put(int id, [FromBody] string value)
        {
        }

        // DELETE: api/ApiWithActions/5
        [HttpDelete("{id}")]
        public void Delete(int id)
        {
        }
    }
}
