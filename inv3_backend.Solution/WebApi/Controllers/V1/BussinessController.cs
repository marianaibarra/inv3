using Core.Models;
using DataAccess.Data;
using Microsoft.AspNetCore.Mvc;

namespace inv3_backend.Controllers.V1;

[ApiController]
[Route("api/[controller]")]
[ApiVersion("1.0")]
[Produces("application/json")]
public class BussinessController : ControllerBase
{
    // private readonly ILogger<BussinessController>? _loggerBussiness;
    private readonly IBussinessData _db;

    public BussinessController(IBussinessData db)
    {
        // _loggerBussiness = logger;
        _db = db;
    }

    // GET /bussiness
    [HttpGet]
    public async Task<ActionResult<Bussiness>> GetBusinesssesV1()
    {
        // _loggerBussiness.LogInformation("Bussiness > GetBusinessses controller executing...");

        try
        {
            return Ok(await _db.GetBussinesses());
        }
        catch (Exception exception)
        {
            return Problem(exception.Message);
        }
    }

    // GET /bussiness/{id}

    [HttpGet("{id}", Name = "GetOneBussiness")]
    public async Task<ActionResult<Bussiness>> GetOneBussinessV1([FromRoute] int id)
    {
        // _loggerBussiness.LogInformation("Bussiness > GetOneBussiness controller executing...");

        try
        {
            var result = await _db.GetOneBussiness(id);
            if (result == null) return NotFound();
            return Ok(result);
        }
        catch (Exception exception)
        {
            return Problem(exception.Message);
        }
    }

    // POST /bussiness
    /// <summary>
    /// Creates a bussiness.
    /// </summary>
    /// <param name="bussiness"></param>
    /// <returns>A newly created bussiness</returns>
    /// <remarks>
    /// Sample request:
    ///
    ///     POST /bussiness
    ///     {
    ///        
    ///         NameBussiness : "Open API", 
    ///         IdOwner : 1
    ///
    ///     }
    ///
    /// </remarks>
    /// <response code="201">Returns the newly created bussiness</response>
    /// <response code="400">If the bussiness is null</response>
    [HttpPost]
    [ProducesResponseType(StatusCodes.Status201Created)]
    [ProducesResponseType(StatusCodes.Status400BadRequest)]
    public async Task<ActionResult<Bussiness>> PostBussinessV1([FromBody] Bussiness bussiness)
    {
        // _loggerBussiness.LogInformation("Bussiness > PostBussiness controller executing...");

        try
        {
            if (bussiness == null) return BadRequest(new ArgumentNullException());
            var result = await _db.CreateBussiness(bussiness);
            return Created(nameof(GetOneBussinessV1), result);
        }
        catch (Exception exception)
        {
            return Problem(exception.Message);
        }
    }

    /// <summary>
    /// Completely modify a bussiness.
    /// </summary>

    // PUT /bussiness/{id}
    [HttpPut("{id}")]
    [ProducesResponseType(StatusCodes.Status204NoContent)]
    public async Task<ActionResult<Bussiness>> PutBussinessV1([FromRoute] int id, [FromBody] Bussiness bussiness)
    {
        // _loggerBussiness.LogInformation("Bussiness > PutBussiness controller executing...");

        try
        {
            if (bussiness == null) return BadRequest(new ArgumentNullException());
            if (id != bussiness.IdBussiness) return BadRequest(new ArgumentNullException("Ids do not correspond"));
            await _db.UpdateBussiness(bussiness);
            return NoContent();
        }
        catch (Exception exception)
        {
            return Problem(exception.Message);
        }
    }

    // DELETE /bussinesss/{id}
    /// <summary>
    /// Deletes specified bussiness
    /// </summary>
    /// <param name="id"></param>
    [HttpDelete("{id}")]
    [ProducesResponseType(StatusCodes.Status204NoContent)]
    public async Task<ActionResult<Bussiness>> DeleteBussinessV1([FromRoute] int id)
    {
        // _loggerBussiness.LogInformation("Bussinesss > DeleteBussiness controller executing...");

        try
        {
            await _db.DeleteBussiness(id);
            return NoContent();
        }
        catch (Exception exception)
        {
            return Problem(exception.Message);
        }
    }
}
