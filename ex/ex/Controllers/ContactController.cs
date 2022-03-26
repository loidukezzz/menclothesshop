using ex.Context;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ex.Controllers
{
    public class ContactController : Controller
    {
        ONLINESHOPEntities dbObj = new ONLINESHOPEntities();
        // GET: Contact
        [HttpGet]
        public ActionResult Index()
        {

            return View();
        }
        [HttpPost]
        public ActionResult Index(Contact objContact)
        {
            try
            {
                dbObj.Contacts.Add(objContact);
                dbObj.SaveChanges();
                return View();
            }
            catch (Exception)
            {
                return View("Error");
            }
        }
    }
}