using ex.Context;
using ex.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ex.Controllers
{
    public class NewsController : Controller
    {
        // GET: News
        ONLINESHOPEntities objModel = new ONLINESHOPEntities();
        public ActionResult NewsDetail(int Id)
        {
            try
            {
                var objNews = objModel.News.Where(n => n.Id == Id).FirstOrDefault();


                var lstNews = objModel.News.ToList();
                var lstNewsNext = objModel.News.Where(n => n.Status == 1 && n.Id != objNews.Id).ToList();
                NewsDetailModel objNewsDetailModel = new NewsDetailModel();

                objNewsDetailModel.objNews = objNews;
                objNewsDetailModel.ListNews = lstNews;
                objNewsDetailModel.ListNewsNext = lstNewsNext;
                return View(objNewsDetailModel);
            }
            catch
            {
                return View("Error");
            }
        }
        public ActionResult AllNews()
        {
            try
            {
                var allNews = objModel.News.ToList();
                NewsDetailModel objNewsDetailModel = new NewsDetailModel();
                objNewsDetailModel.ListNews = allNews;
                return View(objNewsDetailModel);
            }
            catch
            {
                return View("Error");
            }
        }
    }
}