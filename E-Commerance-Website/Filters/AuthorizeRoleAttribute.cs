using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Filters;

namespace E_Commerance_Website.Filters
{
    public class AuthorizeRoleAttribute : ActionFilterAttribute
    {
        private readonly string _role;

        public AuthorizeRoleAttribute(string role)
        {
            _role = role;
        }

        public override void OnActionExecuting(ActionExecutingContext context)
        {
            var sessionRole = context.HttpContext.Session.GetString("UserRole");
            if (string.IsNullOrEmpty(sessionRole) || sessionRole != _role)
            {
                context.Result = new RedirectToActionResult("AccessDenied", "Account", null);
            }
            base.OnActionExecuting(context);
        }
    }
}
