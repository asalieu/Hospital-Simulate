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
    public partial class Consultation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            string docname = "";
            string roomID = "";
            using (SqlConnection scon = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=D:\excercise\Hospital Simulate\Hospital Simulate\App_Data\ClinicDB.mdf;Integrated Security=True"))
            {

                if (txtcondition.Text.Trim().ToString() == "Flu")
                {
                    scon.Open();
                    string selQry = "select name,role,groupId,roomID,treatmentmachinetype from tbldoctors d join tblconsultationroom r on d.groupId=r.roomID where d.role='GP'";
                    DataSet ds = new DataSet();
                    SqlCommand scmm = scon.CreateCommand();
                    scmm.CommandText = selQry;
                    SqlDataReader user = scmm.ExecuteReader();
                    while (user.Read())
                    {
                        docname = (string)user["name"].ToString();
                        roomID = (string)user["roomID"].ToString();

                    }
                    scon.Close();
                    scon.Open();
                    SqlCommand scm = new SqlCommand("assignpatient", scon);
                    scm.CommandType = CommandType.StoredProcedure;

                    scm.Parameters.AddWithValue("@adminssionno", SqlDbType.NChar).Value = txtpid.Text;
                    scm.Parameters.AddWithValue("@fname", SqlDbType.NChar).Value = txtfname.Text;
                    scm.Parameters.AddWithValue("@condition", SqlDbType.NChar).Value = txtcondition.Text;
                    scm.Parameters.AddWithValue("@topography", SqlDbType.NChar).Value = txttopography.Text;
                    scm.Parameters.AddWithValue("@dob", SqlDbType.Date).Value = txtdob.Text.ToString();
                    scm.Parameters.AddWithValue("@appt_date", SqlDbType.Date).Value = txtapptdt.Text.ToString();
                    scm.Parameters.AddWithValue("@phone", SqlDbType.NChar).Value = txtphone.Text;
                    scm.Parameters.AddWithValue("@address", SqlDbType.NChar).Value = txtadd.Text;
                    scm.Parameters.AddWithValue("@doctor", SqlDbType.NChar).Value = docname.ToString();
                    scm.Parameters.AddWithValue("@roomid", SqlDbType.NChar).Value = roomID.ToString();

                    scm.ExecuteNonQuery();

                    ScriptManager.RegisterClientScriptBlock(Page, typeof(Page), "ClientScript", "alert('Consultation booked !! doctor assigned is : " + docname.ToString() + "')", true);

                    txtpid.Text = "";
                    txtdob.Text = "";
                    txtfname.Text = "";
                    txtcondition.Text = "";
                    txttopography.Text = "";
                    txtphone.Text = "";
                    txtadd.Text = "";
                    txtapptdt.Text = "";

                }
                if (txtcondition.Text.Trim().ToString() == "cancer")
                {
                    if (txttopography.Text.Trim() == "Head" || txttopography.Text.Trim() == "Neck")
                    {
                        scon.Open();
                        string selQry = "select name,role,groupId,roomID,treatmentmachinetype from tbldoctors d join tblconsultationroom r on d.groupId=r.roomID where d.role='oncologist'";
                        DataSet ds = new DataSet();
                        SqlCommand scmm = scon.CreateCommand();
                        scmm.CommandText = selQry;
                        SqlDataReader user = scmm.ExecuteReader();
                        while (user.Read())
                        {
                            docname = (string)user["name"].ToString();
                            roomID = (string)user["roomID"].ToString();
                        }
                        scon.Close();

                        scon.Open();
                        SqlCommand scm = new SqlCommand("assignpatient", scon);
                        scm.CommandType = CommandType.StoredProcedure;

                        scm.Parameters.AddWithValue("@adminssionno", SqlDbType.NChar).Value = txtpid.Text;
                        scm.Parameters.AddWithValue("@fname", SqlDbType.NChar).Value = txtfname.Text;
                        scm.Parameters.AddWithValue("@condition", SqlDbType.NChar).Value = txtcondition.Text;
                        scm.Parameters.AddWithValue("@topography", SqlDbType.NChar).Value = txttopography.Text;
                        scm.Parameters.AddWithValue("@dob", SqlDbType.Date).Value = txtdob.Text.ToString();
                        scm.Parameters.AddWithValue("@appt_date", SqlDbType.Date).Value = txtapptdt.Text.ToString();
                        scm.Parameters.AddWithValue("@phone", SqlDbType.NChar).Value = txtphone.Text;
                        scm.Parameters.AddWithValue("@address", SqlDbType.NChar).Value = txtadd.Text;
                        scm.Parameters.AddWithValue("@doctor", SqlDbType.NChar).Value = docname.ToString();
                        scm.Parameters.AddWithValue("@roomid", SqlDbType.NChar).Value = roomID.ToString();

                        scm.ExecuteNonQuery();

                        ScriptManager.RegisterClientScriptBlock(Page, typeof(Page), "ClientScript", "alert('Consultation booked !! doctor assigned is : " + docname.ToString() + "')", true);

                        txtpid.Text = "";
                        txtdob.Text = "";
                        txtfname.Text = "";
                        txtcondition.Text = "";
                        txttopography.Text = "";
                        txtphone.Text = "";
                        txtadd.Text = "";
                        txtapptdt.Text = "";
                    }
                    if (txttopography.Text == "Breast")
                    {
                        scon.Open();
                        string selQry = "select  name,role,groupId,roomID,treatmentmachinetype from tblconsultationroom r join tbldoctors d on r.roomID in (select roomID from tblconsultationroom where roomID in ('01' ,'02') and role!='GP' )";
                        DataSet ds = new DataSet();
                        SqlCommand scmm = scon.CreateCommand();
                        scmm.CommandText = selQry;
                        SqlDataReader user = scmm.ExecuteReader();
                        while (user.Read())
                        {
                            docname = (string)user["name"].ToString();
                            roomID = (string)user["roomID"].ToString();
                        }
                        scon.Close();

                        scon.Open();
                        SqlCommand scm = new SqlCommand("assignpatient", scon);
                        scm.CommandType = CommandType.StoredProcedure;

                        scm.Parameters.AddWithValue("@adminssionno", SqlDbType.NChar).Value = txtpid.Text;
                        scm.Parameters.AddWithValue("@fname", SqlDbType.NChar).Value = txtfname.Text;
                        scm.Parameters.AddWithValue("@condition", SqlDbType.NChar).Value = txtcondition.Text;
                        scm.Parameters.AddWithValue("@topography", SqlDbType.NChar).Value = txttopography.Text;
                        scm.Parameters.AddWithValue("@dob", SqlDbType.Date).Value = txtdob.Text.ToString();
                        scm.Parameters.AddWithValue("@appt_date", SqlDbType.Date).Value = txtapptdt.Text.ToString();
                        scm.Parameters.AddWithValue("@phone", SqlDbType.NChar).Value = txtphone.Text;
                        scm.Parameters.AddWithValue("@address", SqlDbType.NChar).Value = txtadd.Text;
                        scm.Parameters.AddWithValue("@doctor", SqlDbType.NChar).Value = docname.ToString();
                        scm.Parameters.AddWithValue("@roomid", SqlDbType.NChar).Value = roomID.ToString();

                        scm.ExecuteNonQuery();

                        ScriptManager.RegisterClientScriptBlock(Page, typeof(Page), "ClientScript", "alert('Consultation booked !! doctor assigned is : " + docname.ToString() + "')", true);

                        txtpid.Text = "";
                        txtdob.Text = "";
                        txtfname.Text = "";
                        txtcondition.Text = "";
                        txttopography.Text = "";
                        txtphone.Text = "";
                        txtadd.Text = "";
                        txtapptdt.Text = "";
                    }

                }



            }
        }

        protected void Unnamed5_Click(object sender, EventArgs e)
        {

        }

        protected void btnGo_Click(object sender, EventArgs e)
        {
            using (SqlConnection scon = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=D:\excercise\Hospital Simulate\Hospital Simulate\App_Data\ClinicDB.mdf;Integrated Security=True"))
            {
                scon.Open();
                DataSet dt = new DataSet();
                string SelQry = "select *from tblpatients where patientid='" + txtpid.Text.Trim().ToString() + "'";
                SqlCommand scm = scon.CreateCommand();
                scm.CommandText = SelQry;
                SqlDataReader user = scm.ExecuteReader();
                while (user.Read())
                {
                    txtpid.Text = (string)user["PatientID"];
                    txtfname.Text = (string)user["fname"];
                    txtcondition.Text = (string)user["complain"];
                    txttopography.Text = (string)user["topography"];
                    txtphone.Text = (string)user["phone"];
                    txtadd.Text = (string)user["address"];
                }

            }
        }
    }
}