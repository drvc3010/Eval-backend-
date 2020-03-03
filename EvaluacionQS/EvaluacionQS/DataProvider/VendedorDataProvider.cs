using Dapper;
using EvaluacionQS.Models;
using Microsoft.Extensions.Configuration;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Threading.Tasks;

namespace EvaluacionQS.DataProvider
{
    public class VendedorDataProvider : IVendedorDataProvider
    {
        public IConfiguration _ConnectionString;

        public VendedorDataProvider(IConfiguration configuration)
        {
            _ConnectionString = configuration;
        }
        public async Task<IEnumerable<Vendedor>> GetVendedores()
        {
            using (var sqlConnection = new SqlConnection(_ConnectionString.GetSection("ConnectionString").GetSection("ConexionText").Value))
            {
                await sqlConnection.OpenAsync();
                return await sqlConnection.QueryAsync<Vendedor>(
                    "SPS_LISTAR_VENDEDOR_POR_ANIO",
                    null,
                    commandType: CommandType.StoredProcedure);
            }
        }
    }
}
