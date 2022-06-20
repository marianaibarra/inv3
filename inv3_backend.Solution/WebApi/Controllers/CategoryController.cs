// using Core.Models;
// using DataAccess.Data;
// using Microsoft.AspNetCore.Mvc;

// namespace inv3_backend.Controllers;

// [ApiController]
// [Route("api/v1/categories")]
// public class CController : ControllerBase
// {
//     private readonly ILogger<CategoryController> _categorylogger;

//     public CategoryController(ILogger<CategoryController> logger)
//     {
//         _categorylogger = logger;
//     }

//     // GET /categories
//     [HttpGet]
//     public async Task<ActionResult<Category>> GetCategories([FromServices] ICategoryData db)
//     {
//         _categorylogger.LogInformation("Category > GetCategories controller executing...");

//         try
//         {
//             return Ok(await db.GetCategories());
//         }
//         catch (Exception exception)
//         {
//             return Problem(exception.Message);
//         }
//     }

//     // GET /categories/{id}

//     [HttpGet("{id}")]
//     public async Task<ActionResult<Category>> GetOneCategory([FromRoute] int id, [FromServices] ICategoryData db)
//     {
//         _categorylogger.LogInformation("Categories > GetOneCategory controller executing...");

//         try
//         {
//             var result = await db.GetOneCategory(id);
//             if (result == null) return NotFound();
//             return Ok(result);
//         }
//         catch (Exception exception)
//         {
//             return Problem(exception.Message);
//         }
//     }

//     // POST /categories

//     [HttpPost]
//     [ProducesResponseType(StatusCodes.Status201Created)]
//     public async Task<ActionResult<Category>> PostCategory([FromBody] Category category, [FromServices] ICategoryData db)
//     {
//         _categorylogger.LogInformation("Categories > PostCategory controller executing...");

//         try
//         {
//             if (category == null) return BadRequest(new ArgumentNullException());
//             var result = await db.CreateCategory(category);
//             return Created(nameof(GetOneCategory), result);
//         }
//         catch (Exception exception)
//         {
//             return Problem(exception.Message);
//         }
//     }

//     /// <summary>
//     /// Completely modify a category.
//     /// </summary>

//     // PUT /categories/{id}
//     [HttpPut("{id}")]
//     [ProducesResponseType(StatusCodes.Status204NoContent)]
//     public async Task<ActionResult<Category>> PutCategory([FromRoute] int id, [FromBody] Category category, [FromServices] ICategoryData db)
//     {
//         _categorylogger.LogInformation("Categories > PutCategory controller executing...");

//         try
//         {
//             if (category == null) return BadRequest(new ArgumentNullException("Product was not provided"));
//             if (id != category.IdCategory) return BadRequest(new ArgumentException("Ids do not correspond"));
//             await db.UpdateCategory(category);
//             return NoContent();
//         }
//         catch (Exception exception)
//         {
//             return Problem(exception.Message);
//         }
//     }

//     // DELETE /categories/{id}
//     [HttpDelete("{id}")]
//     [ProducesResponseType(StatusCodes.Status204NoContent)]
//     public async Task<ActionResult<Category>> DeleteCategory([FromRoute] int id, [FromServices] ICategoryData db)
//     {
//         _categorylogger.LogInformation("Categories > DeleteCategory controller executing...");

//         try
//         {
//             await db.DeleteCategory(id);
//             return NoContent();
//         }
//         catch (Exception exception)
//         {
//             return Problem(exception.Message);
//         }
//     }
// }
