using System.Data;
using Core.Models;
using Dapper;
using DataAccess.DbAccess;

namespace DataAccess.Data;

public class ProviderData : IProviderData
{
    private readonly ISqlDataAccess _database;
    public ProviderData(ISqlDataAccess database)
    {
        _database = database;
    }

    public Task<IEnumerable<Provider>> GetProviders()
    {
        return _database.LoadData<Provider, dynamic>(storedProcedure: "dbo.Providers_Get", parameters: new { });
    }

    public async Task<IEnumerable<Provider>> GetOneProvider(int IdProvider)
    {
        return await _database.LoadData<Provider, dynamic>(storedProcedure: "dbo.Providers_GetOne", parameters: new { IdProvider });
    }
    public async Task<Provider> CreateProvider(Provider provider)
    {
        var p = new DynamicParameters();
        p.Add("@DateSale", provider.NameProvider);
        p.Add("@PhoneProvider", provider.PhoneProvider);
        p.Add("@AddressProvider", provider.AddressProvider);
        p.Add("@EmailProvider", provider.EmailProvider);
        p.Add("@IdProduct", provider.ProductProvider.IdProduct);
        p.Add("@IdProvider", 0, dbType: DbType.Int32, direction: ParameterDirection.Output);
        await _database.SaveData(storedProcedure: "dbo.spProducts_Create", parameters: p);

        provider.IdProvider = p.Get<int>("@IdProvider");
        return provider;
    }

    public Task UpdateProvider(Provider provider)
    {
        return _database.SaveData(storedProcedure: "dbo.Providers_Update", parameters: provider);
    }

    public Task DeleteProvider(int IdProvider)
    {
        return _database.SaveData(storedProcedure: "dbo.Providers_Delete", parameters: new { IdProvider });
    }
}
