using ClassLibrary.Models;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Mvc;
using System.Security.Claims;
using WebApp.Models;

namespace WebApp.Controllers
{
    public class LoginController : BaseController
    {
        private DataContextContext _db;
        public LoginController()
        {
            _db = new DataContextContext();
        }
        public IActionResult Index()
        {
            return View();
        }
        [HttpPost]
        public IActionResult Index(LoginModel model)
        {
            if (ModelState.IsValid)
            {
                var username = model.UserName;
                var password = model.Password;
                if (!string.IsNullOrEmpty(username) && string.IsNullOrEmpty(password))
                {
                    return RedirectToAction("Index");
                }
                var user = _db.Users.Where(x => x.Username.Contains(username) && x.Password.Contains(password));
                if (user != null)
                {
                    var _roleName = _db.Roles.Where(x => x.RoleId == user.First().RoleId).First().Name;
                    var claims = new List<Claim>() {
                        new Claim(ClaimTypes.Name, username),
                        new Claim(ClaimTypes.Role, _roleName),
                    };
                    var identity = new ClaimsIdentity(claims, _roleName);
                    var principal = new ClaimsPrincipal(identity);
                    HttpContext.SignInAsync(_roleName, principal, new AuthenticationProperties()
                    {
                        IsPersistent = true
                    });
                    //SetAlert("Đăng nhập thành công!", "success");
                    var routeValues = new RouteValueDictionary
                {
                    //{"area","Admin" },
                    {"returnURL",Request.Query["ReturnUrl"] },
                    {"claimValue","true" }
                };

                    //TempData["Info"] = "Admin";
                    if (TempData["ReturnUrl"] != null)
                    {
                        return Redirect(TempData["ReturnUrl"].ToString());
                    }
                    return RedirectToAction("Index", "Home", routeValues);
                }
                else
                {
                    SetAlert("Tên đăng nhập hoặc mật khẩu không đúng!", "error");
                    /*                    TempData["Fail"] = "Tên đăng nhập hoặc mật khẩu không đúng!";*/
                }
            }
            else
            {
                ModelState.AddModelError("Error",
                                 "Please input field full!");
            }
            return View(model);
        }
    }
}
