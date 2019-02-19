using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.DependencyInjection;

using PeachPied.WordPress.AspNetCore;

namespace Server
{
    public class Startup
    {
        // This method gets called by the runtime. Use this method to add services to the container.
        // For more information on how to configure your application, visit https://go.microsoft.com/fwlink/?LinkID=398940
        public void ConfigureServices(IServiceCollection services)
        {
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IHostingEnvironment env)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }
            if(env.IsStaging() || env.IsProduction())
            {
                app.UseHsts();
            }
            app.UseHttpsRedirection();
            
            app.UseWordPress();
            app.UseWhen(context => !context.Request.Path.Value.EndsWith(".php"), appBuilder => appBuilder.UseDefaultFiles());
        }
    }
}
