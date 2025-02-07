using Microsoft.AspNetCore.Mvc;

namespace E_Commerance_Website.Controllers
{
    public class AccountController : Controller
    {     
        
        private readonly Dictionary<string, (string Password, string Role)> users = new()
        {
            { "Admin", ("password123", "Admin") },
            { "Pragati", ("password123", "User") },
            { "Divya", ("password123", "User") }
        };

        public IActionResult Login(string returnUrl = null)
        {
            ViewData["ReturnUrl"] = returnUrl;
            return View();
        }

        [HttpPost]
        public IActionResult Login(string username, string password, bool rememberMe, string returnUrl)
        {
            ViewData["ReturnUrl"] = returnUrl;
            if (users.ContainsKey(username) && users[username].Password == password)
            {
                HttpContext.Session.SetString("UserSession", username);
                HttpContext.Session.SetString("UserRole", users[username].Role);

                if (rememberMe)
                {
                    Response.Cookies.Append("UserSession", username, new CookieOptions
                    {
                        Expires = DateTime.UtcNow.AddDays(7),
                        HttpOnly = true
                    });
                    Response.Cookies.Append("UserRole", users[username].Role, new CookieOptions
                    {
                        Expires = DateTime.UtcNow.AddDays(7),
                        HttpOnly = true
                    });
                }

                if (!string.IsNullOrEmpty(returnUrl) && Url.IsLocalUrl(returnUrl))
                {
                    return Redirect(returnUrl);
                }
                else
                {
                    return RedirectToAction("Index", "Home");
                }
                //return RedirectToAction("Index", "Home");
            }

            ViewBag.Error = "Invalid Credentials!";
            return View();
        }

        public IActionResult Logout()
        {
            
            HttpContext.Session.Clear();
            Response.Cookies.Delete("UserSession");
            Response.Cookies.Delete("UserRole");
            return RedirectToAction("Login");
        }

        public IActionResult AccessDenied()
        {
            return View();
        }
    }
}
