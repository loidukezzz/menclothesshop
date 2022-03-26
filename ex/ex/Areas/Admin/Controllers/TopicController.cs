using ex.Context;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ex.Areas.Admin.Controllers
{
    public class TopicController : Controller
    {
        // GET: Admin/Topic
        ONLINESHOPEntities dbObj = new ONLINESHOPEntities();
        public ActionResult Index()
        {
            var lstTopic = dbObj.Topics.ToList();
            return View(lstTopic);
        }
        [HttpGet]
        public ActionResult Create()
        {

            return View();
        }
        [HttpPost, ValidateInput(false)]
        public ActionResult Create(Topic objTopic)
        {
            try
            {               
                dbObj.Topics.Add(objTopic);
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
            var objTopic = dbObj.Topics.Where(n => n.Id == id).FirstOrDefault();
            return View(objTopic);
        }

        [HttpGet]
        public ActionResult Delete(int id)
        {
            var objTopic = dbObj.Topics.Where(n => n.Id == id).FirstOrDefault();
            return View(objTopic);
        }
        [HttpPost]
        public ActionResult Delete(Topic objTopc)
        {
            var objTopic = dbObj.Topics.Where(n => n.Id == objTopc.Id).FirstOrDefault();
            dbObj.Topics.Remove(objTopic);
            dbObj.SaveChanges();
            return RedirectToAction("Index");
        }
        [HttpGet]
        public ActionResult Edit(int id)
        {

            var objTopic = dbObj.Topics.Where(n => n.Id == id).FirstOrDefault();
            return View(objTopic);
        }
        [HttpPost, ValidateInput(false)]
        public ActionResult Edit(Topic Topic)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    dbObj.Entry(Topic).State = EntityState.Modified;
                    dbObj.SaveChanges();
                    return RedirectToAction("Index");
                }
                return View(Topic);

            }
            catch
            {
                return View("Error");
            }
        }
    }
}