using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using MySql.Data.MySqlClient;
using MySqlX.XDevAPI.Common;
using ProductAPI.Model;
using System.Diagnostics;
using System.Xml.Linq;
using static ProductAPI.DTOs.DTO;

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
        public ActionResult<Product> Post(CreateProductDTO product)
        {
            Product result = new Product
            {
                Id = Guid.NewGuid(),
                Name = product.Name,
                Price = product.Price,
                CreatedTime = DateTime.Now,
            };

            conn.Connection.Open();

            try
            {
                string sql = @"INSERT INTO products (Id, Name, Price, CreatedTime) VALUES (@Id, @Name, @Price, @CreatedTime);";
                using (MySqlCommand cmd = new MySqlCommand(sql, conn.Connection))
                {
                    cmd.Parameters.AddWithValue("@Id", result.Id);
                    cmd.Parameters.AddWithValue("@Name", result.Name);
                    cmd.Parameters.AddWithValue("@Price", result.Price);
                    cmd.Parameters.AddWithValue("@CreatedTime", result.CreatedTime);

                    cmd.ExecuteNonQuery();
                }

                return StatusCode(201, new { message = "Product inserted successfully." });
            }
            catch (Exception ex)
            {
                return StatusCode(500, new { message = $"An error occurred while inserting the product. {ex.Message}" });
            }
            finally
            {
                conn.Connection.Close();
            }
        }

        [HttpPut("id")]
        public ActionResult<Product> Put(Guid id, UpdateProductDTO product)
        {
            conn.Connection.Open();

            try
            {
                string sql = @"UPDATE `products` SET `Name` = @Name, `Price` = @Price WHERE `Id` = @Id;";
                using (MySqlCommand cmd = new MySqlCommand(sql, conn.Connection))
                {
                    cmd.Parameters.AddWithValue("@Name", product.Name);
                    cmd.Parameters.AddWithValue("@Price", product.Price);
                    cmd.Parameters.AddWithValue("@Id", id);

                    cmd.ExecuteNonQuery();
                }

                return StatusCode(201, new { Id = id, Name = product.Name, Price = product.Price });
            }
            catch (Exception ex)
            {
                return StatusCode(500, new { message = $"An error occurred while updating the product. {ex.Message}" });
            }
            finally
            {
                conn.Connection.Close();
            }
        }

        [HttpDelete]
        public ActionResult<Product> Delete(DeleteProductDTO product)
        {
            conn.Connection.Open();

            try
            {
                string sql = @"DELETE FROM products WHERE Id = @Id;";
                using (MySqlCommand cmd = new MySqlCommand(sql, conn.Connection))
                {
                    cmd.Parameters.AddWithValue("@Id", product.Id);

                    cmd.ExecuteNonQuery();
                }

                return StatusCode(202, new { message = "Product deleted successfully." });
            }
            catch (Exception ex)
            {
                return StatusCode(500, new { message = $"An error occurred while deleting the product. {ex.Message}" });
            }
            finally
            {
                conn.Connection.Close();
            }
        }
    }
}
