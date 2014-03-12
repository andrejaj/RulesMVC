using System;
using System.Collections.Generic;

namespace RulesMVC.Models
{
    public partial class Application
    {
        public Application()
        {
            this.Rules = new List<Rule>();
        }

        public int ID { get; set; }
        public string Name { get; set; }
        public string DllPath { get; set; }
        public string Description { get; set; }
        public virtual ICollection<Rule> Rules { get; set; }
    }
}
