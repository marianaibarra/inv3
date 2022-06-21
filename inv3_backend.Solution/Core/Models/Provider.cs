using System.ComponentModel.DataAnnotations;

namespace Core.Models;

public class Provider
{
    public int IdProvider { get; set; }
    [Required]
    public string? NameProvider { get; set; }
    public Product? ProductProvider { get; set; }
    [Required]
    public string? AddressProvider { get; set; }
    [Required]
    public string? PhoneProvider { get; set; }
    [Required]
    public string? EmailProvider { get; set; }
}
