using ex.Context;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ex.Areas.Admin.Controllers
{
    public class OrderDetailController : Controller
    {
        // GET: Admin/OrderDetail
        ONLINESHOPEntities dbObj = new ONLINESHOPEntities();
        public ActionResult Index()
        {
            var lstOrderDetail = dbObj.OrderDetails.ToList();
            return View(lstOrderDetail);
        }
        [HttpGet]
        public ActionResult Create()
        {

            return View();
        }
        [HttpPost, ValidateInput(false)]
        public ActionResult Create(OrderDetail objOrderDetail)
        {
            try
            {
                dbObj.OrderDetails.Add(objOrderDetail);
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
            var objOrderDetail = dbObj.OrderDetails.Where(n => n.Id == id).FirstOrDefault();
            return View(objOrderDetail);
        }

        [HttpGet]
        public ActionResult Delete(int id)
        {
            var objOrderDetail = dbObj.OrderDetails.Where(n => n.Id == id).FirstOrDefault();
            return View(objOrderDetail);
        }
        [HttpPost]
        public ActionResult Delete(Contact objOrdDetail)
        {
            var objOrderDetail = dbObj.OrderDetails.Where(n => n.Id == objOrdDetail.Id).FirstOrDefault();
            dbObj.OrderDetails.Remove(objOrderDetail);
            dbObj.SaveChanges();
            return RedirectToAction("Index");
        }
        [HttpGet]
        public ActionResult Edit(int id)
        {

            var objOrderDetail = dbObj.OrderDetails.Where(n => n.Id == id).FirstOrDefault();
            return View(objOrderDetail);
        }
        [HttpPost, ValidateInput(false)]
        public ActionResult Edit(OrderDetail OrderDetail)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    dbObj.Entry(OrderDetail).State = EntityState.Modified;
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