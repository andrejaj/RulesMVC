using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;

namespace RulesMVC.Models.Mapping
{
    public class RuleMap : EntityTypeConfiguration<Rule>
    {
        public RuleMap()
        {
            // Primary Key
            this.HasKey(t => t.ID);

            // Properties
            this.Property(t => t.ShortCode)
                .IsRequired()
                .HasMaxLength(50);

            this.Property(t => t.Keyword)
                .IsRequired()
                .HasMaxLength(50);

            // Table & Column Mappings
            this.ToTable("Rule");
            this.Property(t => t.ID).HasColumnName("ID");
            this.Property(t => t.ShortCode).HasColumnName("ShortCode");
            this.Property(t => t.Keyword).HasColumnName("Keyword");
            this.Property(t => t.SMSGatewayID).HasColumnName("SMSGatewayID");
            this.Property(t => t.PriceID).HasColumnName("PriceID");
            this.Property(t => t.ApplicationID).HasColumnName("ApplicationID");

            // Relationships
            this.HasOptional(t => t.Application)
                .WithMany(t => t.Rules)
                .HasForeignKey(d => d.ApplicationID);
            this.HasOptional(t => t.Price)
                .WithMany(t => t.Rules)
                .HasForeignKey(d => d.PriceID);
            this.HasRequired(t => t.SMSGateway)
                .WithMany(t => t.Rules)
                .HasForeignKey(d => d.SMSGatewayID);

        }
    }
}
