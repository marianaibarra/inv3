using Core.Models;
using DataAccess.Data;
using Microsoft.AspNetCore.Mvc;

namespace inv3_backend.Controllers;

[ApiController]
[Route("api/v1/[controller]")]
public class ProductsController : ControllerBase
{
    private readonly ILogger<ProductsController> _logger;

    public ProductsController(ILogger<ProductsController> logger)
    {
        _logger = logger;
    }

    // GET /products
    [HttpGet]
    public async Task<ActionResult<Product>> GetProducts([FromServices] IProductData db)
    {
        _logger.LogInformation("Products > GetProducts controller executing...");
        
        try
        {
            return Ok(await db.GetProducts());
        }
        catch (Exception exception)
        {
            return Problem(exception.Message);
        }
    }

    // GET /products/{id}

    [HttpGet("{id}")]
    public async Task<ActionResult<Product>> GetOneProduct([FromRoute] int id, [FromServices] IProductData db)
    {
        _logger.LogInformation("Products > GetOneProduct controller executing...");
        
        try
        {
            var result = await db.GetOneProduct(id);
            if (result == null) return NotFound();
            return Ok(result);
        }
        catch (Exception exception)
        {
            return Problem(exception.Message);
        }
    }

    // POST /products

    [HttpPost]
    [ProducesResponseType(StatusCodes.Status201Created)]
    public async Task<ActionResult<Product>> PostProduct([FromBody] Product product, [FromServices] IProductData db)
    {
        _logger.LogInformation("Products > PostProduct controller executing...");

        try
        {
            if (product == null) return BadRequest(new ArgumentNullException());
            var result = await db.CreateProduct(product);
            return CreatedAtAction(nameof(GetOneProduct), new { result.IdProduct }, result);
        }
        catch (Exception exception)
        {
            return Problem(exception.Message);
        }
    }

    /// <summary>
    /// Completely modify a product.
    /// </summary>
    [HttpPut("{id}")]
    [ProducesResponseType(StatusCodes.Status204NoContent)]
    public async Task<ActionResult<Product>> PutProduct([FromRoute] int id, [FromBody] Product product, [FromServices] IProductData db)
    {
        _logger.LogInformation("Products > PutProduct controller executing...");

        try
        {
            if (product == null) return BadRequest("Product was not provided");
            if (id != product.IdProduct) return BadRequest("Ids do not correspond");
            await db.updateProduct(product);
            return NoContent();
        }
        catch (Exception exception)
        {
            return Problem(exception.Message);
        }
    }

    // DELETE /products/{id}
    [HttpDelete("{id}")]
    [ProducesResponseType(StatusCodes.Status204NoContent)]
    public async Task<ActionResult<Product>> DeleteProduct([FromRoute] int id, [FromServices] IProductData db)
    {
        _logger.LogInformation("Products > DeleteProduct controller executing...");

        try
        {
            await db.deleteProduct(id);
            return NoContent();
        }
        catch (Exception exception)
        {
            return Problem(exception.Message);
        }
    }
}
