using System;
using System.Collections.Generic;

namespace RulesMVC.Models
{
    public partial class SMSGateway
    {
        public SMSGateway()
        {
            this.Prices = new List<Price>();
            this.Rules = new List<Rule>();
        }

        public int ID { get; set; }
        public string UserName { get; set; }
        public string Pass { get; set; }
        public string OperatorName { get; set; }
        public virtual ICollection<Price> Prices { get; set; }
        public virtual ICollection<Rule> Rules { get; set; }
    }
}
