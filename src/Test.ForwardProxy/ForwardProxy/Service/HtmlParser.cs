using ForwardProxy.Controllers;
using HtmlAgilityPack;
using System.Text.RegularExpressions;

namespace ForwardProxy.Service
{
    public class HtmlParser : IHtmlParser
    {
  
        private readonly IHttpContextAccessor _httpContextAccessor;

        public HtmlParser(IHttpContextAccessor httpContextAccessor)
        {

            _httpContextAccessor = httpContextAccessor;
        }

        public string Parse(string input)
        {
            string hostUrl = $"{_httpContextAccessor.HttpContext.Request.Scheme}://{_httpContextAccessor.HttpContext.Request.Host}";
            input = Regex.Replace(input, @"https?:\/\/(www\.)?reddit\.com", $"{hostUrl}");
            var document = new HtmlDocument();
            document.LoadHtml(input);
            var node = document.DocumentNode.SelectSingleNode("//html");
            string wordPattern = @"\b\w{6}\b";
            foreach (var nNode in node.DescendantsAndSelf())
            {
                if (nNode.NodeType is HtmlNodeType.Text && nNode.ParentNode.Name is not "style" && nNode.ParentNode.Name is not "script")
                {
                    var words = Regex.Matches(nNode.InnerHtml, wordPattern);
                    foreach (Match word in words)
                    {
                        var modifiedWord = $"{word.Value}™";
                        nNode.InnerHtml = nNode.InnerHtml.Replace(word.Value, modifiedWord);
                    }
                }
            }
            return document.DocumentNode.OuterHtml;
        }
    }
}
