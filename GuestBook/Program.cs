using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Hosting;

namespace GuestBook
{
    public class Program
    {
        public static void Main(string[] args)
        {
            CreateHostBuilder(args).Build().Run();
        }

        public static IHostBuilder CreateHostBuilder(string[] args) =>
            Host.CreateDefaultBuilder(args)
                .ConfigureWebHostDefaults(webBuilder =>
                {
                    webBuilder.UseStartup<Startup>();
                    //TODO: change ip for any pc
                    //webBuilder.UseUrls("http://192.168.0.105:5000/");
                });
    }
}
