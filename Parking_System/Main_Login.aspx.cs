using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace Parking_System
{

    public partial class Main_Login : System.Web.UI.Page
    {
        int contactId;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void home_button_Click(object sender, EventArgs e)
        {
            //clicking home redirects to main sign in page when not logged in
            Response.Redirect("~/Main_Login.aspx");
        }

        protected void tickets_button_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 1;
        }

        protected void permits_button_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 2;
        }

        protected void login_button_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 2;
        }

        protected void lookup_button_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 1;
        }

        protected void request_button_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 2;
        }

        protected void view_button_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 2;
        }

        protected void ticketsearch_button_Click(object sender, EventArgs e)
        {
            //look in db for ticket
            //
        }

        protected void enter_button_Click(object sender, EventArgs e)
        {
            //user login lookup
            //db access: execute stored procedure; return contactId;
            SqlConnection dbhookup = new SqlConnection(ConfigurationManager.ConnectionStrings["hookup"].ConnectionString);
            dbhookup.Open();

            SqlCommand cmd = new SqlCommand("get_contact", dbhookup);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@uname", uname_textbox.Text);
            cmd.Parameters.AddWithValue("@pword", pword_textbox.Text);

            //SqlDataAdapter da = new SqlDataAdapter(cmd);

            SqlDataReader reader = cmd.ExecuteReader();

            //no rows = no login
            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    //assign db query results
                    contactId = reader.GetInt32(0);
                    Session["ss_contactid"] = contactId;
                }
                reader.Close();
                Response.Redirect("~/User_Home.aspx");
            }
            else if (!reader.HasRows)
            {
                error_label.Visible = true;
                error_label.Text = "User not found, try again";
            }
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 2;
        }

        protected void Button6_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 2;
        }

        protected void Button9_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 2;
        }

        protected void Button10_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 2;
        }
    }
}