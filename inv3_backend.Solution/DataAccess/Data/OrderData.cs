using Core.Models;
using DataAccess.DbAccess;

namespace DataAccess.Data;

public class OrderData : IOrderData
{
    private readonly ISqlDataAccess _database;
    public OrderData(ISqlDataAccess database)
    {
        _database = database;
    }

    public Task<IEnumerable<Order>> GetOrders()
    {
        return _database.LoadData<Order, dynamic>(storedProcedure: "dbo.Orders_Get", parameters: new { });
    }

    public async Task<IEnumerable<Order>> GetOneOrder(int IdOrder)
    {
        return await _database.LoadData<Order, dynamic>(storedProcedure: "dbo.Orders_GetOne", parameters: new { IdOrder });
    }

    public Task CreateOrder(Order order)
    {
        return _database.SaveData(storedProcedure: "dbo.Orders_Create", parameters: new
        {
            order.OrderDate,
            order.DeliveryDate,
            order.Client.IdClient,
            order.Product.IdProduct,
            order.OrderOrigin
        });
    }

    public Task UpdateOrder(Order order)
    {
        return _database.SaveData(storedProcedure: "dbo.Orders_Update", parameters: order);
    }

    public Task DeleteOrder(int IdOrder)
    {
        return _database.SaveData(storedProcedure: "dbo.Orders_Delete", parameters: new { IdOrder });
    }
}
