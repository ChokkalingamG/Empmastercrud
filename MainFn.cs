using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;


namespace SimpleSampleCRUD
{
    public class MainFn
    {
        readonly string Emp_concon = ConfigurationManager.ConnectionStrings["EmpConnection"].ToString();
        readonly string Login_Sp = "LoginAuthentication";
        readonly string Registration_Sp = "Registration";


        #region Login Authentication
        public string Login(string Username, string Password)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(Emp_concon))
                {
                    string Response = "";
                    SqlCommand lg_cmd = new SqlCommand(Login_Sp, con);
                    lg_cmd.CommandType = CommandType.StoredProcedure;
                    lg_cmd.Parameters.AddWithValue("@name", Username.Trim().ToString());
                    lg_cmd.Parameters.AddWithValue("@pass", Password.Trim().ToString());
                    con.Open();
                    SqlDataReader Lg_reader = lg_cmd.ExecuteReader();
                    while (Lg_reader.Read())
                    {
                        Response = Lg_reader[0].ToString();
                    }
                    con.Close();
                    return Response;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        #endregion

        #region User Registration
        public string Reg(string Username,string password)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(Emp_concon))
                {
                    SqlCommand _reg_cmd = new SqlCommand(Registration_Sp, con);
                    _reg_cmd.CommandType = CommandType.StoredProcedure;
                    _reg_cmd.Parameters.AddWithValue("@name", Username.Trim().ToString());
                    _reg_cmd.Parameters.AddWithValue("@pass", password.Trim().ToString());
                    SqlDataAdapter _da = new SqlDataAdapter(_reg_cmd);
                    DataSet _ds = new DataSet();
                    _da.Fill(_ds);
                    string Msg = _ds.Tables[0].Rows[0]["id"].ToString();
                    return Msg;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }

        }
       #endregion

    }



    public class Employeedetails : EmpInterface
    {
        readonly string Emp_conconadd = ConfigurationManager.ConnectionStrings["EmpConnection"].ToString();
        readonly string addMasterdetails = "MSP_Addemployee";
        readonly string addMasterdetailsid = "MSP_Addemployees";


       public string add_details(string empdname, string details, string DOB,int Userid)
        {
            try
            {                 
               using(SqlConnection con = new SqlConnection(Emp_conconadd))
                {
                    SqlCommand _add = new SqlCommand(addMasterdetails, con);
                    _add.CommandType = CommandType.StoredProcedure;
                    _add.Parameters.AddWithValue("@empname", empdname.Trim().ToString());
                    _add.Parameters.AddWithValue("@Empadd", details.Trim().ToString());
                    _add.Parameters.AddWithValue("@empdob", DOB.Trim().ToString());
                    _add.Parameters.AddWithValue("@userid", Userid);
                    con.Open();
                    _add.ExecuteNonQuery();
                    con.Close();
                    string MSg = "";
                    return MSg;
               }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

    }
    
}