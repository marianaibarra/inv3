#nullable disable

using System.ComponentModel.DataAnnotations;
using Core.Models;

namespace Core.ValidationAttributes;

public class Order_EnsureDeliveryDateLaterOrderDate : ValidationAttribute
{
    protected override ValidationResult IsValid(object value, ValidationContext validationContext)
    {
        var order = validationContext.ObjectInstance as Order;
        if (!order.EnsureDeliveryLaterOrderDate())
        {
            return new ValidationResult("Delivery date must be later than order date.");
        }
        return ValidationResult.Success;
    }
}
