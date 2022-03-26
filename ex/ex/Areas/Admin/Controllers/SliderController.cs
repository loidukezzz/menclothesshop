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
    public class SliderController : Controller
    {
        // GET: Admin/Slider
        ONLINESHOPEntities dbObj = new ONLINESHOPEntities();
        public ActionResult Index()
        {
            var lstSlider = dbObj.Sliders.ToList();
            return View(lstSlider);
        }
        [HttpGet]
        public ActionResult Create()
        {

            return View();
        }
        [HttpPost, ValidateInput(false)]
        public ActionResult Create(Slider objSlider)
        {
            try
            {
                if (objSlider.ImageUpLoad != null)
                {
                    string fileName = Path.GetFileNameWithoutExtension(objSlider.ImageUpLoad.FileName);
                    string extention = Path.GetExtension(objSlider.ImageUpLoad.FileName);
                    fileName = fileName + "_" + long.Parse(DateTime.Now.ToString("yyyMMddhhmmss")) + extention;
                    objSlider.Img = fileName;
                    objSlider.ImageUpLoad.SaveAs(Path.Combine(Server.MapPath("~/Content/img/banner/"), fileName));
                }
                dbObj.Sliders.Add(objSlider);
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
            var objSlider = dbObj.Sliders.Where(n => n.Id == id).FirstOrDefault();
            return View(objSlider);
        }

        [HttpGet]
        public ActionResult Delete(int id)
        {
            var objSlider = dbObj.Sliders.Where(n => n.Id == id).FirstOrDefault();
            return View(objSlider);
        }
        [HttpPost]
        public ActionResult Delete(Slider objSli)
        {
            var objSlider = dbObj.Products.Where(n => n.Id == objSli.Id).FirstOrDefault();
            dbObj.Products.Remove(objSlider);
            dbObj.SaveChanges();
            return RedirectToAction("Index");
        }
        [HttpGet]
        public ActionResult Edit(int id)
        {

            var objSlider = dbObj.Sliders.Where(n => n.Id == id).FirstOrDefault();
            return View(objSlider);
        }
        [HttpPost, ValidateInput(false)]
        public ActionResult Edit(Slider objSlider)
        {
            try
            {
                if (objSlider.ImageUpLoad != null)
                {
                    string fileName = Path.GetFileNameWithoutExtension(objSlider.ImageUpLoad.FileName);
                    string extention = Path.GetExtension(objSlider.ImageUpLoad.FileName);
                    fileName = fileName + "_" + long.Parse(DateTime.Now.ToString("yyyMMddhhmmss")) + extention;
                    objSlider.Img = fileName;
                    objSlider.ImageUpLoad.SaveAs(Path.Combine(Server.MapPath("~/Content/img/banner/"), fileName));
                }
                dbObj.Entry(objSlider).State = EntityState.Modified;
                dbObj.SaveChanges();
                return RedirectToAction("Index");

            }
            catch
            {
                return View(objSlider);
            }
        }
    }
}
