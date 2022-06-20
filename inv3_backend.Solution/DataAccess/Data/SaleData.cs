using Core.Models;
using DataAccess.DbAccess;

namespace DataAccess.Data;

public class SaleData : ISaleData
{
    private readonly ISqlDataAccess _database;
    public SaleData(ISqlDataAccess database)
    {
        _database = database;
    }

    public Task<IEnumerable<Sale>> GetSales()
    {
        return _database.LoadData<Sale, dynamic>(storedProcedure: "dbo.Sales_Get", parameters: new { });
    }

    public async Task<IEnumerable<Sale>> GetOneSale(int IdSale)
    {
        return await _database.LoadData<Sale, dynamic>(storedProcedure: "dbo.Sales_GetOne", parameters: new { IdSale });
    }

    public Task CreateSale(Sale sale)
    {
        return _database.SaveData(storedProcedure: "dbo.Sales_Create", parameters: new
        {
            sale.DateSale,
            sale.PayMethod,
            sale.Client.IdClient,
            sale.Income,
            sale.Product.IdProduct
        });
    }

    public Task UpdateSale(Sale sale)
    {
        return _database.SaveData(storedProcedure: "dbo.Sales_Update", parameters: sale);
    }

    public Task DeleteSale(int IdSale)
    {
        return _database.SaveData(storedProcedure: "dbo.Sales_Delete", parameters: new { IdSale });
    }
}
