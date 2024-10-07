using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using MySql.Data.MySqlClient;
using ProductAPI.Model;
using System.Diagnostics;
using System.Xml.Linq;

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
        public object Post(Product product)
        {
            conn.Connection.Open();

            try
            {
                string sql = @"INSERT INTO products (Id, Name, Price, CreatedTime) VALUES (@Id, @Name, @Price, @CreatedTime);";
                using (MySqlCommand cmd = new MySqlCommand(sql, conn.Connection))
                {
                    cmd.Parameters.AddWithValue("@Id", product.Id);
                    cmd.Parameters.AddWithValue("@Name", product.Name);
                    cmd.Parameters.AddWithValue("@Price", product.Price);
                    cmd.Parameters.AddWithValue("@CreatedTime", product.CreatedTime);

                    cmd.ExecuteNonQuery();
                }

                return Ok(new { message = "Product inserted successfully." });
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

        [HttpPut]
        public object Put(Product product)
        {
            conn.Connection.Open();

            try
            {
                string sql = @"UPDATE products SET Name = @Name, Price = @Price, CreatedTime = @CreatedTime WHERE Id = @Id;";
                using (MySqlCommand cmd = new MySqlCommand(sql, conn.Connection))
                {
                    cmd.Parameters.AddWithValue("@Id", product.Id);
                    cmd.Parameters.AddWithValue("@Name", product.Name);
                    cmd.Parameters.AddWithValue("@Price", product.Price);
                    cmd.Parameters.AddWithValue("@CreatedTime", product.CreatedTime);

                    cmd.ExecuteNonQuery();
                }

                return Ok(new { message = "Product updated successfully." });
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
        public object Delete(Guid id)
        {
            conn.Connection.Open();

            try
            {
                string sql = @"DELETE FROM products WHERE Id = @Id;";
                using (MySqlCommand cmd = new MySqlCommand(sql, conn.Connection))
                {
                    cmd.Parameters.AddWithValue("@Id", id);

                    cmd.ExecuteNonQuery();
                }

                return Ok(new { message = "Product deleted successfully." });
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
