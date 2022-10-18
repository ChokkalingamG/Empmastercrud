using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace SimpleSampleCRUD
{
    /// <summary>
    /// Summary description for WebService1
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class WebService1 : System.Web.Services.WebService
    {

        readonly string Emp_concon_webservice = ConfigurationManager.ConnectionStrings["EmpConnection"].ToString();
        [WebMethod]
        public string HelloWorld()
        {
            return "Hello World";
        }


       [WebMethod]
        public string Editfunction(string _Search_txt)
        {
            try
            {
                string getemmadd="";
                using (SqlConnection webservice_con = new SqlConnection(Emp_concon_webservice))
                {
                    
                    SqlCommand cmd = new SqlCommand("MSP_Getdata", webservice_con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    webservice_con.Open();
                    SqlDataReader _dr = cmd.ExecuteReader();
                    webservice_con.Close();
                    while (_dr.Read())
                    {
                        getemmadd = _dr[1].ToString();
                    }
                    
                }
                return getemmadd;
             
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
