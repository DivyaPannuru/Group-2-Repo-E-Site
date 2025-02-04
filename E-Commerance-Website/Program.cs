using Microsoft.AspNetCore.Builder;
using Microsoft.EntityFrameworkCore;

namespace E_Commerance_Website
{
    public class Program
    {
        public static void Main(string[] args)
        {
            CreateHostBuilder(args).Build().Run();
        }

        public static IHostBuilder CreateHostBuilder(string[] args) =>
            Host.CreateDefaultBuilder(args)
                .ConfigureAppConfiguration((hostingContext, config) =>
                {
                })
                .ConfigureWebHostDefaults(webBuilder =>
                {
                    webBuilder.ConfigureServices(services =>
                    {
                        var builder = WebApplication.CreateBuilder(args);
                        services.AddControllersWithViews();
                                  services.AddDbContext<MyDbContext>(options =>
                        options.UseSqlServer(builder.Configuration.GetConnectionString("DefaultConnection")));
                    })
                    .Configure(app =>
                    {
                        var loggerFactory = app.ApplicationServices
                            .GetRequiredService<ILoggerFactory>();
                        var logger = loggerFactory.CreateLogger<Program>();
                        var path = Directory.GetCurrentDirectory();
                        loggerFactory.AddFile($"{path}\\Logs\\Log.txt");
                        var env = app.ApplicationServices.GetRequiredService<IWebHostEnvironment>();
                        var config = app.ApplicationServices.GetRequiredService<IConfiguration>();

app.UseMiddleware<CustomExceptionMiddleware>();

                        if (env.IsDevelopment())
                        {
                            app.UseExceptionHandler("/Home/Error");
                            app.UseHsts();
                        }

                        app.UseHttpsRedirection();
                        app.UseStaticFiles();

                        app.UseRouting();

                        app.UseAuthorization();
                        app.UseEndpoints(endpoints =>
                        {
                            endpoints.MapControllerRoute("default", "{controller=Home}/{action=Index}/{id?}");
                        });
                       

                        //app.Run();
                    });
                });
    }
}