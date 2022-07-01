using Core.Models;
using DataAccess.Data;
using Microsoft.AspNetCore.Mvc;

[ApiController]
[Route("api/v1/[Controller]")]
public class OwnersController : ControllerBase
{
    private readonly ILogger<OwnersController> _ownerslogger;
    private readonly IOwnerData _db;

    public OwnersController(ILogger<OwnersController> logger, IOwnerData db)
    {
        _ownerslogger = logger;
        _db = db;
    }

    // GET /owners
    [HttpGet]
    public async Task<ActionResult<Owner>> GetOwners()
    {
        _ownerslogger.LogInformation("Owners > GetOwners controller executing...");

        try
        {
            return Ok(await _db.GetOwners());
        }
        catch (Exception exception)
        {
            return Problem(exception.Message);
        }
    }

    // GET /owners/{id}

    [HttpGet("{id}")]
    public async Task<ActionResult<Owner>> GetOneOwner([FromRoute] int id)
    {
        _ownerslogger.LogInformation("Owners > GetOneOwner controller executing...");

        try
        {
            var result = await _db.GetOneOwner(id);
            if (result == null) return NotFound();
            return Ok(result);
        }
        catch (Exception exception)
        {
            return Problem(exception.Message);
        }
    }

    // POST /owners

    [HttpPost]
    [ProducesResponseType(StatusCodes.Status201Created)]
    public async Task<ActionResult<Owner>> PostOwner([FromBody] Owner owner)
    {
        _ownerslogger.LogInformation("Owners > PostOwner controller executing...");

        try
        {
            if (owner == null) return BadRequest(new ArgumentNullException("owner was not provided"));
            var result = await _db.CreateOwner(owner);
            return Created(nameof(GetOneOwner), result);
        }
        catch (Exception exception)
        {
            return Problem(exception.Message);
        }
    }

    /// <summary>
    /// Completely modify a owner.
    /// </summary>

    // PUT /owners/{id}
    [HttpPut("{id}")]
    [ProducesResponseType(StatusCodes.Status204NoContent)]
    public async Task<ActionResult<Owner>> PutOwner([FromRoute] int id, [FromBody] Owner owner)
    {
        _ownerslogger.LogInformation("Owners > PutOwner controller executing...");

        try
        {
            if (owner == null) return BadRequest(new ArgumentNullException("Owner was not provided"));
            if (id != owner.IdOwner) return BadRequest(new ArgumentException("Ids do not correspond"));
            await _db.UpdateOwner(owner);
            return NoContent();
        }
        catch (Exception exception)
        {
            return Problem(exception.Message);
        }
    }

    // DELETE /owners/{id}
    [HttpDelete("{id}")]
    [ProducesResponseType(StatusCodes.Status204NoContent)]
    public async Task<ActionResult<Owner>> DeleteOwner([FromRoute] int id)
    {
        _ownerslogger.LogInformation("Owners > DeleteOwner controller executing...");

        try
        {
            await _db.DeleteOwner(id);
            return NoContent();
        }
        catch (Exception exception)
        {
            return Problem(exception.Message);
        }
    }
}