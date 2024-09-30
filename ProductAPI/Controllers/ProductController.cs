using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using MySql.Data.MySqlClient;
using ProductAPI.Model;
using System.Diagnostics;

namespace ProductAPI.Controllers
{
    [Route("product")]
    [ApiController]
    public class ProductController : ControllerBase
    {
        static Connect conn = new Connect();

        [HttpGet]
        public object Get()
        {
            conn.Connection.Open();

            string sql = "SELECT * FROM products;";
            MySqlCommand cmd = new MySqlCommand(sql, conn.Connection);

            MySqlDataReader dr = cmd.ExecuteReader();

            dr.Read();

            List<Product> products = new List<Product>();

            do
            {
                Product currentProduct = new Product();

                currentProduct.Id = dr.GetGuid(0);
                currentProduct.Name = dr.GetString(1);
                currentProduct.Price = dr.GetInt32(2);
                currentProduct.CreatedTime = dr.GetDateTime(3);

                products.Add(currentProduct);
            } while (dr.Read());

            conn.Connection.Close();

            return new { products };
        }
    }
}
