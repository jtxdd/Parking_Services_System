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
    public partial class User_Home : System.Web.UI.Page
    {
        //string contactname, contactaddress, contactphone, contactemail;
        int contactid;

        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (!IsPostBack)
            {
                plateNumber_label.DataBind();
                state_label.DataBind();
                
                //DELETE THIS
                contactid = 1;
                HiddenField1.Value = contactid.ToString();

                //contactid = (int)Session["ss_contactid"];
                //HiddenField1.Value = Convert.ToString((int)Session["ss_contactid"]);

                string cncn = ConfigurationManager.ConnectionStrings["hookup"].ConnectionString;
                using (SqlConnection dbhookup = new SqlConnection(cncn))
                {
                    using (SqlCommand cmd = new SqlCommand("get_contactinfo", dbhookup))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@contactId", contactid);
                        cmd.Connection = dbhookup;
                        dbhookup.Open();
                        SqlDataReader reader = cmd.ExecuteReader();
                        if (reader.HasRows)
                        {
                            while (reader.Read())
                            {
                                //assign db query results
                                name_label.Text = reader.GetString(0);
                                address_label.Text = reader.GetString(1);
                                phone_label.Text = reader.GetString(2);
                                email_label.Text = reader.GetString(3);
                            }
                            reader.Close();
                        }
                        else if (!reader.HasRows)
                        {
                            error_label.Visible = true;
                            error_label.Text = "Oops, nothing was found";
                        }
                        dbhookup.Close();
                    }

                }

                who_label.Text = "Logged in as " + name_label.Text;
                view2Who_label.Text = "Logged in as " + name_label.Text;
                view3Who_label.Text = "Logged in as " + name_label.Text;
                view4Who_label.Text = "Logged in as " + name_label.Text;
                view5Who_label.Text = "Logged in as " + name_label.Text;
                view6Who_label.Text = "Logged in as " + name_label.Text;
                view7Who_label.Text = "Logged in as " + name_label.Text;

            }
            else if (IsPostBack)
            {
                GridView1.DataBind();
                plateNumber_label.DataBind();
                state_label.DataBind();
            }
        }                                                   //page load

        protected void home_button_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 0;
        }                                           //v1 home

        protected void tickets_button_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 1;
        }                                       //v1 tickets

        protected void permits_button_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 2;
        }                                       //v1 permits

        protected void logout_button_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Main_Login.aspx");
        }                                       //v1 logout

        protected void editinfo_button_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 3;
        }                                                                               

        protected void save_button_Click(object sender, EventArgs e)
        {
            //save edited info
            //collect input in textbox
            //pass as parameters for update stored procedure
            SqlDataSource5.Update();
            //Response.Redirect("~/User_Home.aspx");
        }

        protected void cancel_button_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 0;
        }

        protected void view4Home_button_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 0;
        }

        protected void view4Tickets_button_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 1;
        }

        protected void view4Permits_button_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 2;
        }

        protected void view4Logout_button_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Main_Login.aspx");
        }

        protected void editvehicle_button_Click(object sender, EventArgs e)
        {
            
            MultiView1.ActiveViewIndex = 4;
            //db access: execute stored procedure; return contactId;
            SqlConnection dbhookup = new SqlConnection(ConfigurationManager.ConnectionStrings["hookup"].ConnectionString);
            dbhookup.Open();

            SqlCommand cmd = new SqlCommand("select upper(plateId), upper(states) from vehicle where contactId = @contactId", dbhookup);
            cmd.CommandType = CommandType.Text;
            cmd.Parameters.AddWithValue("@contactId", HiddenField1.Value);
            
            SqlDataReader reader = cmd.ExecuteReader();

            //no rows = no login
            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    //assign db query results
                    plateNumber_label.Text = reader.GetString(0);
                    state_label.Text = reader.GetString(1);
                }
                reader.Close();
            }
            else if (!reader.HasRows)
            {
                view5Error_label.Text = "No records found for Plate # and State";
            }
        }

        protected void view5Home_button_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 0;
        }

        protected void view5Tickets_button_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 1;
        }

        protected void view5Permits_button_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 2;
        }

        protected void view5Logout_button_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Main_Login.aspx");
        }

        protected void updateVehicle_button_Click(object sender, EventArgs e)
        {
            //get input
            //do update stored procedure
            SqlDataSource6.Update();
            MultiView1.ActiveViewIndex = 0;
            error_label.Text = "Update Successful";
        }

        protected void cancelUpdate_button_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 0;
        }

        protected void searchtix_button_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 1;
        }

        protected void viewtix_button_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 5;
        }

        protected void view6Home_button_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 0;
        }

        protected void view6Tickets_button_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 1;
        }

        protected void view6Permits_button_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 2;
        }

        protected void view6Logout_button_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Main_Login.aspx");
        }

        protected void order_button_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 2;
        }

        protected void newPermit_button_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 6;
        }

        protected void view7Home_button_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 0;
        }

        protected void view7Tickets_button_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 1;
        }

        protected void view7Permits_button_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 2;
        }

        protected void view7Logout_button_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Main_Login.aspx");
        }

        protected void ticketsearch_button_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 6;
        }

        protected void view2Home_button_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 0;
        }

        protected void view2Tickets_button_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 1;
        }

        protected void view2Permits_button_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 2;
        }

        protected void view2Logout_button_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Main_Login.aspx");
        }

        protected void view3Home_button_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 0;
        }

        protected void view3Tickets_button_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 1;
        }

        protected void view3Permits_button_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 2;
        }

        protected void view3Logout_button_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Main_Login.aspx");
        }
    }
}