using Core.Models;
using DataAccess.Data;
using Microsoft.AspNetCore.Mvc;

namespace inv3_backend.Controllers;

[ApiController]
[Route("api/v1/[controller]")]
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
    public async Task<ActionResult<Bussiness>> GetBusinessses()
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
    public async Task<ActionResult<Bussiness>> GetOneBussiness([FromRoute] int id)
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

    [HttpPost]
    [ProducesResponseType(StatusCodes.Status201Created)]
    public async Task<ActionResult<Bussiness>> PostBussiness([FromBody] Bussiness bussiness)
    {
        // _loggerBussiness.LogInformation("Bussiness > PostBussiness controller executing...");

        try
        {
            if (bussiness == null) return BadRequest(new ArgumentNullException());
            var result = await _db.CreateBussiness(bussiness);
            // TODO:
            // - see how it changes with CreatedAtRoute mehod (name, id, object)
            return Created(nameof(GetOneBussiness), result);
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
    public async Task<ActionResult<Bussiness>> PutBussiness([FromRoute] int id, [FromBody] Bussiness bussiness)
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
    [HttpDelete("{id}")]
    [ProducesResponseType(StatusCodes.Status204NoContent)]
    public async Task<ActionResult<Bussiness>> DeleteBussiness([FromRoute] int id)
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
