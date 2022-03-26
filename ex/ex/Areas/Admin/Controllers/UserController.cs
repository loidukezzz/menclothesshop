using ex.Context;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ex.Areas.Admin.Controllers
{
    public class UserController : Controller
    {
        // GET: Admin/User
        ONLINESHOPEntities dbObj = new ONLINESHOPEntities();
        public ActionResult Index()
        {
            var lstUser = dbObj.Users.ToList();
            return View(lstUser);
        }
        [HttpGet]
        public ActionResult Create()
        {

            return View();
        }
        [HttpPost, ValidateInput(false)]
        public ActionResult Create(User objUser)
        {
            try
            {
                dbObj.Users.Add(objUser);
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
            var objUser = dbObj.Users.Where(n => n.idUser == id).FirstOrDefault();
            return View(objUser);
        }

        [HttpGet]
        public ActionResult Delete(int id)
        {
            var objUser = dbObj.Users.Where(n => n.idUser == id).FirstOrDefault();
            return View(objUser);
        }
        [HttpPost]
        public ActionResult Delete(User objUs)
        {
            var objUser = dbObj.Users.Where(n => n.idUser == objUs.idUser).FirstOrDefault();
            dbObj.Users.Remove(objUser);
            dbObj.SaveChanges();
            return RedirectToAction("Index");
        }
        [HttpGet]
        public ActionResult Edit(int id)
        {

            var objUser = dbObj.Users.Where(n => n.idUser == id).FirstOrDefault();
            return View(objUser);
        }
        [HttpPost, ValidateInput(false)]
        public ActionResult Edit(User User)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    dbObj.Entry(User).State = EntityState.Modified;
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