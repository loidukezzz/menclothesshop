using ex.Context;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ex.Models
{
    public class ProductCategoryModel
    {
        //public List<Category> listCategory { get; set; }
        public List<Product> listProduct { get; set; }
        public Product prdDealofweek { get; set; }
        public List<Topic> listTopic { get; set; }
        public List<Slider> listSlider { get; set; }
        public List<Slider> listSliderBanner { get; set; }
        public List<News> listNewsHome { get; set; }
        //public List<News> listNews { get; set; }
    }
}