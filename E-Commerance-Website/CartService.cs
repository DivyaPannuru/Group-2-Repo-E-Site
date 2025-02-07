using E_Commerance_Website;
using System.Collections.Generic;
using System.Linq;

public interface ICartService
{
    void AddToCart(Product product);
    void UpdateQuantity(int productId, int quantity);
    List<cartItem> GetCartItems();
    int GetCartCount();
    void IncrementQuantity(int productId);
    void DecrementQuantity(int productId);
}

public class CartService : ICartService
{
    private readonly IHttpContextAccessor _httpContextAccessor;
    private const string CartSessionKey = "Cart";

    public CartService(IHttpContextAccessor httpContextAccessor)
    {
        _httpContextAccessor = httpContextAccessor;
    }

    public void AddToCart(Product product)
    {
        var cart = GetCartFromSession();
        var existingItem = cart.FirstOrDefault(ci => ci.ProductId == product.Id);

        if (existingItem != null)
        {
            existingItem.Quantity++;
        }
        else
        {
            cart.Add(new cartItem { ProductId = product.Id, Product = product, Quantity = 1 });
        }

        SaveCartToSession(cart);
    }

    public void UpdateQuantity(int productId, int quantity)
    {
        var cart = GetCartFromSession();
        var cartItem = cart.FirstOrDefault(ci => ci.ProductId == productId);

        if (cartItem != null && quantity > 0)
        {
            cartItem.Quantity = quantity;
        }
        else if (cartItem != null)
        {
            cart.Remove(cartItem);
        }

        SaveCartToSession(cart);
    }

    public List<cartItem> GetCartItems()
    {
        return GetCartFromSession();
    }
    public int GetCartCount()
    {
        var cart = GetCartFromSession();
        return cart.Sum(ci => ci.Quantity);
    }
    private List<cartItem> GetCartFromSession()
    {
        var cart = _httpContextAccessor.HttpContext.Session.GetObjectFromJson<List<cartItem>>(CartSessionKey);
        if (cart == null)
        {
            cart = new List<cartItem>();
        }
        return cart;
    }

    private void SaveCartToSession(List<cartItem> cart)
    {
        _httpContextAccessor.HttpContext.Session.SetObjectAsJson(CartSessionKey, cart);
    }

    public void IncrementQuantity(int productId)
    {
        var cart = GetCartFromSession();
        var cartItem = cart.FirstOrDefault(ci => ci.ProductId == productId);

        if (cartItem != null)
        {
            cartItem.Quantity++;
        }

        SaveCartToSession(cart);
    }

    public void DecrementQuantity(int productId)
    {
        var cart = GetCartFromSession();
        var cartItem = cart.FirstOrDefault(ci => ci.ProductId == productId);

        if (cartItem != null && cartItem.Quantity > 1)
        {
            cartItem.Quantity--;
        }

        SaveCartToSession(cart);
    }

}

