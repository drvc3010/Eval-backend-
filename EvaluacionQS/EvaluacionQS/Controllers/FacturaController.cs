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

        [HttpGet]
        public async Task<IEnumerable<FacturaEmitida>> Get()
        {
            return await this.facturaDataProvider.GetFacturas();
        }



        // POST: api/Factura
        [HttpPost]
        public string Post(Factura factura)
        {
           int   var = this.facturaDataProvider.PostFactura(factura).Result;
            return var > 0 ? "Se registro correctamente la factura." : "No se pudo registrar la factura, revise de nuevo por favor.";
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
