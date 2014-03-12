using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using RulesMVC.Models.Mapping;

namespace RulesMVC.Models
{
    public partial class TestContext : DbContext
    {
        static TestContext()
        {
            Database.SetInitializer<TestContext>(null);
        }

        public TestContext()
            : base("Name=TestContext")
        {
        }

        public DbSet<Application> Applications { get; set; }
        public DbSet<Price> Prices { get; set; }
        public DbSet<Rule> Rules { get; set; }
        public DbSet<SMSGateway> SMSGateways { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Configurations.Add(new ApplicationMap());
            modelBuilder.Configurations.Add(new PriceMap());
            modelBuilder.Configurations.Add(new RuleMap());
            modelBuilder.Configurations.Add(new SMSGatewayMap());
        }
    }
}
