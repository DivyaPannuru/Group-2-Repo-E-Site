using System.Diagnostics;
using E_Commerance_Website.Models;
using E_Commerance_Website.Services;
using Microsoft.AspNetCore.Cors.Infrastructure;
using Microsoft.AspNetCore.Mvc;

namespace E_Commerance_Website.Controllers
{
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;
        private readonly ICartService _cartService;

        public HomeController(ILogger<HomeController> logger, ICartService cartService)
        {
            _logger = logger;
            _cartService = cartService;
        }

        public IActionResult Index()
        {
            if (HttpContext.Session.GetInt32("CartCount") <= 0)
                HttpContext.Session.SetInt32("CartCount", 0);
            else
            {
                var cartItems = _cartService.GetCartItems();
                ViewBag.CartItemCount = _cartService.GetCartCount();
                return View(cartItems);
            }
            return View();
        }

        public IActionResult Privacy()
        {
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}
