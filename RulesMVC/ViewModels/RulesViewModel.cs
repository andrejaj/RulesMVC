using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace RulesMVC.ViewModels
{
    public class RulesViewModel
    {
        public string ShortCode { get; set; }
        public string Keyword { get; set; }

        public string SelectedSMSGatewayID { get; set; }
        //public IList<string> SMSGateway { get; set; }

        public string SelectedPriceID { get; set; }
        //public IList<string> Price { get; set; }

        public string SelectedApplicationID { get; set; }
        //public IList<string> Application { get; set; }
    }
}