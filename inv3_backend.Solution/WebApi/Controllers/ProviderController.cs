using Core.Models;
using DataAccess.Data;
using Microsoft.AspNetCore.Mvc;

namespace inv3_backend.Controllers;

[ApiController]
[Route("api/v1/[Controller]")]
public class ProvidersController : ControllerBase
{
    private readonly ILogger<ProvidersController> _providerlogger;

    public ProvidersController(ILogger<ProvidersController> logger)
    {
        _providerlogger = logger;
    }

    // GET /providers
    [HttpGet]
    public async Task<ActionResult<Provider>> GetProviders([FromServices] IProviderData db)
    {
        _providerlogger.LogInformation("Providers > GetProvider controller executing...");

        try
        {
            return Ok(await db.GetProviders());
        }
        catch (Exception exception)
        {

            return Problem(exception.Message);
        }
    }

    // GET /providers/{id}
    [HttpGet("{id}")]
    public async Task<ActionResult<Provider>> GetOneProvider([FromRoute] int id, IProviderData db)
    {
        _providerlogger.LogInformation("Providers > GetOneProvider controller executing...");

        try
        {
            var result = await db.GetOneProvider(id);
            if (result == null) return NotFound();
            return Ok(result);
        }
        catch (Exception exception)
        {
            return Problem(exception.Message);
        }
    }

    // POST /providers

    [HttpPost]
    [ProducesResponseType(StatusCodes.Status201Created)]
    public async Task<ActionResult<Provider>> PostProvider([FromBody] Provider provider, [FromServices] IProviderData db)
    {
        _providerlogger.LogInformation("Providers > PostProvider controller executing...");

        try
        {
            if (provider == null) return BadRequest(new ArgumentNullException("provider was not provided"));
            var result = await db.CreateProvider(provider);
            return Created(nameof(GetOneProvider), result);
        }
        catch (Exception exception)
        {
            return Problem(exception.Message);
        }
    }

    /// <summary>
    /// Completely modify a provider.
    /// </summary>

    // PUT /providers/{id}
    [HttpPut("{id}")]
    [ProducesResponseType(StatusCodes.Status204NoContent)]
    public async Task<ActionResult<Provider>> PutProvider([FromRoute] int id, [FromBody] Provider provider, [FromServices] IProviderData db)
    {
        _providerlogger.LogInformation("Providers > PutProvider controller executing...");

        try
        {
            if (provider == null) return BadRequest(new ArgumentNullException("provider was not provided"));
            if (id != provider.IdProvider) return BadRequest(new ArgumentException("Ids do not correspond"));
            await db.UpdateProvider(provider);
            return NoContent();
        }
        catch (Exception exception)
        {
            return Problem(exception.Message);
        }
    }

    // DELETE /providers/{id}
    [HttpDelete("{id}")]
    [ProducesResponseType(StatusCodes.Status204NoContent)]
    public async Task<ActionResult<Provider>> DeleteProvider([FromRoute] int id, [FromServices] IProviderData db)
    {
        _providerlogger.LogInformation("Providers > DeleteProvider controller executing...");

        try
        {
            await db.DeleteProvider(id);
            return NoContent();
        }
        catch (Exception exception)
        {
            return Problem(exception.Message);
        }
    }
}