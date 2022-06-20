using System.ComponentModel.DataAnnotations;

namespace Core.Models;

public class Owner
{
    private readonly string _user;
    public int IdOwner { get; set; }
    /// <summary>
    /// It is set automatically
    /// </summary>
    [Required]
    [MaxLength(20)]
    public string? Username
    {
        get
        {
            return _user;
        }
    }
    [Required]
    public string? NameOwner { get; set; }
    [Required]
    public string? LastNameOwner { get; set; }
    [Required]
    public string? Password { get; set; }
    [Required]
    [DataType(DataType.EmailAddress)]
    [EmailAddress]
    public string? Email { get; set; }
    [Required]
    [DataType(DataType.PhoneNumber)]
    [Phone]
    public string? Phone { get; set; }

    /// <summary>
    /// Creates an unique username for owner
    /// </summary>
    /// <param name="name"></param>
    /// <param name="lastName"></param>
    public Owner(string? name, string? lastName)
    {
        Random random = new();
        _user = name + lastName + random.Next();
    }
}
