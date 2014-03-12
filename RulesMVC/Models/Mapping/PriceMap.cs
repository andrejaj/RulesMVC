using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;

namespace RulesMVC.Models.Mapping
{
    public class PriceMap : EntityTypeConfiguration<Price>
    {
        public PriceMap()
        {
            // Primary Key
            this.HasKey(t => t.ID);

            // Properties
            this.Property(t => t.ServiceCategory)
                .HasMaxLength(50);

            this.Property(t => t.Currency)
                .HasMaxLength(10);

            this.Property(t => t.Description)
                .HasMaxLength(50);

            // Table & Column Mappings
            this.ToTable("Price");
            this.Property(t => t.ID).HasColumnName("ID");
            this.Property(t => t.SMSGatewayID).HasColumnName("SMSGatewayID");
            this.Property(t => t.ServiceCategory).HasColumnName("ServiceCategory");
            this.Property(t => t.LmgPart).HasColumnName("LmgPart");
            this.Property(t => t.OperatorPart).HasColumnName("OperatorPart");
            this.Property(t => t.ThirdPart).HasColumnName("ThirdPart");
            this.Property(t => t.Currency).HasColumnName("Currency");
            this.Property(t => t.Description).HasColumnName("Description");

            // Relationships
            this.HasOptional(t => t.SMSGateway)
                .WithMany(t => t.Prices)
                .HasForeignKey(d => d.SMSGatewayID);

        }
    }
}
