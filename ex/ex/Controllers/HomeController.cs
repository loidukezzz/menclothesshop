using ex.Context;
using ex.Models;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web.Mvc;

namespace ex.Controllers
{
    public class HomeController : Controller
    {
        // GET: Home
        ONLINESHOPEntities objModel = new ONLINESHOPEntities();
        public ActionResult Index()
        {
            if (Session["idUser"] != null)
            {
                try
                {
                    ProductCategoryModel objProductCategoryModel = new ProductCategoryModel();

                    var lstProduct = objModel.Products.Where(m => m.HotSale == 1 && m.Status == 1).ToList();
                    var lstTopic = objModel.Topics.Where(m => m.Status == 1).ToList();
                    var prddoweek = objModel.Products.Where(m => m.DealOfWeek == 1 && m.Status == 1).FirstOrDefault();
                    var lstSlider = objModel.Sliders.Where(m => m.Status == 1 && m.Orders == 1).ToList();
                    var lstSliderBanner = objModel.Sliders.Where(m => m.Orders == 2).ToList();
                    var lstNewsHome = objModel.News.Where(m => m.Status == 1).ToList();

                    objProductCategoryModel.listSlider = lstSlider;
                    objProductCategoryModel.listProduct = lstProduct;
                    objProductCategoryModel.listTopic = lstTopic;
                    objProductCategoryModel.prdDealofweek = prddoweek;
                    objProductCategoryModel.listSliderBanner = lstSliderBanner;
                    objProductCategoryModel.listNewsHome = lstNewsHome;

                    //objProductCategoryModel.listNews = lstNews;
                    return View(objProductCategoryModel);
                }
                catch
                {
                    return View("Error");
                }
            }
            return View("Login");
        }

        //GET: Register
        public ActionResult Register()
        {
            return View();
        }
        //POST: Register
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Register(User _user)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    var check = objModel.Users.FirstOrDefault(s => s.Email == _user.Email);
                    if (check == null)
                    {
                        _user.Password = GetMD5(_user.Password);
                        objModel.Configuration.ValidateOnSaveEnabled = false;
                        objModel.Users.Add(_user);
                        objModel.SaveChanges();
                        return RedirectToAction("Index");
                    }
                    else
                    {
                        ViewBag.error = "Email đã tồn tại";
                        return View();
                    }
                }
                return View();
            }
            catch
            {
                ViewBag.error = "Vui lòng nhập đầy đủ thông tin";
                return View();
            }
        }
        //GET: Register
        public ActionResult Login()
        {
            return View();
        }
        //POST: Register
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Login(string email, string password)
        {
            if (ModelState.IsValid)
            {
                var f_password = GetMD5(password);
                var data = objModel.Users.Where(s => s.Email.Equals(email) && s.Password.Equals(f_password)).ToList();
                if (data.Count() > 0)
                {
                    //add session
                    Session["FullName"] = data.FirstOrDefault().FirstName + " " + data.FirstOrDefault().LastName;
                    Session["Email"] = data.FirstOrDefault().Email;
                    Session["idUser"] = data.FirstOrDefault().idUser;
                    return RedirectToAction("Index");
                }
                else
                {
                    ViewBag.error = "Đăng nhập thất bại. Vui lòng thử lại!";
                    return RedirectToAction("Login");
                }
            }
            return View();
        }

        //Logout
        public ActionResult Logout()
        {
            Session.Clear();//remove session
            return RedirectToAction("Login");
        }
        //Create a string MD5
        public static string GetMD5(string str)
        {
            MD5 md5 = new MD5CryptoServiceProvider();
            byte[] fromData = Encoding.UTF8.GetBytes(str);
            byte[] targetData = md5.ComputeHash(fromData);
            string byte2String = null;

            for(int i= 0; i < targetData.Length; i++)
            {
                byte2String += targetData[i].ToString("x2");
            }
            return byte2String;
        }
    }
}