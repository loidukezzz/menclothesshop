using ex.Context;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ex.Areas.Admin.Controllers
{
    public class OrderController : Controller
    {
        // GET: Admin/Order
        ONLINESHOPEntities dbObj = new ONLINESHOPEntities();
        public ActionResult Index()
        {
            var lstOrder = dbObj.Orders.ToList();
            return View(lstOrder);
        }
        [HttpGet]
        public ActionResult Create()
        {

            return View();
        }
        [HttpPost, ValidateInput(false)]
        public ActionResult Create(Order objOrder)
        {
            try
            {
                dbObj.Orders.Add(objOrder);
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
            var objOrder = dbObj.Orders.Where(n => n.Id == id).FirstOrDefault();
            return View(objOrder);
        }

        [HttpGet]
        public ActionResult Delete(int id)
        {
            var objOrder = dbObj.Orders.Where(n => n.Id == id).FirstOrDefault();
            return View(objOrder);
        }
        [HttpPost]
        public ActionResult Delete(Order objOrd)
        {
            var objOrder = dbObj.Topics.Where(n => n.Id == objOrd.Id).FirstOrDefault();
            dbObj.Topics.Remove(objOrder);
            dbObj.SaveChanges();
            return RedirectToAction("Index");
        }
        [HttpGet]
        public ActionResult Edit(int id)
        {

            var objOrder = dbObj.Orders.Where(n => n.Id == id).FirstOrDefault();
            return View(objOrder);
        }
        [HttpPost, ValidateInput(false)]
        public ActionResult Edit(Order Order)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    dbObj.Entry(Order).State = EntityState.Modified;
                    dbObj.SaveChanges();
                    return RedirectToAction("Index");
                }
                return View(Order);

            }
            catch
            {
                return View("Error");
            }
        }
    }
}