using System.Diagnostics;

namespace E_Commerance_Website.Middlewares
{
    // You may need to install the Microsoft.AspNetCore.Http.Abstractions package into your project
    public class RequestLoggingMiddleware
    {
        private readonly RequestDelegate _next;
        private readonly ILogger<RequestLoggingMiddleware> _logger;

        public RequestLoggingMiddleware(RequestDelegate next, ILogger<RequestLoggingMiddleware> logger)
        {
            _next = next;
            _logger = logger;
        }

        public async Task Invoke(HttpContext httpContext)
        {

            // Request Logic
            // Log Request Information:
            var stopwatch = Stopwatch.StartNew();
            var message = $" - Incoming Request: {httpContext.Request.Method} | {httpContext.Request.Path}";
            await File.AppendAllTextAsync("C:/Logs/RequestLogs.txt", message);
            await _next(httpContext);
            // Response Logic
            stopwatch.Stop();
            // Log Response Information:
            _logger.LogInformation($" - Response: {httpContext.Response.StatusCode} | Execution Time: {stopwatch.ElapsedMilliseconds} ms");

        }
    }

    // Extension method used to add the middleware to the HTTP request pipeline.
    public static class RequestLoggingMiddlewareExtensions
    {
        public static IApplicationBuilder UseRequestLoggingMiddleware(this IApplicationBuilder builder)
        {
            return builder.UseMiddleware<RequestLoggingMiddleware>();
        }
    }
}
