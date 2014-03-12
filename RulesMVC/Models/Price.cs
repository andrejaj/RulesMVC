using System;
using System.Collections.Generic;

namespace RulesMVC.Models
{
    public partial class Price
    {
        public Price()
        {
            this.Rules = new List<Rule>();
        }

        public long ID { get; set; }
        public Nullable<int> SMSGatewayID { get; set; }
        public string ServiceCategory { get; set; }
        public Nullable<decimal> LmgPart { get; set; }
        public Nullable<decimal> OperatorPart { get; set; }
        public Nullable<decimal> ThirdPart { get; set; }
        public string Currency { get; set; }
        public string Description { get; set; }
        public virtual SMSGateway SMSGateway { get; set; }
        public virtual ICollection<Rule> Rules { get; set; }
    }
}
