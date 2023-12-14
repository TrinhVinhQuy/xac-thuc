using Microsoft.AspNetCore.Authentication.Cookies;

namespace WebApp
{
	public class Program
	{
		public static void Main(string[] args)
		{
			var builder = WebApplication.CreateBuilder(args);
            builder.Services.AddAuthentication(CookieAuthenticationDefaults.AuthenticationScheme).AddCookie(options =>
            {
                options.LoginPath = "/Home/Error";
                options.ReturnUrlParameter = "returnUrl";
            }).AddCookie("Admin", options =>
            {
                options.LoginPath = new PathString("/Home/Error");
            })
            .AddCookie("User", options =>
            {
                options.LoginPath = new PathString("/Home/Error");
            })
            .AddCookie("Employ", options =>
            {
                options.LoginPath = new PathString("/Home/Error");
            });
            // Add services to the container.
            builder.Services.AddControllersWithViews();

			var app = builder.Build();

			// Configure the HTTP request pipeline.
			if (!app.Environment.IsDevelopment())
			{
				app.UseExceptionHandler("/Home/Error");
				// The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
				app.UseHsts();
			}

			app.UseHttpsRedirection();
			app.UseStaticFiles();

			app.UseRouting();

			app.UseAuthorization();

			app.MapControllerRoute(
				name: "default",
				pattern: "{controller=Login}/{action=Index}/{id?}");
			app.Run();
		}
	}
}