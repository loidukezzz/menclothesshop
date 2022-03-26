using ex.Context;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ex.Models
{
    public class CattItem
    {
        public Product _shopping_product { get; set; }
        public int _shopping_quantity {get;set;}
    }
    public class Cart
    {
        List<CattItem> items = new List<CattItem>();
        public IEnumerable<CattItem> Items
        {
            get { return items; }
        }
        public void Add(Product _pro, int _quantity = 1)
        {
            var item = items.FirstOrDefault(m => m._shopping_product.Id == _pro.Id);
            if (item == null)
            {
                items.Add(new CattItem
                {
                    _shopping_product = _pro,
                    _shopping_quantity = _quantity

                });
            }           
            else
            {
                item._shopping_quantity += _quantity;
            }
        }
        public void Update_Quantity_Cart(int id, int _quantity)
        {
            var item = items.Find(m => m._shopping_product.Id == id);
            if(item != null)
            {
                item._shopping_quantity = _quantity;
            }
        }
        public double Total_Money()
        {
            var total = items.Sum(m => m._shopping_product.PriceSale * m._shopping_quantity);
            return (double)total;
        }
        public void Remove_CartItem(int id)
        {
            items.RemoveAll(m => m._shopping_product.Id == id);
        }
    }    
}