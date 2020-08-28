using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Hospital_Simulate
{
    public partial class Prescriptions : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!string.IsNullOrWhiteSpace(Request.QueryString["PatientID"]))
            {
               

                string staffId = Request.QueryString["PatientID"];
                if (staffId != null)
                {
                    passData(staffId);
                    BindDataTable(staffId);
                }

            }

        }

        public void BindDataTable(string Staffid)
        {
            #region MyRegionforbinding records from drugs assigned
            
            //Replace Your Server Name And DataBase Name/////////////
            string str = @"Data Source=(LocalDB)\v11.0;AttachDbFilename=D:\excercise\Hospital Simulate\Hospital Simulate\App_Data\ClinicDB.mdf;Integrated Security=True";
            SqlConnection cn = new SqlConnection(str);
            cn.Open();
            string query = "SELECT patientid,drugname,drugtype,drugdosage,drugstrength,days,drugadvise,prescriber,prescdate from drugsprescribed where patientid=@staffid and prescdate='" + DateTime.Today + "'";
            //string query = "SELECT patientid,drugname,drugtype,drugdosage,drugstrength,drugadvise,drugadvise,prescriber,prescdate from drugsprescribed";
            SqlCommand cmd = new SqlCommand(query, cn);
            SqlParameter sparam = new SqlParameter("@staffId", SqlDbType.NChar);
            sparam.Value = Staffid;
            cmd.Parameters.Add(sparam);
            SqlDataReader user = cmd.ExecuteReader();
            String UnreadText = "";
            Int32 i = 0;
            while (user.Read())
            {

                UnreadText += "<tr>";
                UnreadText += "			<td class=\"center\">" + user["patientid"] + "</td>";
                UnreadText += "			<td class=\"center\">" + user["drugname"] + "</td>";
                UnreadText += "			<td class=\"center\">" + user["drugtype"] + "</td>";
                UnreadText += "			<td class=\"center\">" + user["drugdosage"] + "</td>";
                UnreadText += "			<td class=\"center\">" + user["drugstrength"] + "</td>";
                UnreadText += "			<td class=\"center\">" + user["days"] + "</td>";
                UnreadText += "			<td class=\"center\">" + user["drugadvise"] + "</td>";
                UnreadText += "			<td class=\"center\">" + user["prescriber"] + "</td>";
                UnreadText += "			<td class=\"center\">" + user["prescdate"] + "</td>";
                UnreadText += "			<td class=\"center\">";
                UnreadText += "				<a class=\"btn btn-warning\" href=\"EditDepartment.aspx?deptno=" + user[0] + "\">";
                UnreadText += "					<i class=\"fa fa-edit style='color:goldenrod' \"></i>  ";
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
            #endregion
        }

        private void passData(string Staffid)
        {

            string str = @"Data Source=(LocalDB)\v11.0;AttachDbFilename=D:\excercise\Hospital Simulate\Hospital Simulate\App_Data\ClinicDB.mdf;Integrated Security=True";
            SqlConnection cn = new SqlConnection(str);
            cn.Open();
            string query = "SELECT PatientID,cast(fname+' '+ lname as varchar(200))name,gender, admitdate ,round(DATEDIFF(DAY, dob, GetDate()) / 365.25,2) AS age ,phone,address,complain from tblpatients where PatientID=@staffId";
            SqlCommand cmd = new SqlCommand(query, cn);
           
            SqlParameter sparam = new SqlParameter("@staffId", SqlDbType.NChar);
            sparam.Value = Staffid;
            cmd.Parameters.Add(sparam);
            SqlDataReader user = cmd.ExecuteReader();
            while (user.Read())
            {
               
                lblname.Text = (string)user["name"];
                lblid.Text = (string)user["patientid"];
                txtage.Text = (string)user["age"].ToString();
                txtphone.Text = (string)user["phone"];
                txtaddress.Text = (string)user["address"];
            }
        }
        protected void btnAdd_Click(object sender, EventArgs e)
        {
            addMedicine();
        }

        private void addMedicine()
        {
            string str = @"Data Source=(LocalDB)\v11.0;AttachDbFilename=D:\excercise\Hospital Simulate\Hospital Simulate\App_Data\ClinicDB.mdf;Integrated Security=True";


            DropDownList ddldrugtype = this.Master.FindControl("sMainContent").FindControl("ddldrugtype") as DropDownList;
            DropDownList ddldrugname = this.Master.FindControl("sMainContent").FindControl("ddldrugname") as DropDownList;
            DropDownList ddldrugdosage = this.Master.FindControl("sMainContent").FindControl("ddldrugdosage") as DropDownList;
            DropDownList ddldrugstrength = this.Master.FindControl("sMainContent").FindControl("ddldrugstrength") as DropDownList;
            DropDownList ddldays = this.Master.FindControl("sMainContent").FindControl("ddldays") as DropDownList;
            TextBox txtadvise = this.Master.FindControl("sMainContent").FindControl("txtadvise") as TextBox;
            Label txtpatientid = this.Master.FindControl("sMainContent").FindControl("lblname") as Label;
            Label txtprescriber = this.Master.FindControl("sMainContent").FindControl("lblname") as Label;

            using (SqlConnection scon = new SqlConnection(str))
            {
                using (SqlCommand scm = new SqlCommand("PassData", scon))
                {
                    scon.Open();
                    scm.CommandType = CommandType.StoredProcedure;
                    scm.Parameters.AddWithValue("@drugtype", SqlDbType.NChar).Value = ddldrugtype.SelectedValue;
                    scm.Parameters.AddWithValue("@drugname", SqlDbType.NChar).Value = ddldrugname.SelectedValue;
                    scm.Parameters.AddWithValue("@drugdosage", SqlDbType.NChar).Value = ddldrugdosage.SelectedValue;
                    scm.Parameters.AddWithValue("@drugstrength", SqlDbType.NChar).Value = ddldrugstrength.SelectedValue;
                    scm.Parameters.AddWithValue("@ddldays", SqlDbType.NChar).Value = ddldays.SelectedValue;
                    scm.Parameters.AddWithValue("@drugadvise", SqlDbType.NChar).Value = txtadvise.Text;
                    scm.Parameters.AddWithValue("@patientid", SqlDbType.NChar).Value = lblid.Text;
                    scm.Parameters.AddWithValue("@prescriber", SqlDbType.NChar).Value = txtprescriber.Text;
                    scm.Parameters.AddWithValue("@prescdate", DateTime.Now);
                    scm.ExecuteNonQuery();
                    ScriptManager.RegisterClientScriptBlock(Page, typeof(Page), "ClientScript", "alert('Data Sent Successfully.....')", true);


                }
            }
        }

    }
}