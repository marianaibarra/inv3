#nullable disable

using System.Data;
using Core.Models;
using Dapper;
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

    public async Task<Expense> CreateExpense(Expense expense)
    {
        var p = new DynamicParameters();
        p.Add("@IdProvider", expense.Provider.IdProvider);
        p.Add("@IdPayMethod", expense.PayMethod);
        p.Add("@IdProduct", expense.Product.IdProduct);
        p.Add("@Spent", expense.Spent);
        p.Add("@IdExpense", 0, dbType: DbType.Int32, direction: ParameterDirection.Output);

        await _database.SaveData(storedProcedure: "dbo.Orders_Insert", parameters: p);

        expense.IdExpense = p.Get<int>("@IdExpense");

        return expense;
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
