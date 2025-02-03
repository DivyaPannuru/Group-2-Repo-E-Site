using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using E_Commerance_Website;
using Microsoft.CodeAnalysis;
using Microsoft.AspNetCore.Cors.Infrastructure;

namespace E_Commerance_Website.Controllers
{
    public class ProductsController : Controller
    {
        private readonly MyDbContext _context;
        private readonly CartService _cartService;

        public ProductsController(MyDbContext context,CartService cartservice)
        {
            _context = context;
            _cartService = cartservice;
        }

        // GET: Products
        public async Task<IActionResult> Index()
        {
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
            _cartService.AddToCart(productid);
            return RedirectToAction("Index");
        }
    }

}
