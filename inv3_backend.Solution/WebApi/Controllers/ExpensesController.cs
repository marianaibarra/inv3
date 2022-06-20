using Core.Models;
using DataAccess.Data;
using Microsoft.AspNetCore.Mvc;

namespace inv3_backend.Controllers;

[ApiController]
[Route("api/v1/[controller]")]
public class ExpensesController : ControllerBase
{
    private readonly ILogger<ExpensesController> _expenseslogger;

    public ExpensesController(ILogger<ExpensesController> logger)
    {
        _expenseslogger = logger;
    }

    // GET /expenses
    [HttpGet]
    public async Task<ActionResult<Expense>> GetExpenses([FromServices] IExpenseData db)
    {
        _expenseslogger.LogInformation("Expenses > GetExpenses controller executing...");

        try
        {
            return Ok(await db.GetExpenses());
        }
        catch (Exception exception)
        {
            return Problem(exception.Message);
        }
    }

    // GET /expenses/{id}

    [HttpGet("{id}")]
    public async Task<ActionResult<Expense>> GetOneExpense([FromRoute] int id, [FromServices] IExpenseData db)
    {
        _expenseslogger.LogInformation("Expenses > GetOneExpense controller executing...");

        try
        {
            var result = await db.GetOneExpense(id);
            if (result == null) return NotFound();
            return Ok(result);
        }
        catch (Exception exception)
        {
            return Problem(exception.Message);
        }
    }

    // POST /expenses

    [HttpPost]
    [ProducesResponseType(StatusCodes.Status201Created)]
    public async Task<ActionResult<Expense>> PostExpense([FromBody] Expense expense, [FromServices] IExpenseData db)
    {
        _expenseslogger.LogInformation("Expenses > PostExpense controller executing...");

        try
        {
            if (expense == null) return BadRequest(new ArgumentNullException("expense was not provided"));
            var result = await db.CreateExpense(expense);
            return Created(nameof(GetOneExpense), result);
        }
        catch (Exception exception)
        {
            return Problem(exception.Message);
        }
    }

    /// <summary>
    /// Completely modify a product.
    /// </summary>

    // PUT /expenses/{id}
    [HttpPut("{id}")]
    [ProducesResponseType(StatusCodes.Status204NoContent)]
    public async Task<ActionResult<Expense>> PutExpense([FromRoute] int id, [FromBody] Expense expense, [FromServices] IExpenseData db)
    {
        _expenseslogger.LogInformation("Expeneses > PutExpense controller executing...");

        try
        {
            if (expense == null) return BadRequest(new ArgumentNullException("Product was not provided"));
            if (id != expense.IdExpense) return BadRequest(new ArgumentException("Ids do not correspond"));
            await db.UpdateExpense(expense);
            return NoContent();
        }
        catch (Exception exception)
        {
            return Problem(exception.Message);
        }
    }

    // DELETE /expenses/{id}
    [HttpDelete("{id}")]
    [ProducesResponseType(StatusCodes.Status204NoContent)]
    public async Task<ActionResult<Expense>> DeleteExpense([FromRoute] int id, [FromServices] IExpenseData db)
    {
        _expenseslogger.LogInformation("Expenses > DeleteExpense controller executing...");

        try
        {
            await db.DeleteExpense(id);
            return NoContent();
        }
        catch (Exception exception)
        {
            return Problem(exception.Message);
        }
    }
}
