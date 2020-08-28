using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Hospital_Simulate
{
    public partial class Patients : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            BindDataTable();
        }
        public void BindDataTable()
        {
            //Replace Your Server Name And DataBase Name/////////////

            //string str = @"Data Source=(LocalDB)\v11.0;Initial Catalog=DATAS;Integrated Security=True";
            string str = @"Data Source=(LocalDB)\v11.0;AttachDbFilename=D:\Hospital Simulator\Hospital Simulator\Hospital Simulator\App_Data\ClinicDB.mdf;Integrated Security=True;Connect Timeout=30";
            SqlConnection cn = new SqlConnection(str);
            cn.Open();
            string query = "SELECT PatientID,cast(fname+' '+ lname as varchar(200))name,gender, admitdate , dob ,phone,address,complain from tblpatients";
            SqlCommand cmd = new SqlCommand(query, cn);
            SqlDataReader user = cmd.ExecuteReader();
            String UnreadText = "";
            Int32 i = 0;
            while (user.Read())
            {

                UnreadText += "<tr>";
                UnreadText += "			<td class=\"center\">" + user["PatientID"].ToString() + "</td>";
                UnreadText += "			<td class=\"center\">" + user["name"] + "</td>";
                UnreadText += "			<td class=\"center\">" + user["gender"] + "</td>";
                UnreadText += "			<td class=\"center\">" + ((DateTime)user["admitdate"]).ToShortDateString() + "</td>";
                UnreadText += "			<td class=\"center\">" + ((DateTime)user["dob"]).ToShortDateString() + "</td>";
                UnreadText += "			<td class=\"center\">" + user["phone"] + "</td>";
                UnreadText += "			<td class=\"center\">" + user["address"] + "</td>";
                UnreadText += "			<td class=\"center\">" + user["complain"] + "</td>";
                UnreadText += "			<td class=\"center\">";
                UnreadText += "				<a class=\"btn btn-success\" href=\"Prescriptions.aspx?PatientID=" + user[0].ToString() + "\">";
                UnreadText += "					<i class=\"fa fa-edit style='color:green' \"></i>  ";
                UnreadText += "					                                    ";
                UnreadText += "				</a>";
                UnreadText += "				<a class=\"btn btn-warning\" href=\"EditPatientInfo.aspx?PatientID=" + user[0] + "\">";
                UnreadText += "			       <i class= \"fa fa-user-o\"></i>  ";
                UnreadText += "					                                    ";
                UnreadText += "				</a>";
                UnreadText += "				<a class=\"btn btn-danger\" href=\"DeleteDepartment.aspx?deptno=" + user[0] + "\">";
                UnreadText += "					<i class=\"fa fa-trash style='color:red'\"></i>  ";
                UnreadText += "					                                    ";
                UnreadText += "				</a>";
                UnreadText += "			</td>";
                UnreadText += "		</tr>";
                tlist.InnerHtml = UnreadText;
                i++;
            }
            cn.Close();
        }
    }
}