using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.CodeAnalysis;
using Microsoft.AspNetCore.Cors.Infrastructure;
using E_Commerance_Website.Middlewares;
using E_Commerance_Website.Filters;
using E_Commerance_Website.Services;
using System.Net.Cache;
namespace E_Commerance_Website.Controllers
{
    
    [AuthorizeUser]
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
            ViewBag.CartItemCount = _cartService.GetCartItems().Count;
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
        public IActionResult AddToCart(int productid)
        {
           
            Product product = _context.Products
                .FirstOrDefault(m => m.Id == productid); 
           // if(HttpContext.Session.SetObjectAsJson("Product", product)!=null)
            HttpContext.Session.SetObjectAsJson("Product", product);
            _cartService.AddProduct(product);
            return RedirectToAction("Index");
        }
        public IActionResult ViewCart()
        {
            ViewBag.CartItemCount = _cartService.GetCartItems().Count;
            var cartItems = _cartService.GetCartItems();
            return View(cartItems);
        }
    }

}
