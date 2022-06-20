using System.ComponentModel.DataAnnotations;
using Core.Models;

namespace Core.ValidationAttributes;

public class Order_EnsureOrderDateLaterThanCurrent : ValidationAttribute
{
    protected override ValidationResult? IsValid(object? value, ValidationContext validationContext)
    {
        var order = validationContext.ObjectInstance as Order;
        if (!order.EnsureOrderDateIsLaterThanCurrent())
        {
            return new ValidationResult("Order must be in the future.");
        }
        return ValidationResult.Success;
    }
}
