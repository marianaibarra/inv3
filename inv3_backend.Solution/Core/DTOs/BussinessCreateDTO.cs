using System.ComponentModel.DataAnnotations;

namespace Core.DTOs;

public class BussinessCreateDTO
{
    [Required]
    public string? NameBussiness { get; set; }
    [Required]
    public int IdOwner { get; set; }
}
