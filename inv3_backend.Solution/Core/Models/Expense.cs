using System.ComponentModel.DataAnnotations;
using Core.Enums;

namespace Core.Models;

public class Expense
{
    public int IdExpense { get; set; }
    [Required]
    public DateTime DateExpense { get; set; }
    public PayMethods PayMethod { get; set; } = PayMethods.card;
    public Provider? Provider { get; set; }
    [Required]
    public decimal? Spent { get; set; }
    public Product? Product { get; set; }
}
