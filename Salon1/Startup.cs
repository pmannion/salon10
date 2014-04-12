using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(Salon1.Startup))]
namespace Salon1
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
