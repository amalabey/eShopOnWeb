using Microsoft.eShopWeb.ApplicationCore.Interfaces;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Text;

namespace Microsoft.eShopWeb.Infrastructure.Logging
{
    public class SerilogLoggerAdapter<T> : IAppLogger<T>
    {
        private readonly Serilog.Core.Logger _logger;
        public SerilogLoggerAdapter(Serilog.Core.Logger logger)
        {
            _logger = logger;
        }

        public void LogWarning(string message, params object[] args)
        {
            _logger.Warning(message, args);
        }

        public void LogInformation(string message, params object[] args)
        {
            _logger.Information(message, args);
        }
    }
}
