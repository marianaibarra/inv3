using Core.Models;

namespace DataAccess.Data
{
    public interface IOrderData
    {
        Task<Order> CreateOrder(Order order);
        Task DeleteOrder(int IdOrder);
        Task<IEnumerable<Order>> GetOneOrder(int IdOrder);
        Task<IEnumerable<Order>> GetOrders();
        Task UpdateOrder(Order order);
    }
}