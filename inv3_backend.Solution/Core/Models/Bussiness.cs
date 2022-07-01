using System.ComponentModel.DataAnnotations;

namespace Core.Models;

public class Bussiness
{
    [Key]
    public int IdBussiness { get; set; }
    [Required]
    public string? NameBussiness { get; set; }
    [Required]
    public Owner? Owner { get; set; }
    public decimal Finance { get; set; } = 0;
    /// <summary>
    /// Determines whether count new orders into balance
    /// </summary>
    public bool IsCountBalance { get; set; } = false;
}
