//using Microsoft.AspNetCore.Authentication;
//using Microsoft.AspNetCore.Authentication.JwtBearer;
//using Microsoft.Identity.Web;

using DataAccess.Data;
using DataAccess.DbAccess;
using Serilog;

namespace inv3_backend;

public class Program
{
    public static void Main(string[] args)
    {
        var builder = WebApplication.CreateBuilder(args);

        // Add services to the container.
        // builder.Services.AddAuthentication(JwtBearerDefaults.AuthenticationScheme)
        //    .AddMicrosoftIdentityWebApi(builder.Configuration.GetSection("AzureAd"));

        //builder.Services.AddControllers(options =>
        //{
        //    options.Filters.Add<Version1DiscontinuedResourseFilter>();
        //});

        // Logger
        var logger = new LoggerConfiguration()
            .ReadFrom.Configuration(builder.Configuration)
            .Enrich.FromLogContext()
            .CreateLogger();

        builder.Logging.ClearProviders();
        builder.Logging.AddSerilog(logger);

        builder.Services.AddControllers();
        // Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
        builder.Services.AddEndpointsApiExplorer();
        builder.Services.AddSwaggerGen();
        // Data access
        builder.Services.AddSingleton<ISqlDataAccess, SqlDataAccess>();
        // Data services
        builder.Services.AddScoped<IProductData, ProductData>();
        builder.Services.AddScoped<IBussinessData, BussinessData>();
        builder.Services.AddScoped<ICategoryData, CategoryData>();
        builder.Services.AddScoped<IClientData, ClientData>();
        builder.Services.AddScoped<IExpenseData, ExpenseData>();
        builder.Services.AddScoped<IOrderData, OrderData>();
        builder.Services.AddScoped<IOwnerData, OwnerData>();
        builder.Services.AddScoped<IProviderData, ProviderData>();
        builder.Services.AddScoped<ISaleData, SaleData>();

        var app = builder.Build();

        // Configure the HTTP request pipeline.
        if (app.Environment.IsDevelopment())
        {
            app.UseSwagger();
            app.UseSwaggerUI();
        }

        app.UseHttpsRedirection();

        app.UseAuthentication();
        app.UseAuthorization();

        app.MapControllers();

        app.Run();
    }
}