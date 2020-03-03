using Dapper;
using EvaluacionQS.Models;
using Microsoft.Extensions.Configuration;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Threading.Tasks;

namespace EvaluacionQS.DataProvider
{
    public class ProductoDataProvider : IProductoDataProvider
    {
        public IConfiguration _ConnectionString;

        //private readonly string connectionString = 
        public ProductoDataProvider(IConfiguration configuration)
        {
            _ConnectionString = configuration;
        }

        public async Task<IEnumerable<Producto>> GetProductos()
        {
            using (var sqlConnection = new SqlConnection(_ConnectionString.GetSection("ConnectionString").GetSection("ConexionText").Value))
            {
                await sqlConnection.OpenAsync();
                return await sqlConnection.QueryAsync<Producto>(
                    "SPS_LISTA_PRODUCTOS",
                    null,
                    commandType: CommandType.StoredProcedure);
            }
        }
    }
}
