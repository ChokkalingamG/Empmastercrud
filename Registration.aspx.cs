using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SimpleSampleCRUD
{
    public partial class Registration : System.Web.UI.Page
    {
        MainFn MF = new MainFn();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void subbtn_ServerClick(object sender, EventArgs e)
        {
            try
            {
                if (Name_Txt.Value.Trim() != "" && Name_Txt.Value.Trim() != null)
                {
                    if(Pass_Txt.Value.Trim()!="" && Pass_Txt.Value!=null)
                    {
                        string Respons = MF.Reg(Name_Txt.Value.Trim(), Pass_Txt.Value.Trim());
                        if (Respons == "1")
                        {
                            Response.Write("<script>alert('Registration Successfully.. Please Login')</script>");
                            Server.Transfer("Login.aspx");
                        }
                        else if(Respons=="0")
                        {
                            Response.Write("<script>alert('Your Login Details Retrive..Please Login')</script>");
                            Server.Transfer("Login.aspx");
                        }
                    }
                    else
                    {
                        Response.Write("<script>alert('Please Enthe the User Password')</script>");
                    }

                }
                else
                {
                    Response.Write("<script>alert('Please Enthe the User Name')</script>");
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}