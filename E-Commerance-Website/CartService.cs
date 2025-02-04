using Newtonsoft.Json;

namespace E_Commerance_Website
{

    public interface ICartService
    {
        void AddProduct(int productId);
        int GetCartItemCount();
    }

    public class CartService : ICartService
    {
        private List<int> _cart;

        public CartService()
        {
            _cart = new List<int>();
        }

        public void AddProduct(int productId)
        {
            _cart.Add(productId);
        }

        public int GetCartItemCount()
        {
            return _cart.Count;
        }
    }

}
