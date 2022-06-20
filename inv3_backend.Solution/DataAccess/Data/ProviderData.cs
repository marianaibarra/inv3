using Core.Models;
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

    public Task CreateProvider(Provider provider)
    {
        return _database.SaveData(storedProcedure: "dbo.Providers_Create", parameters: new
        {
            provider.NameProvider,
            provider.PhoneProvider,
            provider.ProductProvider.IdProduct,
            provider.AddressProvider,
            provider.EmailProvider
        });
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
