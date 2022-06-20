using Core.Models;

namespace DataAccess.Data
{
    public interface IExpenseData
    {
        Task<Expense> CreateExpense(Expense expense);
        Task DeleteExpense(int IdExpense);
        Task<IEnumerable<Expense>> GetExpenses();
        Task<IEnumerable<Expense>> GetOneExpense(int IdExpense);
        Task UpdateExpense(Expense expense);
    }
}