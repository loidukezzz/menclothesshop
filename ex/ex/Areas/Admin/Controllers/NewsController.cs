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
    public class NewsController : Controller
    {
        // GET: Admin/News
        ONLINESHOPEntities dbObj = new ONLINESHOPEntities();
        public ActionResult Index()
        {
            var lstNews = dbObj.News.ToList();
            return View(lstNews);
        }
        [HttpGet]
        public ActionResult Create()
        {

            return View();
        }
        [HttpPost, ValidateInput(false)]
        public ActionResult Create(News objNews)
        {
            try
            {
                if (objNews.ImageUpLoad != null)
                {
                    string fileName = Path.GetFileNameWithoutExtension(objNews.ImageUpLoad.FileName);
                    string extention = Path.GetExtension(objNews.ImageUpLoad.FileName);
                    fileName = fileName + "_" + long.Parse(DateTime.Now.ToString("yyyMMddhhmmss")) + extention;
                    objNews.Image = fileName;
                    objNews.ImageUpLoad.SaveAs(Path.Combine(Server.MapPath("~/Content/img/blog/"), fileName));
                }
                dbObj.News.Add(objNews);
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
            var objNews = dbObj.News.Where(n => n.Id == id).FirstOrDefault();
            return View(objNews);
        }

        [HttpGet]
        public ActionResult Delete(int id)
        {
            var objNews = dbObj.News.Where(n => n.Id == id).FirstOrDefault();
            return View(objNews);
        }
        [HttpPost]
        public ActionResult Delete(Product objPro)
        {
            var objNews = dbObj.News.Where(n => n.Id == objPro.Id).FirstOrDefault();
            dbObj.News.Remove(objNews);
            dbObj.SaveChanges();
            return RedirectToAction("Index");
        }
        [HttpGet]
        public ActionResult Edit(int id)
        {
            var objNews = dbObj.News.Where(n => n.Id == id).FirstOrDefault();
            return View(objNews);
        }
        [HttpPost, ValidateInput(false)]
        public ActionResult Edit(News objNews)
        {
            try
            {
                if (objNews.ImageUpLoad != null)
                {
                    string fileName = Path.GetFileNameWithoutExtension(objNews.ImageUpLoad.FileName);
                    string extention = Path.GetExtension(objNews.ImageUpLoad.FileName);
                    fileName = fileName + "_" + long.Parse(DateTime.Now.ToString("yyyMMddhhmmss")) + extention;
                    objNews.Image = fileName;
                    objNews.ImageUpLoad.SaveAs(Path.Combine(Server.MapPath("~/Content/img/blog/"), fileName));
                }
                dbObj.Entry(objNews).State = EntityState.Modified;
                dbObj.SaveChanges();
                return RedirectToAction("Index");
            }
            catch
            {
                return View(objNews);
            }
        }
    }
}