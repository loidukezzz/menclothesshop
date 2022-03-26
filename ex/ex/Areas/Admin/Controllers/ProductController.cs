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
    public class ProductController : Controller
    {
        // GET: Admin/Product
        ONLINESHOPEntities dbObj = new ONLINESHOPEntities();
        public ActionResult Index()
        {
            var lstProduct = dbObj.Products.ToList();
            return View(lstProduct);
        }
        [HttpGet]
        public ActionResult Create()
        {
            
            return View();
        }
        [HttpPost, ValidateInput(false)]
        public ActionResult Create(Product objProduct)
        {
            try
            {
                if (objProduct.ImageUpLoad != null)
                {
                    string fileName = Path.GetFileNameWithoutExtension(objProduct.ImageUpLoad.FileName);
                    string extention = Path.GetExtension(objProduct.ImageUpLoad.FileName);
                    fileName = fileName + "_" + long.Parse(DateTime.Now.ToString("yyyMMddhhmmss")) + extention;
                    objProduct.Image = fileName;
                    objProduct.ImageUpLoad.SaveAs(Path.Combine(Server.MapPath("~/Content/img/product/"), fileName));
                }
                dbObj.Products.Add(objProduct);
                dbObj.SaveChanges();
                return RedirectToAction("Index");
            }
            catch (Exception) {
                return View("Error");
            }            
        }

        [HttpGet]
        public ActionResult Details(int id)
        {
            var objProduct = dbObj.Products.Where(n => n.Id == id).FirstOrDefault();
            return View(objProduct);
        }

        [HttpGet]
        public ActionResult Delete(int id)
        { 
            var objProduct = dbObj.Products.Where(n => n.Id == id).FirstOrDefault();
            return View(objProduct);
        }
        [HttpPost]
        public ActionResult Delete(Product  objPro)
        {
            var objProduct = dbObj.Products.Where(n => n.Id == objPro.Id).FirstOrDefault();
            dbObj.Products.Remove(objProduct);
            dbObj.SaveChanges();
            return RedirectToAction("Index");
        }
        [HttpGet]
        public ActionResult Edit(int id)
        {
            
            var objProduct = dbObj.Products.Where(n => n.Id == id).FirstOrDefault();
            return View(objProduct);
        }
        [HttpPost, ValidateInput(false)]
        public ActionResult Edit(Product objProduct)
        {
            try
            {
                if (objProduct.ImageUpLoad != null)
                {
                    string fileName = Path.GetFileNameWithoutExtension(objProduct.ImageUpLoad.FileName);
                    string extention = Path.GetExtension(objProduct.ImageUpLoad.FileName);
                    fileName = fileName + "_" + long.Parse(DateTime.Now.ToString("yyyMMddhhmmss")) + extention;
                    objProduct.Image = fileName;
                    objProduct.ImageUpLoad.SaveAs(Path.Combine(Server.MapPath("~/Content/img/product/"), fileName));
                }
                dbObj.Entry(objProduct).State = EntityState.Modified;
                dbObj.SaveChanges();
                return RedirectToAction("Index");
            }
            catch
            {
                return View(objProduct);
            }
        }
    }
}