using Dapper;
using EvaluacionQS.Models;
using Microsoft.Extensions.Configuration;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Threading.Tasks;

namespace EvaluacionQS.DataProvider
{

    public class ClienteDataProvider : IClienteDataProvider
    {
        public IConfiguration _ConnectionString;

        public ClienteDataProvider(IConfiguration configuration)
        {
            _ConnectionString = configuration;
        }

        public async Task<IEnumerable<Cliente>> GetClientes()
        {
            using (var sqlConnection = new SqlConnection(_ConnectionString.GetSection("ConnectionString").GetSection("ConexionText").Value ))
            {
                await sqlConnection.OpenAsync();
                return await sqlConnection.QueryAsync<Cliente>(
                    "SPS_LISTA_CLIENTES_A",
                    null,
                    commandType: CommandType.StoredProcedure);
            }
        }
    }

}
