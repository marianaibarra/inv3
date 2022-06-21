#nullable disable
using System.ComponentModel.DataAnnotations;
using Core.Models;

namespace Core.ValidationAttributes;

public class Order_EnsureDeliveryDateIsLaterThanCurrent : ValidationAttribute
{
    protected override ValidationResult IsValid(object value, ValidationContext validationContext)
    {
        var order = validationContext.ObjectInstance as Order;
        if (!order.EnsureDeliveryDateIsLaterThanCurrent())
        {
            return new ValidationResult("Delivery date must be in the future.");
        }
        return ValidationResult.Success;
    }
}
