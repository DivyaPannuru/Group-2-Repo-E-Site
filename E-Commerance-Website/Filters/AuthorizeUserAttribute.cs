using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Filters;

namespace E_Commerance_Website.Filters
{
    public class AuthorizeUserAttribute: ActionFilterAttribute
    {
        public override void OnActionExecuting(ActionExecutingContext context)
        {
            string? username = context.HttpContext.Session.GetString("UserSession");
            if (string.IsNullOrEmpty(username))
            {
                // Redirect to Login Page if session is empty
                context.Result = new RedirectToActionResult("Login", "Account", null);
            }
            base.OnActionExecuting(context);
        }
    }
}
