using System.ComponentModel.DataAnnotations;

namespace Core.Models;

public class Product
{
    public int IdProduct { get; set; }
    [Required]
    public string? NameProduct { get; set; }
    [Required]
    public string? ImageProduct { get; set; } = "none.png";
    public Category? Category { get; set; }
    [Required]
    public decimal? Price { get; set; }
    [Required]
    public decimal? UnitaryCost { get; set; }
    [Required]
    public int? Quantity { get; set; }
}
