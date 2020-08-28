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
    public partial class RegisterPatient : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            GenerateRegID();
        }
        protected void btnAddPatient_Click(object sender, EventArgs e)
        {


            using (SqlConnection scon = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=D:\excercise\Hospital Simulate\Hospital Simulate\App_Data\ClinicDB.mdf;Integrated Security=True"))
            {
                try
                {
                    scon.Open();
                    SqlCommand scm = new SqlCommand("addpatients", scon);
                    scm.CommandType = CommandType.StoredProcedure;

                    scm.Parameters.AddWithValue("@pid", SqlDbType.NChar).Value = ptxtregid.Text;
                    scm.Parameters.AddWithValue("@fname", SqlDbType.NChar).Value = txtfname.Text;
                    scm.Parameters.AddWithValue("@lname", SqlDbType.NChar).Value = txtlname.Text;
                    scm.Parameters.AddWithValue("@gender", SqlDbType.NChar).Value = txtgender.Text;
                    scm.Parameters.AddWithValue("@admitdate", SqlDbType.Date).Value = txtadmitdate.Text.ToString();
                    scm.Parameters.AddWithValue("@dob", SqlDbType.Date).Value = txtdob.Text.ToString();
                    scm.Parameters.AddWithValue("@phone", SqlDbType.NChar).Value = txtphone.Text;
                    scm.Parameters.AddWithValue("@address", SqlDbType.NChar).Value = txtaddress.Text;
                    scm.Parameters.AddWithValue("@complain", SqlDbType.NChar).Value = ddlcondition.SelectedValue.ToString();
                    scm.Parameters.AddWithValue("@topography", SqlDbType.NChar).Value = ddltopography.SelectedValue.ToString();
                    scm.ExecuteNonQuery();

                    txtdob.Text = "";
                    txtfname.Text = "";
                    txtlname.Text = "";
                    txtgender.Text = "";
                    txtphone.Text = "";
                    txtaddress.Text = "";
                    ddltopography.SelectedValue = "";
                    ddlcondition.SelectedValue = "";

                    ScriptManager.RegisterClientScriptBlock(Page, typeof(Page), "ClientScript", "alert('Patient Added Successfully....')", true);
                    GenerateRegID();
                }
                catch (Exception ex)
                {
                    ex.Message.ToString();
                }

            }



        }

        // This is method for adding a pattient into the application by the Doctor User
        #region Add Patient
        private void GenerateRegID()
        {
            int i = 0;
            string v = "";
            {
                using (SqlConnection scon = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=D:\excercise\Hospital Simulate\Hospital Simulate\App_Data\ClinicDB.mdf;Integrated Security=True"))
                {

                    try
                    {
                        scon.Open();
                        SqlCommand cmd = new SqlCommand("select MAX(CAST(id as INT)+1) as pid from tblpatients", scon);
                        SqlDataReader dr = cmd.ExecuteReader();
                        string newId = string.Format("AH-{0}", DateTime.Now.Year);
                        string mth = string.Format("{0}", DateTime.Now.Month);
                        while (dr.Read())
                        {
                            v = dr["pid"].ToString();
                        }
                        ptxtregid.Text = newId + mth + v;
                    }
                    catch (Exception ex)
                    {
                        ex.Message.ToString();
                    }
                }
            }

        }
        #endregion

        
    }
}