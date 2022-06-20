using Core.Models;
using DataAccess.DbAccess;

namespace DataAccess.Data;

public class ExpenseData : IExpenseData
{
    private readonly ISqlDataAccess _database;

    public ExpenseData(ISqlDataAccess database)
    {
        _database = database;
    }

    public Task<IEnumerable<Expense>> GetExpenses()
    {
        return _database.LoadData<Expense, dynamic>(storedProcedure: "dbo.Expenses_Get", parameters: new { });
    }

    public async Task<IEnumerable<Expense>> GetOneExpense(int IdExpense)
    {
        return await _database.LoadData<Expense, dynamic>(storedProcedure: "dbo.Expenses_GetOne", parameters: new { IdExpense });
    }

    public Task CreateExpense(Expense expense)
    {
        return _database.SaveData(storedProcedure: "dbo.Expenses_Create", parameters: new
        {
            expense.Provider.IdProvider,
            expense.PayMethod,
            expense.Product.IdProduct,
            expense.Spent
        });
    }

    public Task UpdateExpense(Expense expense)
    {
        return _database.SaveData(storedProcedure: "dbo.Expenses_Update", parameters: expense);
    }

    public Task DeleteExpense(int IdExpense)
    {
        return _database.SaveData(storedProcedure: "dbo.Expenses_Delete", parameters: new { IdExpense });
    }
}
