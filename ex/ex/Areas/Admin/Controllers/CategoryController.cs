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
    public class CategoryController : Controller
    {
        // GET: Admin/Category
        ONLINESHOPEntities dbObj = new ONLINESHOPEntities();
        public ActionResult Index()
        {
            var lstCategory = dbObj.Categories.ToList();
            return View(lstCategory);
        }
        [HttpGet]
        public ActionResult Create()
        {

            return View();
        }
        [HttpPost]
        public ActionResult Create(Category objCategory)
        {
            try
            {
                if (objCategory.ImageUpLoad != null)
                {
                    string fileName = Path.GetFileNameWithoutExtension(objCategory.ImageUpLoad.FileName);
                    string extention = Path.GetExtension(objCategory.ImageUpLoad.FileName);
                    fileName = fileName + "_" + long.Parse(DateTime.Now.ToString("yyyMMddhhmmss")) + extention;
                    objCategory.Image = fileName;
                    objCategory.ImageUpLoad.SaveAs(Path.Combine(Server.MapPath("~/Content/img/"), fileName));
                }
                dbObj.Categories.Add(objCategory);
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
            var objCategory = dbObj.Categories.Where(n => n.Id == id).FirstOrDefault();
            return View(objCategory);
        }

        [HttpGet]
        public ActionResult Delete(int id)
        {
            var objCategory = dbObj.Categories.Where(n => n.Id == id).FirstOrDefault();
            return View(objCategory);
        }
        [HttpPost]
        public ActionResult Delete(Category objcat)
        {
            var objCategory = dbObj.Categories.Where(n => n.Id == objcat.Id).FirstOrDefault();
            dbObj.Categories.Remove(objCategory);
            dbObj.SaveChanges();
            return RedirectToAction("Index");
        }
        [HttpGet]
        public ActionResult Edit(int id)
        {
            var objCategory = dbObj.Categories.Where(n => n.Id == id).FirstOrDefault();
            return View(objCategory);
        }
        [HttpPost]
        public ActionResult Edit(Product objCategory)
        {
            try
            {
                if (objCategory.ImageUpLoad != null)
                {
                    string fileName = Path.GetFileNameWithoutExtension(objCategory.ImageUpLoad.FileName);
                    string extention = Path.GetExtension(objCategory.ImageUpLoad.FileName);
                    fileName = fileName + "_" + long.Parse(DateTime.Now.ToString("yyyMMddhhmmss")) + extention;
                    objCategory.Image = fileName;
                    objCategory.ImageUpLoad.SaveAs(Path.Combine(Server.MapPath("~/Content/img/"), fileName));
                }
                dbObj.Entry(objCategory).State = EntityState.Modified;
                dbObj.SaveChanges();
                return RedirectToAction("Index");
            }
            catch {
                return View(objCategory);
            }
        }
        public ActionResult Error()
        {
            return View("Error");
        }
    }
}