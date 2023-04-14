using ForwardProxy.Middlewares;
using ForwardProxy.Service;

namespace ForwardProxy
{
    public class Program
    {
        public static void Main(string[] args)
        {
            var builder = WebApplication.CreateBuilder(args);

            // Add services to the container.
            builder.Services.AddControllersWithViews();
            builder.Services.AddHttpClient();
            builder.Services.AddHttpContextAccessor();
            builder.Services.AddScoped<IHtmlParser, HtmlParser>();
            builder.Services.AddScoped<IHtmlLoader, HtmlLoader>();
            var app = builder.Build();

            // Configure the HTTP request pipeline.
            if (!app.Environment.IsDevelopment())
            {
                app.UseExceptionHandler("/Proxy/Error");
            }
            app.UseStaticFiles();

            app.UseRouting();

            app.UseAuthorization();

            app.MapControllerRoute(
                name: "default",
                pattern: "{controller=Proxy}/{action=Browse}");

            app.UseMiddleware<ProxyMiddleware>();

            app.Run();
        }
    }
}