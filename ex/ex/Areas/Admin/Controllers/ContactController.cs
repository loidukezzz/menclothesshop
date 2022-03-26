using ex.Context;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ex.Areas.Admin.Controllers
{
    public class ContactController : Controller
    {
        // GET: Admin/Contact
        ONLINESHOPEntities dbObj = new ONLINESHOPEntities();
        public ActionResult Index()
        {
            var lstContact = dbObj.Contacts.ToList();
            return View(lstContact);
        }
        [HttpGet]
        public ActionResult Create()
        {

            return View();
        }
        [HttpPost, ValidateInput(false)]
        public ActionResult Create(Contact objContact)
        {
            try
            {
                dbObj.Contacts.Add(objContact);
                dbObj.SaveChanges();
                return RedirectToAction("Index");
            }
            catch (Exception)
            {
                return View("Error");
            }
        }

        [HttpGet]
        public ActionResult Details(int id)
        {
            var objContact = dbObj.Contacts.Where(n => n.Id == id).FirstOrDefault();
            return View(objContact);
        }

        [HttpGet]
        public ActionResult Delete(int id)
        {
            var objContact = dbObj.Contacts.Where(n => n.Id == id).FirstOrDefault();
            return View(objContact);
        }
        [HttpPost]
        public ActionResult Delete(Contact objCt)
        {
            var objContact = dbObj.Contacts.Where(n => n.Id == objCt.Id).FirstOrDefault();
            dbObj.Contacts.Remove(objContact);
            dbObj.SaveChanges();
            return RedirectToAction("Index");
        }
        [HttpGet]
        public ActionResult Edit(int id)
        {

            var objContact = dbObj.Contacts.Where(n => n.Id == id).FirstOrDefault();
            return View(objContact);
        }
        [HttpPost, ValidateInput(false)]
        public ActionResult Edit(Contact Contact)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    dbObj.Entry(Contact).State = EntityState.Modified;
                    dbObj.SaveChanges();
                    return RedirectToAction("Index");
                }
                return View(User);

            }
            catch
            {
                return View("Error");
            }
        }
    }
}