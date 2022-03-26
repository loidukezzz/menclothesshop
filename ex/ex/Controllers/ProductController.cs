using ex.Context;
using ex.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;


namespace ex.Controllers
{
    public class ProductController : Controller
    {
        // GET: Product
        ONLINESHOPEntities objModel = new ONLINESHOPEntities();
        public ActionResult ProductDetail(int Id)
        {
            try
            {
                var objProduct = objModel.Products.Where(n => n.Id == Id).FirstOrDefault();
                var lstProduct = objModel.Products.Where(m => m.Status == 1).ToList();
                var lstProductResult = objModel.Products.Where(n => n.CategoryId == objProduct.CategoryId).ToList();

                ProductDetailModel objProductDetailModel = new ProductDetailModel();

                objProductDetailModel.objProduct = objProduct;
                objProductDetailModel.ListProductResult = lstProductResult;
                objProductDetailModel.ListProduct = lstProduct;
                return View(objProductDetailModel);
            }
            catch
            {
                return View("Error");
            }
        }
        public ActionResult AllProduct(/*int id*/)
        {
            try
            {
                var allProduct = objModel.Products.Where(m => m.Status == 1).ToList();
                var lstCategory = objModel.Categories.ToList();
                ProductDetailModel objProductDetailModel = new ProductDetailModel();
                objProductDetailModel.ListCategory = lstCategory;
                objProductDetailModel.ListProduct = allProduct;
                return View("AllProduct", objProductDetailModel);
            }
            catch
            {
                return View("Error");
            }
        }
        //public ActionResult Category(int id)
        //{
        //    var lstCategory = objModel.Categories.ToList();
        //    ProductDetailModel objProductDetailModel = new ProductDetailModel();
        //    objProductDetailModel.ListCategory = lstCategory;
        //    return View("Category", objProductDetailModel);
        //}
        //public ActionResult lstProduct(int id )
        //{           
        //    ProductDetailModel objProductDetailModel = new ProductDetailModel();
        //    if (lstProduct(id)!=null)
        //    {
        //        var Product = objModel.Products.Where(m => m.CategoryId == id).ToList();
        //        objProductDetailModel.ListProduct = Product;
        //    }
        //    else
        //    {
        //        var AllProduct = objModel.Products.ToList();
        //        objProductDetailModel.ListProduct = AllProduct;
                
        //    }
        //    return View("lstProduct",objProductDetailModel);
        //}
    }
}