using System.ComponentModel.DataAnnotations;

namespace Core.Models;

public class Bussiness
{
    public int IdBussiness { get; set; }
    [Required]
    public string? NameBussiness { get; set; }
    [Required]
    // TODO: Shall it be idOwner or an owner?
    // let it be the type, and do a search in db to get id of the type
    public Owner? Owner { get; set; }
    public decimal Finance { get; set; } = 0;
    /// <summary>
    /// Determines whether count new orders into balance
    /// </summary>
    public bool IsCountBalance { get; set; } = false;
}
