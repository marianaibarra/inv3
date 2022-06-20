using System.Data;
using Core.Models;
using Dapper;
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

    public async Task<Order> CreateOrder(Order order)
    {
        var p = new DynamicParameters();
        p.Add("@OrderDate", order.OrderDate);
        p.Add("@DeliveryDate", order.DeliveryDate);
        p.Add("@IdClient", order.Client.IdClient);
        p.Add("@IdProduct", order.Product.IdProduct);
        p.Add("@IdOrderOrigin", order.OrderOrigin);
        p.Add("@IdOrder", 0, dbType: DbType.Int32, direction: ParameterDirection.Output);
        
        await _database.SaveData(storedProcedure: "dbo.Orders_Create", parameters: p);

        order.IdOrder = p.Get<int>("@IdOrder");

        return order;
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
