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

        [HttpPost]
        public object Post(string id, string name, int price, string createdTime)
        {
            conn.Connection.Open();

            try
            {
                string sql = @"INSERT INTO products (Id, Name, Price, CreatedTime) VALUES (@Id, @Name, @Price, @CreatedTime);";
                using (MySqlCommand cmd = new MySqlCommand(sql, conn.Connection))
                {
                    cmd.Parameters.AddWithValue("@Id", id);
                    cmd.Parameters.AddWithValue("@Name", name);
                    cmd.Parameters.AddWithValue("@Price", price);
                    cmd.Parameters.AddWithValue("@CreatedTime", createdTime);

                    cmd.ExecuteNonQuery();
                }

                return Ok(new { message = "Product inserted successfully." });
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
                return StatusCode(500, new { message = "An error occurred while inserting the product." });
            }
            finally
            {
                conn.Connection.Close();
            }
        }

        [HttpPut]
        public void Put()
        {

        }

        [HttpDelete]
        public void Delete()
        {

        }
    }
}
