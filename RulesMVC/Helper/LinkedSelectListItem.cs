using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace RulesMVC.Helper
{
    public class LinkedSelectListItem
    {
        public string Text { get; set; }
        public string Value { get; set; }
        public string LinkValue { get; set; }
        public bool Selected { get; set; }
    }
}