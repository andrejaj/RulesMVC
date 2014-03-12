using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;

namespace RulesMVC.Models.Mapping
{
    public class SMSGatewayMap : EntityTypeConfiguration<SMSGateway>
    {
        public SMSGatewayMap()
        {
            // Primary Key
            this.HasKey(t => t.ID);

            // Properties
            this.Property(t => t.UserName)
                .IsRequired()
                .HasMaxLength(20);

            this.Property(t => t.Pass)
                .IsRequired()
                .HasMaxLength(20);

            this.Property(t => t.OperatorName)
                .IsRequired()
                .HasMaxLength(50);

            // Table & Column Mappings
            this.ToTable("SMSGateway");
            this.Property(t => t.ID).HasColumnName("ID");
            this.Property(t => t.UserName).HasColumnName("UserName");
            this.Property(t => t.Pass).HasColumnName("Pass");
            this.Property(t => t.OperatorName).HasColumnName("OperatorName");
        }
    }
}
