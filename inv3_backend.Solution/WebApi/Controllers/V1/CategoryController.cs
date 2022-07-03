using Core.Models;
using DataAccess.Data;
using Microsoft.AspNetCore.Mvc;

namespace inv3_backend.Controllers.V1;

[ApiController]
[Route("api/[Controller]")]
[ApiVersion("1.0")]
public class CategoriesController : ControllerBase
{
    private readonly ILogger<CategoriesController> _categorylogger;

    public CategoriesController(ILogger<CategoriesController> logger)
    {
        _categorylogger = logger;
    }

    // GET /categories
    [HttpGet]
    public async Task<ActionResult<Category>> GetCategoriesV1([FromServices] ICategoryData db)
    {
        _categorylogger.LogInformation("Category > GetCategories controller executing...");

        try
        {
            return Ok(await db.GetCategories());
        }
        catch (Exception exception)
        {
            return Problem(exception.Message);
        }
    }

    // GET /categories/{id}

    [HttpGet("{id}")]
    public async Task<ActionResult<Category>> GetOneCategoryV1([FromRoute] int id, [FromServices] ICategoryData db)
    {
        _categorylogger.LogInformation("Categories > GetOneCategory controller executing...");

        try
        {
            var result = await db.GetOneCategory(id);
            if (result == null) return NotFound();
            return Ok(result);
        }
        catch (Exception exception)
        {
            return Problem(exception.Message);
        }
    }

    // POST /categories

    [HttpPost]
    [ProducesResponseType(StatusCodes.Status201Created)]
    public async Task<ActionResult<Category>> PostCategoryV1([FromBody] Category category, [FromServices] ICategoryData db)
    {
        _categorylogger.LogInformation("Categories > PostCategory controller executing...");

        try
        {
            if (category == null) return BadRequest(new ArgumentNullException());
            var result = await db.CreateCategory(category);
            return Created(nameof(GetOneCategoryV1), result);
        }
        catch (Exception exception)
        {
            return Problem(exception.Message);
        }
    }

    /// <summary>
    /// Completely modify a category.
    /// </summary>

    // PUT /categories/{id}
    [HttpPut("{id}")]
    [ProducesResponseType(StatusCodes.Status204NoContent)]
    public async Task<ActionResult<Category>> PutCategoryV1([FromRoute] int id, [FromBody] Category category, [FromServices] ICategoryData db)
    {
        _categorylogger.LogInformation("Categories > PutCategory controller executing...");

        try
        {
            if (category == null) return BadRequest(new ArgumentNullException("Product was not provided"));
            if (id != category.IdCategory) return BadRequest(new ArgumentException("Ids do not correspond"));
            await db.UpdateCategory(category);
            return NoContent();
        }
        catch (Exception exception)
        {
            return Problem(exception.Message);
        }
    }

    // DELETE /categories/{id}
    [HttpDelete("{id}")]
    [ProducesResponseType(StatusCodes.Status204NoContent)]
    public async Task<ActionResult<Category>> DeleteCategoryV1([FromRoute] int id, [FromServices] ICategoryData db)
    {
        _categorylogger.LogInformation("Categories > DeleteCategory controller executing...");

        try
        {
            await db.DeleteCategory(id);
            return NoContent();
        }
        catch (Exception exception)
        {
            return Problem(exception.Message);
        }
    }
}
