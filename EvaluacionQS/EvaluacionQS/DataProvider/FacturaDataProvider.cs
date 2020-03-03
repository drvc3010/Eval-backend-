using Dapper;
using EvaluacionQS.Models;
using Microsoft.Extensions.Configuration;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Threading.Tasks;

namespace EvaluacionQS.DataProvider
{
    public class FacturaDataProvider : IFacturaDataProvider
    {
        public IConfiguration _ConnectionString;

        public FacturaDataProvider(IConfiguration configuration)
        {
            _ConnectionString = configuration;
        }

        public async Task<IEnumerable<FacturaEmitida>> GetFacturas()
        {
            using (var sqlConnection = new SqlConnection(_ConnectionString.GetSection("ConnectionString").GetSection("ConexionText").Value))
            {
                await sqlConnection.OpenAsync();
                return await sqlConnection.QueryAsync<FacturaEmitida>(
                    "SPS_LISTA_FACTURAS_EMITIDAS",
                    null,
                    commandType: CommandType.StoredProcedure);
            }
        }

        public async Task<int> PostFactura(Factura factura)
        {
            using (var sqlConnection = new SqlConnection(_ConnectionString.GetSection("ConnectionString").GetSection("ConexionText").Value))
            {
                await sqlConnection.OpenAsync();
                int  rowAffect = await sqlConnection.ExecuteAsync(
                    "SPI_FACTURA",
                    factura,
                     null,
                      null,
                    commandType: CommandType.StoredProcedure);
                return rowAffect;
            }
        }
    }
}
