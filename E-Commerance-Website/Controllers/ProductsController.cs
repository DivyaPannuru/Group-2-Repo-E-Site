using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.CodeAnalysis;
using E_Commerance_Website.Filters;
using Microsoft.AspNetCore.Mvc.Rendering;
namespace E_Commerance_Website.Controllers
{

 
    public class ProductsController : Controller
    {
        private readonly MyDbContext _context;
        private readonly ICartService _cartService;
        public ProductsController(MyDbContext context, ICartService cartService)
        {
            _context = context;
            _cartService = cartService;

        }
        //public ProductsController(ICartService cartService)
        //{
           
        //}

        // GET: Products
        public async Task<IActionResult> Index()
        {
                var cartItems = _cartService.GetCartItems();
                ViewBag.CartItemCount = _cartService.GetCartCount();
                return View(await _context.Products.Include(p => p.Category).ToListAsync());
        }

        // GET: Products/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var product = await _context.Products
                .Include(p => p.Category)
                .FirstOrDefaultAsync(m => m.Id == id);

            if (product == null)
            {
                return NotFound();
            }

            return View(product);
        }

        // Other action methods for Create, Edit, Delete...
        [HttpPost]
        public IActionResult AddToCart(int productId)
        {
            //var product = new Product // Replace with actual product retrieval logic
            //{
            //    Id = productId,
            //    Name = "Sample Product",
            //    Price = 10.00m
            //};
            var product = (from a in _context.Products where a.Id == productId
                          select a).FirstOrDefault(); 
            _cartService.AddToCart(product);
            ViewBag.CartItemCount = _cartService.GetCartItems().Count;
            return RedirectToAction("Index");
        }

        [HttpPost]
        public IActionResult UpdateQuantity(int productId, int quantity)
        {
            _cartService.UpdateQuantity(productId, quantity);
            ViewBag.CartItemCount = _cartService.GetCartItems().Count;
            return RedirectToAction("Index");
        }
        public IActionResult ViewCart()
        {
            var cartItems = _cartService.GetCartItems();
            ViewBag.CartItemCount = _cartService.GetCartCount();
      //      var cartItems = _cartService.GetCartItems();
            return View(cartItems);
        }
        [HttpPost]
        public IActionResult IncrementQuantity(int productId)
        {
            _cartService.IncrementQuantity(productId);
            return RedirectToAction("ViewCart");
        }

        [HttpPost]
        public IActionResult DecrementQuantity(int productId)
        {
            _cartService.DecrementQuantity(productId);
            return RedirectToAction("ViewCart");
        }
        [AuthorizeRole("User")]
        public IActionResult Submit()
        {
            //ViewBag.CartItemCount = _cartService.GetCartItems().Count;
            var cartItems = _cartService.GetCartItems();
            ////return RedirectToAction("AddToCart", "Orders");
            //ViewData["CustomerId"] = new SelectList(_context.Customers, "Id", "Id");
            //ViewData["OrderStatusId"] = new SelectList(_context.Set<OrderStatus>(), "Id", "Id");

            //var Order = new Order
            //{
            //    OrderDate = DateTime.Now,
            //    OrderStatusId = 1,
            //    CustomerId = 1
            //};
            Order order = new Order();
            order.Id= _context.Orders.Max(o => o.Id);
            order.OrderStatus.Status = "Pending";
            order.OrderDate = DateTime.Now;
           
            foreach (var cartItem in cartItems)
            {
                order.OrderDetails = [];
                OrderDetail detail = new OrderDetail
                {
                    Quantity = 1,
                    UnitPrice = cartItem.Product.Price,
                    ProductId = cartItem.ProductId
                };
                order.OrderDetails.Add(detail);
            }
            return View(order);
        }
    }

}
