using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SimpleSampleCRUD
{
    public partial class Main : System.Web.UI.Page
    {
        Employeedetails fn = new Employeedetails();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void addbtn_ServerClick(object sender, EventArgs e)
        {
            try
            {
                if (emp_name_txt.Value.Trim() != "" && emp_add_txt.Value.Trim() != "" && emp_dob_txt.Value.Trim() != "")
                {
                    fn.add_details(emp_name_txt.Value.Trim(), emp_add_txt.Value.Trim(), emp_dob_txt.Value.Trim(), Convert.ToInt32(Session["Userid"]));
                 
                }
                else
                {
                    Response.Write("<script>alert('Please Enter all Details')</script>");
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}