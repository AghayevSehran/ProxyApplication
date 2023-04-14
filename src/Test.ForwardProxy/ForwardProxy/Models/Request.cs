using System.ComponentModel;

namespace ForwardProxy.Models
{
    public class Request
    {
        [DisplayName("Please enter the url")]
        public required string RequestedUrl { get; set; }
    }
}
