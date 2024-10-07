namespace ProductAPI.DTOs
{
    public class DTO
    {
        public record ProductDTO(Guid Id, string Name, int Price, DateTime CreatedTime);
        public record UpdateDTO(Guid Id, string Name, int Price);
        public record DeleteDTO(Guid Id);
        public record CreateProductDTO(string Name, int Price);
    }
}
