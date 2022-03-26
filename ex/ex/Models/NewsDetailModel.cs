using ex.Context;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ex.Models
{
    public class NewsDetailModel
    {
        public News objNews { get; set; }
        public List<News> ListNews { get; set; }
        public List<News> ListNewsNext { get; set; }
    }
}