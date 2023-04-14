using ForwardProxy.Models;
using ForwardProxy.Service;
using HtmlAgilityPack;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Net.Http.Headers;
using System.Diagnostics;
using System.Text;
using System.Text.RegularExpressions;
using static System.Net.WebRequestMethods;

namespace ForwardProxy.Controllers
{
    public class ProxyController : Controller
    {
        private readonly ILogger<ProxyController> _logger;
        private readonly IHttpClientFactory _httpClientFactory;
        private readonly IHttpContextAccessor _httpContextAccessor;
        private readonly IHtmlLoader _htmlLoader;
        private readonly IHtmlParser _htmlParser;

        public ProxyController(ILogger<ProxyController> logger, IHttpClientFactory httpClientFactory, IHttpContextAccessor httpContextAccessor,
            IHtmlLoader htmlLoader, IHtmlParser htmlParser)
        {
            _logger = logger;
            _httpClientFactory = httpClientFactory;
            _httpContextAccessor = httpContextAccessor;
            _htmlLoader = htmlLoader;
            _htmlParser = htmlParser;
        }

        public IActionResult Browse()
        {
            return View("Index");
        }

        [HttpPost, ValidateAntiForgeryToken]
        public async Task<IActionResult> Index(Request request)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }
            var responseBody = await _htmlLoader.Load(request.RequestedUrl);
            var parsedData = _htmlParser.Parse(responseBody);
            ViewBag.Content = parsedData;
            return View("Proxy");
        }

        public IActionResult Privacy()
        {
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}