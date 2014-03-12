using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using RulesMVC.DAL;
using RulesMVC.ViewModels;

namespace RulesMVC.Controllers
{
    public class RulesController : Controller
    {
        private readonly UnitOfWork unitOfWork = new UnitOfWork();

        //
        // GET: /Rules/
        public ActionResult Index()
        {
            return View();
        }

        //
        // GET: /Rules/Details/5
        public ActionResult Details()
        {
            var rules = unitOfWork.RuleRepository.Get();

            return View(rules);
        }

        //
        // GET: /Rules/Create
        public ActionResult Create()
        {
            PopulateDropDownLists();
            return View();
        }

        [HttpPost]

        public ActionResult Create(RulesViewModel model)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    var item = new Models.Rule()
                    {
                        ApplicationID = int.Parse(model.SelectedApplicationID),
                        SMSGatewayID = int.Parse(model.SelectedSMSGatewayID),
                        PriceID = int.Parse(model.SelectedPriceID),
                        ShortCode = model.ShortCode,
                        Keyword = model.Keyword
                    };

                    unitOfWork.RuleRepository.Insert(item);
                    unitOfWork.Save();
                }
                return RedirectToAction("Details");
            }
            catch (DataException)
            {
                ModelState.AddModelError("",
                    "Unable to save changes. Try again, and if the problem persists, see your system administrator.");
            }

            PopulateDropDownLists(model.SelectedSMSGatewayID);
            return View(model);
        }

        private void PopulateDropDownLists(object selectedRule = null)
        {
            var smsQuery = unitOfWork.SmsGatewayRepository.Get(orderBy: q => q.OrderBy(d => d.OperatorName));

            ViewBag.SmsGateways =
                smsQuery.Select(x => new SelectListItem {Text = x.OperatorName, Value = x.ID.ToString()});

            var applicationQuery = unitOfWork.ApplicationRepository.Get(orderBy: q => q.OrderBy(d => d.Name));

            ViewBag.Applications =
                applicationQuery.Select(x => new SelectListItem {Text = x.Name, Value = x.ID.ToString()});

            ViewBag.Prices = unitOfWork.PriceRepository.Get().ToList();
        }

        protected override void Dispose(bool disposing)
        {
            unitOfWork.Dispose();
            base.Dispose(disposing);
        }
    }
}
