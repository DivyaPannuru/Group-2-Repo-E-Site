using Newtonsoft.Json;

namespace E_Commerance_Website
{
    using Microsoft.AspNetCore.Http;
    using System.Collections.Generic;

    public interface ICartService
    {
        void AddProduct(Product product);
        List<Product> GetCartItems();
    }

    public class CartService : ICartService
    {
        private const string CartSessionKey = "Cart";
        private readonly IHttpContextAccessor _httpContextAccessor;

        public CartService(IHttpContextAccessor httpContextAccessor)
        {
            _httpContextAccessor = httpContextAccessor;
        }

        public void AddProduct(Product product)
        {
            var cart = GetCartFromSession();
            cart.Add(product);
            SaveCartToSession(cart);
        }

        public List<Product> GetCartItems()
        {
            return GetCartFromSession();
        }

        private List<Product> GetCartFromSession()
        {
            var cart = _httpContextAccessor.HttpContext.Session.GetObjectFromJson<List<Product>>(CartSessionKey);
            if (cart == null)
            {
                cart = new List<Product>();
            }
            return cart;
        }

        private void SaveCartToSession(List<Product> cart)
        {
            _httpContextAccessor.HttpContext.Session.SetObjectAsJson(CartSessionKey, cart);
        }
    }

   


}
