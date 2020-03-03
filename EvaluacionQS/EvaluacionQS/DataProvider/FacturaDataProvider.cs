using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;
using Dapper;
using EvaluacionQS.Models;
using Microsoft.Extensions.Configuration;

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
    }
}
