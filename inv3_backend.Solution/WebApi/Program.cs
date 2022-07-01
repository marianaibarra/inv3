//using Microsoft.AspNetCore.Authentication;
//using Microsoft.AspNetCore.Authentication.JwtBearer;
//using Microsoft.Identity.Web;

using DataAccess.Data;
using DataAccess.DbAccess;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Versioning;
using Microsoft.OpenApi.Models;
using System.Reflection;
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
        // Add versioning
        builder.Services.AddApiVersioning(options =>
        {
            options.AssumeDefaultVersionWhenUnspecified = true;
            options.DefaultApiVersion = ApiVersion.Default;
            options.ApiVersionReader = new MediaTypeApiVersionReader("version");
            options.ReportApiVersions = true;
        });
        // Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
        builder.Services.AddEndpointsApiExplorer();
        builder.Services.AddSwaggerGen(options =>
        {
            options.SwaggerDoc("v1", new OpenApiInfo
            {
                Version = "v1",
                Title = "Inv3 Web API",
                Description = "An asp.net core web api to manage inv3 app entities",
                TermsOfService = new Uri("https://localhost.com/terms"),
                Contact = new OpenApiContact
                {
                    Name = "Mariana Ibarra",
                    Url = new Uri("https://www.linkedin.com/in/m4arianaib4rra/")
                },
                License = new OpenApiLicense
                {
                    Name = "Open license",
                    Url = new Uri("https://localhost.com/license")
                }
            });
            var xmlFileName = $"{Assembly.GetExecutingAssembly().GetName().Name}.xml";
            options.IncludeXmlComments(Path.Combine(AppContext.BaseDirectory, xmlFileName));
        });
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
            app.UseSwaggerUI(options =>
            {
                // Set route to app root
                options.SwaggerEndpoint("swagger/v1/swagger.json", "v1");
                options.RoutePrefix = string.Empty;
                // Inject css
                // options.InjectStylesheet("swagger-ui/custom.css");
            });
        }

        app.UseHttpsRedirection();

        // Enable to use static files to customize swagger ui
        // app.UseStaticFiles();
        app.UseAuthentication();
        app.UseAuthorization();

        app.MapControllers();

        app.Run();
    }
}