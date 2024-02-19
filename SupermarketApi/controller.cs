[ApiController]
[Route("api/[controller]")]
public class ProductsController : ControllerBase
{
    private readonly List<Product> _products = new List<Product>
    {
        new Product { Id = 1, Name = "Apple", Price = 1.99m },
        new Product { Id = 2, Name = "Banana", Price = 0.99m },
        // Add more products
    };

    [HttpGet]
    public ActionResult<IEnumerable<Product>> Get()
    {
        return _products;
    }

    // Implement other CRUD operations (POST, PUT, DELETE) as needed
}
