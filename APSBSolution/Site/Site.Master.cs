using System;
using System.Collections.Generic;
using System.Configuration;
using System.Diagnostics;
using System.Security.Claims;
using System.Security.Principal;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using Site.Models;

namespace Site
{
    public partial class SiteMaster : MasterPage
    {
        private const string AntiXsrfTokenKey = "__AntiXsrfToken";
        private const string AntiXsrfUserNameKey = "__AntiXsrfUserName";
        private string _antiXsrfTokenValue;
        private string _debug = ConfigurationManager.AppSettings["debug"];

        protected void Page_Init(object sender, EventArgs e)
        {
            // O código abaixo ajuda a proteger contra ataques XSRF
            var requestCookie = Request.Cookies[AntiXsrfTokenKey];
            Guid requestCookieGuidValue;
            if (requestCookie != null && Guid.TryParse(requestCookie.Value, out requestCookieGuidValue))
            {
                // Use o token Anti-XSRF do cookie
                _antiXsrfTokenValue = requestCookie.Value;
                Page.ViewStateUserKey = _antiXsrfTokenValue;
            }
            else
            {
                // Gerar um novo token Anti-XSRF e salvar no cookie
                _antiXsrfTokenValue = Guid.NewGuid().ToString("N");
                Page.ViewStateUserKey = _antiXsrfTokenValue;

                var responseCookie = new HttpCookie(AntiXsrfTokenKey)
                {
                    HttpOnly = true,
                    Value = _antiXsrfTokenValue
                };
                if (FormsAuthentication.RequireSSL && Request.IsSecureConnection)
                {
                    responseCookie.Secure = true;
                }
                Response.Cookies.Set(responseCookie);
            }

            Page.PreLoad += master_Page_PreLoad;
        }

        protected void master_Page_PreLoad(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Configurar o token Anti-XSRF
                ViewState[AntiXsrfTokenKey] = Page.ViewStateUserKey;
                ViewState[AntiXsrfUserNameKey] = Context.User.Identity.Name ?? String.Empty;

                //Criar usuário Administrador
                if (_debug=="false")
                {
                    var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
                    var result = manager.FindByName("administrador@apsb.com.br");
                    if (result == null)
                    {
                        var user = new ApplicationUser() { UserName = "administrador@apsb.com.br", Email = "administrador@apsb.com.br" };
                        manager.Create(user, "Pa$$w0rd");
                    }
                }
            }
            else
            {
                // Validar o token Anti-XSRF
                if ((string)ViewState[AntiXsrfTokenKey] != _antiXsrfTokenValue
                    || (string)ViewState[AntiXsrfUserNameKey] != (Context.User.Identity.Name ?? String.Empty))
                {
                    throw new InvalidOperationException("Falha na validação do token Anti-XSRF.");
                }
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {

            if (!Request.IsAuthenticated && Page.Title != "Logon" && Page.Title != "Reports" && _debug == "false")
            {
                Response.Redirect(@"~\Account\Login");
            }
            else 
            {
                //Exibir menu
               
            }
        }

        protected void Unnamed_LoggingOut(object sender, LoginCancelEventArgs e)
        {
            Context.GetOwinContext().Authentication.SignOut(DefaultAuthenticationTypes.ApplicationCookie);
        }
    }

}