using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//using System.Data;
//using System.Data.SqlClient;
//using System.Configuration;

namespace SimpleSampleCRUD
{
    public partial class Login : System.Web.UI.Page
    {
        MainFn LgFunction =new MainFn();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                try
                {
               
                }
                catch (Exception ex)
                {
                    throw ex;
                }
            }
        }

        protected void subbtn_ServerClick(object sender, EventArgs e)
        {
            try
            {
                if (Name_Txt.Value.Trim() != "" && Name_Txt.Value.Trim() != null)
                {
                    if(Pass_Txt.Value.Trim() != "" && Pass_Txt.Value.Trim() != null)
                    {
                       string Login_Response= LgFunction.Login(Name_Txt.Value.Trim(), Pass_Txt.Value.Trim());
                       if (Login_Response != "")
                       {
                           Session["Userid"] = Login_Response.ToString();
                           Response.Redirect("Main.aspx");
                       }
                       else
                       {
                           Response.Write("<script>alert('Please Registration')</script>");
                           Server.Transfer("Registration.aspx");
                       }
                    }
                    else
                    {
                        Response.Write("<script>alert('Please Enter the Password')</script>");
                    }
                }
                else
                {
                    Response.Write("<script>alert('Please Enter the User Name')</script>");
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                
            }
        }
    }
}