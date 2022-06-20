using System.ComponentModel.DataAnnotations;
using Core.Enums;
using Core.ValidationAttributes;

namespace Core.Models;

public class Order
{
    public int IdOrder { get; set; }
    [Required]
    public Product? Product { get; set; }
    public Client? Client { get; set; }
    [Required]
    [Order_EnsureOrderDateLaterThanCurrent]
    public DateTime? OrderDate { get; set; }
    [Required]
    [Order_EnsureDeliveryDateIsLaterThanCurrent]
    [Order_EnsureDeliveryDateLaterOrderDate]
    public DateTime? DeliveryDate { get; set; }
    [Required]
    public OrderOrigins OrderOrigin { get; set; }

    /// <summary>
    /// Ensures order date are in future
    /// </summary>
    /// <returns> Boolean whether it's a aceptable date </returns>
    public bool EnsureOrderDateIsLaterThanCurrent()
    {
        return (OrderDate > DateTime.Now);
    }
    /// <summary>
    /// Ensures delivery date are in future
    /// </summary>
    /// <returns> Boolean whether it's a aceptable date </returns>
    public bool EnsureDeliveryDateIsLaterThanCurrent()
    {
        return (DeliveryDate > DateTime.Now);
    }
    /// <summary>
    /// Ensures delivery date is later than order date
    /// </summary>
    public bool EnsureDeliveryLaterOrderDate()
    {
        return (DeliveryDate > OrderDate);
    }
}
