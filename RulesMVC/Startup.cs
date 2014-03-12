using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(RulesMVC.Startup))]
namespace RulesMVC
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
