using Core.Models;
using DataAccess.Data;
using Microsoft.AspNetCore.Mvc;

namespace inv3_backend.Controllers;

[ApiController]
[Route("api/[controller]")]
[ApiVersion("1.0")]
public class ClientsController : ControllerBase
{
    private readonly ILogger<ClientsController> _clientslogger;

    public ClientsController(ILogger<ClientsController> logger)
    {
        _clientslogger = logger;
    }

    // GET /clients
    [HttpGet]
    public async Task<ActionResult<Client>> GetClients([FromServices] IClientData db)
    {
        _clientslogger.LogInformation("Clients > GetClients controller executing...");

        try
        {
            return Ok(await db.GetClients());
        }
        catch (Exception exception)
        {
            return Problem(exception.Message);
        }
    }

    // GET /clients/{id}

    [HttpGet("{id}")]
    public async Task<ActionResult<Client>> GetOneClient([FromRoute] int id, [FromServices] IClientData db)
    {
        _clientslogger.LogInformation("Clients > GetOneClient controller executing...");

        try
        {
            var result = await db.GetOneClient(id);
            if (result == null) return NotFound();
            return Ok(result);
        }
        catch (Exception exception)
        {
            return Problem(exception.Message);
        }
    }

    // POST /clients

    [HttpPost]
    [ProducesResponseType(StatusCodes.Status201Created)]
    public async Task<ActionResult<Client>> PostClient([FromBody] Client client, [FromServices] IClientData db)
    {
        _clientslogger.LogInformation("Clients > PostClient controller executing...");

        try
        {
            if (client == null) return BadRequest(new ArgumentNullException("client was not provided"));
            var result = await db.CreateClient(client);
            return Created(nameof(GetOneClient), result);
        }
        catch (Exception exception)
        {
            return Problem(exception.Message);
        }
    }

    /// <summary>
    /// Completely modify a product.
    /// </summary>

    // PUT /clients/{id}
    [HttpPut("{id}")]
    [ProducesResponseType(StatusCodes.Status204NoContent)]
    public async Task<ActionResult<Client>> PutClient([FromRoute] int id, [FromBody] Client client, [FromServices] IClientData db)
    {
        _clientslogger.LogInformation("Clients > PutClient controller executing...");

        try
        {
            if (client == null) return BadRequest(new ArgumentNullException("Product was not provided"));
            if (id != client.IdClient) return BadRequest(new ArgumentException("Ids do not correspond"));
            await db.UpdateClient(client);
            return NoContent();
        }
        catch (Exception exception)
        {
            return Problem(exception.Message);
        }
    }

    // DELETE /clients/{id}
    [HttpDelete("{id}")]
    [ProducesResponseType(StatusCodes.Status204NoContent)]
    public async Task<ActionResult<Client>> DeleteClient([FromRoute] int id, [FromServices] IClientData db)
    {
        _clientslogger.LogInformation("Clients > DeleteClient controller executing...");

        try
        {
            await db.DeleteClient(id);
            return NoContent();
        }
        catch (Exception exception)
        {
            return Problem(exception.Message);
        }
    }
}
