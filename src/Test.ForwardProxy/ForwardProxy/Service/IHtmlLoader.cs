namespace ForwardProxy.Service
{
    public interface IHtmlLoader
    {
        Task<string> Load(string url, string httpMethod = "GET");
    }
}
