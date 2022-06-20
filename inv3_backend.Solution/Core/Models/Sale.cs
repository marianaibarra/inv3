using System.ComponentModel.DataAnnotations;
using Core.Enums;

namespace Core.Models;

public class Sale
{
    public int IdSale { get; set; }
    [Required]
    public DateTime? DateSale { get; set; }
    [Required]
    public PayMethods PayMethod { get; set; } = PayMethods.card;
    public Client? Client { get; set; }
    [Required]
    public decimal? Income { get; set; }
    public Product? Product { get; set; }
}
