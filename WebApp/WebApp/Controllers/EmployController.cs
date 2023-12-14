using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace WebApp.Controllers
{
    [Authorize(Roles = "Employ")]
    [Authorize(AuthenticationSchemes = "Employ")]
    public class EmployController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
