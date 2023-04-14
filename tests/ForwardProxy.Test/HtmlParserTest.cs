
namespace ForwardProxy.Test
{
    public class HtmlParserTest
    {

        //To each word, which consists of six letters, you must add a symbol "™";

        [Fact]
        public void Input_SimpleHtml_ReturnSixLettersWordsWithSymbol()
        {           
            var mockHttpContextAccessor = new Mock<IHttpContextAccessor>();
            var context = new DefaultHttpContext();
            mockHttpContextAccessor.Setup(_ => _.HttpContext).Returns(context);
            var html = @"<!DOCTYPE html>
            <html>
            <body>
                <ul>
                 <li>Coffee</li>
                 <li>Tea</li>
                 <li>Milk</li>
                 </ul> 
                 </body>
            </html>";

            var parser = new HtmlParser(mockHttpContextAccessor.Object);
            var result = parser.Parse(html);

            result.Should().Contain("Coffee™");
        }

        //All internal navigation links of the site must be replaced by the address of the proxy-server.

        [Fact]
        public void Input_SimpleHtmlWithNavigation_RetursAlteredNaviagtion()
        {
            var mockHttpContextAccessor = new Mock<IHttpContextAccessor>();
            var context = new DefaultHttpContext();
            context.Request.Scheme = "http";
            context.Request.Host = new HostString("localhost:1521");
            mockHttpContextAccessor.Setup(_ => _.HttpContext).Returns(context);
            var html = @"<!DOCTYPE html>
            <html>
            <body>
                <ul>
                 <li>Coffee</li>
                 <li>Tea</li>
                 <li>Milk</li>
                 </ul> 
                 <div class=""word12"">
                  <a href=""https://www.reddit.com/"">Visit Reddit</a>
                </div>
                 </body>
            </html>";

            var parser = new HtmlParser(mockHttpContextAccessor.Object);
            var result = parser.Parse(html);

            result.Should().NotContain("https://www.reddit.com/™").And.Contain("http://localhost:1521/");
        }

        //The functionality of the original site must not be altered;

        [Fact]
        public void Input_SimpleHtmlWithStyleAndScript_StyleAndScriptCanNotBeChanged()
        {
            var mockHttpContextAccessor = new Mock<IHttpContextAccessor>();
            var context = new DefaultHttpContext();
            mockHttpContextAccessor.Setup(_ => _.HttpContext).Returns(context);
            var html = @"<!DOCTYPE html>
            <html>
            <head>
             <style>
               body {background-color: powderblue;}
               h1   {color: blue;}
               p    {color: red;}
               .word22 {color: red;}
             </style>
            </head>
            <body>
                <ul>
                 <li>Coffee</li>
                 <li>Tea</li>
                 <li>Milk</li>
                 </ul> 
                <div class=""word22""></div>
                 <script>
                   document.getElementById(""demo"").innerHTML = ""Hello JavaScript! simple"";
                 </script>
                 </body>
            </html>";

            var parser = new HtmlParser(mockHttpContextAccessor.Object);
            var result = parser.Parse(html);

            result.Should().Contain("word22").And.NotContain("word22™").And.Contain("simple");
        }

        [Fact]
        public void Input_SimpleHtml_ReturnDesiredResulltWithAllRequirements()
        {
            var mockHttpContextAccessor = new Mock<IHttpContextAccessor>();
            var context = new DefaultHttpContext();
            context.Request.Scheme="http";
            context.Request.Host = new HostString("localhost:1521"); 
            mockHttpContextAccessor.Setup(_ => _.HttpContext).Returns(context);

            var html = @"<!DOCTYPE html>
            <html>
            <body>
                <ul>
                 <li>Coffee</li>
                 <li>Tea</li>
                 <li>Milk</li>
                 </ul> 
                <div class=""word12"">
                  <a href=""https://www.reddit.com/"">Visit Reddit</a>
                </div>

                <h1>Learn To Code in C#</h1>
                <p>Programming is really <i>easy</i>.</p>
                <p>Please take it as a joke</p>
                <p id=""demo""></p>

                 <script>
                   document.getElementById(""demo"").innerHTML = ""Hello JavaScript! 123456"";
                 </script>
            </body>
            </html>";

            var parser = new HtmlParser(mockHttpContextAccessor.Object);         
            var result = parser.Parse(html);

            var desired = @"<!DOCTYPE html>
            <html>
            <body>
                <ul>
                 <li>Coffee™</li>
                 <li>Tea</li>
                 <li>Milk</li>
                 </ul> 
                <div class=""word12"">
                  <a href=""http://localhost:1521/"">Visit Reddit™</a>
                </div>

                <h1>Learn To Code in C#</h1>
                <p>Programming is really™ <i>easy</i>.</p>
                <p>Please™ take it as a joke</p>
                <p id=""demo""></p>

                 <script>
                   document.getElementById(""demo"").innerHTML = ""Hello JavaScript! 123456"";
                 </script>
            </body>
            </html>";
            result.Should().Be(desired);
        }

    }
}