using Microsoft.ApplicationInsights.Extensibility;
using Microsoft.eShopWeb.ApplicationCore.Interfaces;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Serilog;
using System;
using System.Collections.Generic;
using System.Text;

namespace Microsoft.eShopWeb.Infrastructure.Logging
{
    public static class LoggingExtensions
    {
        public static void RegisterInstrumentation(this IServiceCollection services, IConfiguration configuration)
        {
            var logger = new LoggerConfiguration()
                .ReadFrom.Configuration(configuration)
                .CreateLogger();

            services.AddScoped(typeof(IAppLogger<>), typeof(SerilogLoggerAdapter<>));
        }
    }
}
