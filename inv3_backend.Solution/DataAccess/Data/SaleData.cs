using System.Data;
using Core.Models;
using Dapper;
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

    public async Task<Sale> CreateSale(Sale sale)
    {
        var p = new DynamicParameters();
        p.Add("@DateSale", sale.DateSale);
        p.Add("@PayMethod", sale.PayMethod);
        p.Add("@IdClient", sale.Client.IdClient);
        p.Add("@Income", sale.Income);
        p.Add("@IdProduct", sale.Product.IdProduct);
        p.Add("@IdSale", 0, dbType: DbType.Int32, direction: ParameterDirection.Output);
        await _database.SaveData(storedProcedure: "dbo.spProducts_Create", parameters: p);

        sale.IdSale = p.Get<int>("@IdSale");
        return sale;
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
