using System.Net.Http;
using System.Reflection;

namespace ForwardProxy.Service
{
    public class HtmlLoader : IHtmlLoader
    {
        private readonly IHttpClientFactory _httpClientFactory;
      
        public HtmlLoader(IHttpClientFactory httpClientFactory)
        {
            _httpClientFactory = httpClientFactory;
        }

        public async Task<string> Load(string url, string httpMethod="GET")
        {
            var httpRequestMessage = new HttpRequestMessage(new HttpMethod(httpMethod), url);
            var httpClient = _httpClientFactory.CreateClient();
            var responseMessage = await  httpClient.SendAsync(httpRequestMessage);
            return await  responseMessage.Content.ReadAsStringAsync();
        }
    }
}
