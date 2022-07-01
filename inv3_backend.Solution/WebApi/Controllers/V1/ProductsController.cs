using Core.Models;
using DataAccess.Data;
using Microsoft.AspNetCore.Mvc;

namespace inv3_backend.Controllers;

[ApiController]
[Route("api/[controller]")]
[ApiVersion("1.0")]
public class ProductsController : ControllerBase
{
    private readonly ILogger<ProductsController> _loggerProduct;

    public ProductsController(ILogger<ProductsController> logger)
    {
        _loggerProduct = logger;
    }

    // GET /products
    [HttpGet]
    public async Task<ActionResult<Product>> GetProducts([FromServices] IProductData db)
    {
        _loggerProduct.LogInformation("Products > GetProducts controller executing...");

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
        _loggerProduct.LogInformation("Products > GetOneProduct controller executing...");

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
        _loggerProduct.LogInformation("Products > PostProduct controller executing...");

        try
        {
            if (product == null) return BadRequest(new ArgumentNullException());
            var result = await db.CreateProduct(product);
            return Created(nameof(GetOneProduct), result);
        }
        catch (Exception exception)
        {
            return Problem(exception.Message);
        }
    }

    /// <summary>
    /// Completely modify a product.
    /// </summary>

    // PUT /products/{id}

    [HttpPut("{id}")]
    [ProducesResponseType(StatusCodes.Status204NoContent)]
    public async Task<ActionResult<Product>> PutProduct([FromRoute] int id, [FromBody] Product product, [FromServices] IProductData db)
    {
        _loggerProduct.LogInformation("Products > PutProduct controller executing...");

        try
        {
            if (product == null) return BadRequest(new ArgumentNullException("Product was not provided"));
            if (id != product.IdProduct) return BadRequest(new ArgumentNullException("Ids do not correspond"));
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
        _loggerProduct.LogInformation("Products > DeleteProduct controller executing...");

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
