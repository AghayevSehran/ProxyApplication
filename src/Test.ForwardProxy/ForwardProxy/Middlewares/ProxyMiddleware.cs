using ForwardProxy.Service;
using HtmlAgilityPack;
using System.Net.Http;
using System.Reflection;
using System.Text.RegularExpressions;

namespace ForwardProxy.Middlewares
{
    public class ProxyMiddleware
    {
        private readonly RequestDelegate _next;

        public ProxyMiddleware(RequestDelegate next)
        {
            _next = next;
        }

        public async Task InvokeAsync(HttpContext context, IHtmlLoader htmlLoader, IHtmlParser htmlParser)
        {
            var path = context.Request.Path;
            if (path.Value == "/" || path.Value == "/Proxy/Index")
            {
                await _next.Invoke(context);
            }
            else
            {
                var responseBody = await htmlLoader.Load($"https://www.reddit.com/{path}", context.Request.Method);
                var parsedData = htmlParser.Parse(responseBody);  
                await context.Response.WriteAsync(parsedData);
            }
        }
    }
}
