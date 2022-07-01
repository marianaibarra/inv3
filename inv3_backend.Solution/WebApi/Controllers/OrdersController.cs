using Core.Models;
using DataAccess.Data;
using Microsoft.AspNetCore.Mvc;

namespace inv3_backend.Controllers;

[ApiController]
[Route("api/[controller]")]
[ApiVersion("1.0")]
public class OrdersController : ControllerBase
{
    private readonly ILogger<OrdersController> _orderlogger;

    public OrdersController(ILogger<OrdersController> logger)
    {
        _orderlogger = logger;
    }

    // GET /orders
    [HttpGet]
    public async Task<ActionResult<Order>> GetOrder([FromServices] IOrderData db)
    {
        _orderlogger.LogInformation("Orders > GetOrder controller executing...");

        try
        {
            return Ok(await db.GetOrders());
        }
        catch (Exception exception)
        {
            return Problem(exception.Message);
        }
    }

    // GET /orders/{id}

    [HttpGet("{id}")]
    public async Task<ActionResult<Order>> GetOneOrder([FromRoute] int id, [FromServices] IOrderData db)
    {
        _orderlogger.LogInformation("Orders > GetOneOrder controller executing...");

        try
        {
            var result = await db.GetOneOrder(id);
            if (result == null) return NotFound();
            return Ok(result);
        }
        catch (Exception exception)
        {
            return Problem(exception.Message);
        }
    }

    // POST /orders

    [HttpPost]
    [ProducesResponseType(StatusCodes.Status201Created)]
    public async Task<ActionResult<Order>> PostOrder([FromBody] Order order, [FromServices] IOrderData db)
    {
        _orderlogger.LogInformation("Orders > PostOrder controller executing...");

        try
        {
            if (order == null) return BadRequest(new ArgumentNullException("order was not provided"));
            var result = await db.CreateOrder(order);
            return Created(nameof(GetOneOrder), result);
        }
        catch (Exception exception)
        {
            return Problem(exception.Message);
        }
    }

    /// <summary>
    /// Completely modify a product.
    /// </summary>

    // PUT /orders/{id}
    [HttpPut("{id}")]
    [ProducesResponseType(StatusCodes.Status204NoContent)]
    public async Task<ActionResult<Order>> PutOrder([FromRoute] int id, [FromBody] Order order, [FromServices] IOrderData db)
    {
        _orderlogger.LogInformation("Orders > PutOrder controller executing...");

        try
        {
            if (order == null) return BadRequest(new ArgumentNullException("Product was not provided"));
            if (id != order.IdOrder) return BadRequest(new ArgumentException("Ids do not correspond"));
            await db.UpdateOrder(order);
            return NoContent();
        }
        catch (Exception exception)
        {
            return Problem(exception.Message);
        }
    }

    // DELETE /orders/{id}
    [HttpDelete("{id}")]
    [ProducesResponseType(StatusCodes.Status204NoContent)]
    public async Task<ActionResult<Product>> DeleteOrder([FromRoute] int id, [FromServices] IOrderData db)
    {
        _orderlogger.LogInformation("Orders > DeleteOrder controller executing...");

        try
        {
            await db.DeleteOrder(id);
            return NoContent();
        }
        catch (Exception exception)
        {
            return Problem(exception.Message);
        }
    }
}
