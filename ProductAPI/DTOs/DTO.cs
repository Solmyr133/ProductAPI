namespace ProductAPI.DTOs
{
    public class DTO
    {
        public record ProductDTO(Guid Id, string Name, int Price, DateTime CreatedTime);
        public record UpdateProductDTO(string Name, int Price);
        public record DeleteProductDTO(Guid Id);
        public record CreateProductDTO(string Name, int Price);
    }
}
