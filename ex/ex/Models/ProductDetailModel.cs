using ex.Context;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ex.Models
{
    public class ProductDetailModel
    {
        public Product objProduct { get; set; }
        public List<Category> ListCategory { get; set; }
        public List<Product> ListProduct { get; set; }
        //public List<Product> ListProductOfCategory { get; set; }
        public List<Product> ListProductResult { get; set; }
    }
}