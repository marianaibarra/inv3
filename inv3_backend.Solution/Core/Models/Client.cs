using System.ComponentModel.DataAnnotations;

namespace Core.Models;

public class Client
{
    public int IdClient { get; set; }
    [Required]
    public string? NameClient { get; set; }
    [Required]
    public string? LastName { get; set; }
    [Required]
    public string? AddressClient { get; set; }
    [Required]
    public string? PhoneClient { get; set; }
    [Required]
    public string? EmailClient { get; set; }
}
