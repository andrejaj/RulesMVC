using System;
using System.Collections.Generic;

namespace RulesMVC.Models
{
    public partial class Rule
    {
        public long ID { get; set; }
        public string ShortCode { get; set; }
        public string Keyword { get; set; }
        public int SMSGatewayID { get; set; }
        public Nullable<long> PriceID { get; set; }
        public Nullable<int> ApplicationID { get; set; }
        public virtual Application Application { get; set; }
        public virtual Price Price { get; set; }
        public virtual SMSGateway SMSGateway { get; set; }
    }
}
