using Core.Models;
using DataAccess.Data;
using Microsoft.AspNetCore.Mvc;

[ApiController]
[Route("api/[Controller]")]
[ApiVersion("1.0")]
public class SalesController : ControllerBase
{
    private readonly ILogger<SalesController> _saleslogger;
    public SalesController(ILogger<SalesController> logger)
    {
        _saleslogger = logger;
    }

    // GET /sales
    [HttpGet]
    public async Task<ActionResult<Sale>> GetSales([FromServices] ISaleData db)
    {
        _saleslogger.LogInformation("Sales > GetSales controller executing...");

        try
        {
            return Ok(await db.GetSales());
        }
        catch (Exception exception)
        {
            return Problem(exception.Message);
        }
    }

    // GET /sales/{id}

    [HttpGet("{id}")]
    public async Task<ActionResult<Sale>> GetOneSale([FromRoute] int id, [FromServices] ISaleData db)
    {
        _saleslogger.LogInformation("Sales > GetOneSale controller executing...");

        try
        {
            var result = await db.GetOneSale(id);
            if (result == null) return NotFound();
            return Ok(result);
        }
        catch (Exception exception)
        {
            return Problem(exception.Message);
        }
    }

    // POST /sales

    [HttpPost]
    [ProducesResponseType(StatusCodes.Status201Created)]
    public async Task<ActionResult<Sale>> PostSale([FromBody] Sale sale, [FromServices] ISaleData db)
    {
        _saleslogger.LogInformation("Sales > PostSale controller executing...");

        try
        {
            if (sale == null) return BadRequest(new ArgumentNullException("sale was not provided"));
            var result = await db.CreateSale(sale);
            return Created(nameof(GetOneSale), result);
        }
        catch (Exception exception)
        {
            return Problem(exception.Message);
        }
    }

    /// <summary>
    /// Completely modify a sale.
    /// </summary>

    // PUT /sales/{id}
    [HttpPut("{id}")]
    [ProducesResponseType(StatusCodes.Status204NoContent)]
    public async Task<ActionResult<Sale>> PutSale([FromRoute] int id, [FromBody] Sale sale, [FromServices] ISaleData db)
    {
        _saleslogger.LogInformation("Sales > PutSale controller executing...");

        try
        {
            if (sale == null) return BadRequest(new ArgumentNullException("Sale was not provided"));
            if (id != sale.IdSale) return BadRequest(new ArgumentException("Ids do not correspond"));
            await db.UpdateSale(sale);
            return NoContent();
        }
        catch (Exception exception)
        {
            return Problem(exception.Message);
        }
    }

    // DELETE /sales/{id}
    [HttpDelete("{id}")]
    [ProducesResponseType(StatusCodes.Status204NoContent)]
    public async Task<ActionResult<Sale>> DeleteSale([FromRoute] int id, [FromServices] ISaleData db)
    {
        _saleslogger.LogInformation("Sales > DeleteSale controller executing...");

        try
        {
            await db.DeleteSale(id);
            return NoContent();
        }
        catch (Exception exception)
        {
            return Problem(exception.Message);
        }
    }
}