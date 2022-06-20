using System.ComponentModel.DataAnnotations;

namespace Core.Models;

public class Category
{
    public int IdCategory { get; set; }
    [Required]
    public string? NameCategory { get; set; }
}
