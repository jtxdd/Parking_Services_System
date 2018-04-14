<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="User_Home.aspx.cs" Inherits="Parking_System.User_Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css"/>
    <link href="Styling/main_style.css" rel="stylesheet" />
    <title>Parking Services</title>
    <style>
        #termsbox {color: white; padding: 15px; width:50%; height: 100%; overflow: auto; border: 1px solid #ccc; display:flex; flex-direction:column; justify-content:center;}
        .header{background-color:#012560; color:#fff; font-variant:small-caps;}
    </style>
</head>

<body>

    <form id="form1" runat="server">

        <!-- MULTI VIEW = VIEW 0 -> start at view 1 for user just log in -->
        <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">

            <!-- view 1 = home -->
            <asp:View ID="View1" runat="server">

            <!-- TOP HEADER -->
            <h1 class="top"></h1>

            <!-- LOGO -->
            <div class="logo img">
                <img src="https://ung.edu//_uploads/images/template/2015/logo-large.png" />
                <img src="https://ung.edu//_uploads/images/template/2015/logo-large-bottom.png" />
            </div>

                <!-- parking services header -->
                <!--<div class="w3-container header">-->
                <h1 class="w3-container header w3-display-topmiddle" style=" text-align:center;">Parking Services</h1>

                <!-- view 1 navbar -->
                <div class="w3-bar w3-bottombar w3-border-white " style="background-color:#012560;">
                    <div class="w3-bar-item">
                        <asp:Button ID="home_button" style="background-color:lightgray;" class="w3-button w3-btn" runat="server" Text="Home" OnClick="home_button_Click"  />
                    </div>
                    <div class="w3-bar-item">
                        <asp:Button ID="tickets_button" style="background-color:lightgray;" class="w3-button w3-btn" runat="server" Text="Tickets" OnClick="tickets_button_Click"  />
                    </div>
                    <div class="w3-bar-item">
                        <asp:Button ID="permits_button" style="background-color:lightgray;" class="w3-button w3-btn" runat="server" Text="Permits" OnClick="permits_button_Click"  />
                    </div>
                    <div class="w3-bar-item w3-center">
                        <asp:Label ID="error_label" style="color:red; font-variant:small-caps; font-weight:700;" runat="server" Text=""></asp:Label>
                    </div>
                    <div class="w3-bar-item w3-right" >
                        <asp:Label ID="who_label" style="color:#fff;" runat="server" Text=""></asp:Label>
                    </div>
                    <div class="w3-bar-item w3-right">
                        <asp:Button ID="logout_button" style="background-color:lightgray;" class="w3-button w3-btn" runat="server" Text="Logout" OnClick="logout_button_Click"  />
                    </div>
                </div>

            <div class="w3-row">
                <!-- view 1 contact info -->
                <div class="w3-col s6 w3-container " style="background-color: #012560; ">
                    <!--<div class="w3-col s6 w3-container "style="">-->
                        <h3 class="w3-bottombar w3-border-white" style="color:#fff;">Contact Info</h3>
                        <asp:Label ID="name_label" style="color:#fff; font-weight:600;" runat="server" Text=""></asp:Label>
                        <h5 style="color:#fff;"><u>Address:</u> <span>
                        <asp:Label ID="address_label" style="color:#fff;" runat="server" Text=""></asp:Label></span></h5>
                        <h5 style="color:#fff;"><u>Phone:</u> <span>
                        <asp:Label ID="phone_label" style="color:#fff;" runat="server" Text=""></asp:Label></span></h5>
                        <h5 style="color:#fff;"><u>Email:</u> <span>
                        <asp:Label ID="email_label" style="color:#fff;" runat="server" Text=""></asp:Label></span></h5>
                        <br />
                        <asp:Button ID="editinfo_button" style="background-color:lightgray;" class="w3-button w3-btn" runat="server" Text="Edit Info" OnClick="editinfo_button_Click" />
                        <br />
                        <br />
                </div>
                    
                

                    <!-- view 1 vehicles -->
                    <div class="w3-col s6 w3-container "style="background-color: #012560; ">
                        <h3 class="w3-bottombar w3-border-white" style="color:#fff;">Vehicles</h3>
                        <div class="" style="display:flex; justify-content:center;">
                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" ForeColor="black" CellPadding="8" CellSpacing="2" BorderColor="Black" GridLines="Vertical">
                                <AlternatingRowStyle BackColor="lightgray" />
                                <Columns>
                                    <asp:BoundField DataField="Plate #" HeaderText="Plate #" ReadOnly="True" SortExpression="Plate #" />
                                    <asp:BoundField DataField="State" HeaderText="State" ReadOnly="True" SortExpression="State" />
                                    <asp:BoundField DataField="VIN" HeaderText="VIN" ReadOnly="True" SortExpression="VIN" />
                                    <asp:BoundField DataField="Make" HeaderText="Make" ReadOnly="True" SortExpression="Make" />
                                    <asp:BoundField DataField="Model" HeaderText="Model" ReadOnly="True" SortExpression="Model" />
                                    <asp:BoundField DataField="Color" HeaderText="Color" ReadOnly="True" SortExpression="Color" />
                                </Columns>
                                <HeaderStyle BackColor="Gray" />
                                <RowStyle BackColor="lightgray" />
                            </asp:GridView>
                        </div>
                        <!-- sql data source for gridview1 -->
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ParkingConnectionString %>" SelectCommand="get_vehicle" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="HiddenField1" Name="contactId" PropertyName="Value" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <!-- hidden field for sql data source -->
                        <asp:HiddenField ID="HiddenField1" runat="server" />
                        <br />
                        <!-- edit vehicles button -->
                        <asp:Button ID="editvehicle_button" style="background-color:lightgray;" class="w3-button w3-btn" runat="server" Text="Edit Vehicles" OnClick="editvehicle_button_Click" />
                        <br />
                        <br />
                    </div>
            </div>




                <div class="w3-row">
                    <!-- view 1 tickets -->
                    <div class="w3-col s6 w3-container " style="">
                        <h3 class="w3-bottombar w3-border-white" style="color:#fff;">Tickets</h3>
                        <h6 style="color:#fff;">Your account has no open tickets</h6>
                        <br />
                        <!-- search tickets button -->
                        <asp:Button ID="searchtix_button" style="background-color:lightgray;" class="w3-button w3-btn" runat="server" Text="Ticket Search" OnClick="searchtix_button_Click" />&nbsp
                        <asp:Button ID="viewtix_button" style="background-color:lightgray;" class="w3-button w3-btn" runat="server" Text="View Tickets" OnClick="viewtix_button_Click" />
                        <br />
                        <br />
                    </div>


                    <!-- view 1 permits -->
                    <div class="w3-col s6 w3-container " style="background-color: #012560; ">
                        <h3 class="w3-bottombar w3-border-white" style="color:#fff;">Permits</h3>
                        <h5 style="color:#fff; font-weight:600;">Current Permits</h5>
                        <div class="" style="display:flex; justify-content:center;">
                            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="Permit #" DataSourceID="SqlDataSource2" ForeColor="black" CellPadding="8" CellSpacing="2" BorderColor="Black" GridLines="Vertical">
                                <AlternatingRowStyle BackColor="lightgray" />
                                <Columns>
                                    <asp:BoundField DataField="Permit #" HeaderText="Permit #" InsertVisible="False" ReadOnly="True" SortExpression="Permit #" />
                                    <asp:BoundField DataField="Permit Type" HeaderText="Permit Type" SortExpression="Permit Type" />
                                    <asp:BoundField DataField="Expire Date" HeaderText="Expire Date" ReadOnly="True" SortExpression="Expire Date" />
                                    <asp:BoundField DataField="Renew Date" HeaderText="Renew Date" ReadOnly="True" SortExpression="Renew Date" />
                                    <asp:BoundField DataField="Balance" HeaderText="Balance" SortExpression="Balance" />
                                </Columns>
                                <HeaderStyle BackColor="Gray" />
                                <RowStyle BackColor="lightgray" />
                            </asp:GridView>
                        </div>
                        <!-- sql data source for gridview2 -->
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ParkingConnectionString %>" SelectCommand="get_permit" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="HiddenField1" Name="contactId" PropertyName="Value" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <br />
                        <!-- order permit button -->
                        <asp:Button ID="order_button" style="background-color:lightgray;" class="w3-button w3-btn" runat="server" Text="Order Permit" OnClick="order_button_Click" />
                        <br />
                        <br />
                    </div>
                </div>
            </asp:View>



            <!-- VIEW 2 : click nav bar tickets -->
            <asp:View ID="View2" runat="server">

            <!-- TOP HEADER -->
            <h1 class="top"></h1>

            <!-- LOGO -->
            <div class="logo img">
                <img src="https://ung.edu//_uploads/images/template/2015/logo-large.png" />
                <img src="https://ung.edu//_uploads/images/template/2015/logo-large-bottom.png" />
            </div>

                <!-- parking services header -->
                <!--<div class="w3-container header">-->
                <h1 class="w3-container header w3-display-topmiddle" style=" text-align:center;">Parking Services</h1>

                <!-- view 2 navbar  -->
                <div class="w3-bar w3-bottombar w3-border-white " style="background-color:#012560;">
                    <div class="w3-bar-item">
                        <asp:Button ID="view2Home_button" style="background-color:lightgray;" class="w3-button w3-btn" runat="server" Text="Home" OnClick="view2Home_button_Click" />
                    </div>
                    <div class="w3-bar-item">
                        <asp:Button ID="view2Tickets_button" style="background-color:lightgray;" class="w3-button w3-btn" runat="server" Text="Tickets" OnClick="view2Tickets_button_Click"  />
                    </div>
                    <div class="w3-bar-item">
                        <asp:Button ID="view2Permits_button" style="background-color:lightgray;" class="w3-button w3-btn" runat="server" Text="Permits" OnClick="view2Permits_button_Click" />
                    </div>
                     <div class="w3-bar-item w3-center">
                        <asp:Label ID="view2Error_label" style="color:red; font-variant:small-caps; font-weight:700;" runat="server" Text=""></asp:Label>
                    </div>
                    <div class="w3-bar-item w3-right">
                        <asp:Label ID="view2Who_label" runat="server" style="color:#fff;" Text=""></asp:Label>
                    </div>
                    <div class="w3-bar-item w3-right">
                        <asp:Button ID="view2Logout_button" style="background-color:lightgray;" class="w3-button w3-btn" runat="server" Text="Logout" OnClick="view2Logout_button_Click"  />
                    </div>
                </div>


                <!-- view 2 lookup header -->
                <div class="w3-col s12 w3-container w3-center" style="background-color: #012560;">
                    <div class="w3-container">
                        <div class="w3-container">
                            <h3 style="color:#fff;">Lookup a parking ticket</h3>
                        </div>
                        <div class="">
                            <asp:TextBox ID="TextBox1" style="text-align:center;" placeholder="Enter Ticket #" runat="server"></asp:TextBox>
                            <br />
                            <br />
                            <asp:TextBox ID="TextBox2" style="text-align:center;" placeholder="Enter Plate # or VIN" runat="server"></asp:TextBox>
                            <br />
                            <br />
                            <asp:Button ID="ticketsearch_button" style="background-color:lightgray;" class="w3-button w3-btn" runat="server" Text="Search" OnClick="ticketsearch_button_Click"  />
                            <br />
                            <br />
                        </div>
                    </div>
                </div>
            </asp:View>

            <!-- VIEW 3 : user clicks any order permit -->
            <asp:View ID="View3" runat="server">

            <!-- TOP HEADER -->
            <h1 class="top"></h1>

            <!-- LOGO -->
            <div class="logo img">
                <img src="https://ung.edu//_uploads/images/template/2015/logo-large.png" />
                <img src="https://ung.edu//_uploads/images/template/2015/logo-large-bottom.png" />
            </div>

                <!-- parking services header -->
                <!--<div class="w3-container header">-->
                <h1 class="w3-container header w3-display-topmiddle" style=" text-align:center;">Parking Services</h1>


                <!-- view 3 navbar  -->
                <div class="w3-bar w3-bottombar w3-border-white " style="background-color:#012560;">
                    <div class="w3-bar-item">
                        <asp:Button ID="view3Home_button" style="background-color:lightgray;" class="w3-button w3-btn" runat="server" Text="Home" OnClick="view3Home_button_Click" />
                    </div>
                    <div class="w3-bar-item">
                        <asp:Button ID="view3Tickets_button" style="background-color:lightgray;" class="w3-button w3-btn" runat="server" Text="Tickets" OnClick="view3Tickets_button_Click"  />
                    </div>
                    <div class="w3-bar-item">
                        <asp:Button ID="view3Permits_button" style="background-color:lightgray;" class="w3-button w3-btn" runat="server" Text="Permits" OnClick="view3Permits_button_Click" />
                    </div>
                    <div class="w3-bar-item w3-center">
                        <asp:Label ID="view3Error_label" style="color:red; font-variant:small-caps; font-weight:700;" runat="server" Text=""></asp:Label>
                    </div>
                    <div class="w3-bar-item w3-right">
                        <asp:Label ID="view3Who_label" style="color:#fff;" runat="server" Text=""></asp:Label>
                    </div>
                    <div class="w3-bar-item w3-right">
                        <asp:Button ID="view3Logout_button" style="background-color:lightgray;" class="w3-button w3-btn" runat="server" Text="Logout" OnClick="view3Logout_button_Click"  />
                    </div>
                </div>

                <!-- view 3 permits -->
                
                    <div class="w3-col s12 w3-container w3-center "style="background-color: #012560;">
                        <h3 class="" style="color:#fff;">Current Permits</h3>
                        <!--<h5 style="color:#fff; font-weight:600;">Current Permits</h5>-->
                        <div class="" style="display:flex; justify-content:center;">
                            <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" DataKeyNames="Permit #" DataSourceID="SqlDataSource2" ForeColor="black" CellPadding="8" CellSpacing="2" BorderColor="Black" GridLines="Vertical">
                                <AlternatingRowStyle BackColor="lightgray" />
                                <Columns>
                                    <asp:BoundField DataField="Permit #" HeaderText="Permit #" InsertVisible="False" ReadOnly="True" SortExpression="Permit #" />
                                    <asp:BoundField DataField="Permit Type" HeaderText="Permit Type" SortExpression="Permit Type" />
                                    <asp:BoundField DataField="Expire Date" HeaderText="Expire Date" ReadOnly="True" SortExpression="Expire Date" />
                                    <asp:BoundField DataField="Renew Date" HeaderText="Renew Date" ReadOnly="True" SortExpression="Renew Date" />
                                    <asp:BoundField DataField="Balance" HeaderText="Balance" SortExpression="Balance" />
                                </Columns>
                                <HeaderStyle BackColor="Gray" />
                                <RowStyle BackColor="lightgray" />
                            </asp:GridView>
                        </div>
                        <!-- sql data source for gridview2 -->
                        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ParkingConnectionString %>" SelectCommand="get_permit" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="HiddenField1" Name="contactId" PropertyName="Value" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <br />
                        <!-- order permit button -->
                        <asp:Button ID="newPermit_button" style="background-color:lightgray;" class="w3-button w3-btn" runat="server" Text="Order New Permit" OnClick="newPermit_button_Click" />
                        <br />
                        <br />
                    </div>
            </asp:View>


            <!-- VIEW 4 : user click EDIT CONTACT INFO -->
            <asp:View ID="View4" runat="server">

            <!-- TOP HEADER -->
            <h1 class="top"></h1>

            <!-- LOGO -->
            <div class="logo img">
                <img src="https://ung.edu//_uploads/images/template/2015/logo-large.png" />
                <img src="https://ung.edu//_uploads/images/template/2015/logo-large-bottom.png" />
            </div>

                <!-- parking services header -->
                <!--<div class="w3-container header">-->
                <h1 class="w3-container header w3-display-topmiddle" style=" text-align:center;">Parking Services</h1>

                    <!-- view 4 navbar  -->
                    <div class="w3-bar w3-bottombar w3-border-white " style="background-color:#012560;">
                        <div class="w3-bar-item">
                            <asp:Button ID="view4Home_button" style="background-color:lightgray;" class="w3-button w3-btn" runat="server" Text="Home" OnClick="view4Home_button_Click" />
                        </div>
                        <div class="w3-bar-item">
                            <asp:Button ID="view4Tickets_button" style="background-color:lightgray;" class="w3-button w3-btn" runat="server" Text="Tickets" OnClick="view4Tickets_button_Click"  />
                        </div>
                        <div class="w3-bar-item">
                            <asp:Button ID="view4Permits_button" style="background-color:lightgray;" class="w3-button w3-btn" runat="server" Text="Permits" OnClick="view4Permits_button_Click" />
                        </div>
                        <div class="w3-bar-item w3-center">
                            <asp:Label ID="view4Error_label" style="color:red; font-variant:small-caps; font-weight:700;" runat="server" Text=""></asp:Label>
                        </div>
                        <div class="w3-bar-item w3-right">
                            <asp:Label ID="view4Who_label" style="color:#fff;" runat="server" Text=""></asp:Label>
                        </div>
                        <div class="w3-bar-item w3-right">
                            <asp:Button ID="view4Logout_button" style="background-color:lightgray;" class="w3-button w3-btn" runat="server" Text="Logout" OnClick="view4Logout_button_Click"  />
                        </div>
                    </div>

                    <div class="w3-col s12 w3-container w3-center"style="background-color: #012560;">
                        <div class="w3-container">
                            <div class="w3-container">
                                <h3 style="color:#fff;">Edit Contact Info</h3>
                            </div>
                            <div class="">
                                <h5 style="color:#fff;">Name <span>
                                    <asp:TextBox ID="fname_textbox" style="text-align:center;" placeholder="Enter First Name" runat="server"></asp:TextBox>&nbsp
                                    <asp:TextBox ID="lname_textbox" style="text-align:center;" placeholder="Enter Last Name" runat="server"></asp:TextBox></span></h5>
                                <br />
                                <h5 style="color:#fff;">Address <span>
                                    <asp:TextBox ID="street_textbox" style="text-align:center;" placeholder="Street Address" runat="server"></asp:TextBox>&nbsp
                                    <asp:TextBox ID="city_textbox" style="text-align:center;" placeholder="City" runat="server"></asp:TextBox>&nbsp
                                    <asp:DropDownList ID="states_dropdownlist" runat="server">
                                        <asp:ListItem>State</asp:ListItem>
                                        <asp:ListItem>AL</asp:ListItem><asp:ListItem>AK</asp:ListItem><asp:ListItem>AZ</asp:ListItem><asp:ListItem>AR</asp:ListItem>
                                        <asp:ListItem>CA</asp:ListItem><asp:ListItem>CO</asp:ListItem><asp:ListItem>CT</asp:ListItem><asp:ListItem>DE</asp:ListItem>
                                        <asp:ListItem>FL</asp:ListItem><asp:ListItem>GA</asp:ListItem><asp:ListItem>HI</asp:ListItem><asp:ListItem>ID</asp:ListItem>
                                        <asp:ListItem>IL</asp:ListItem><asp:ListItem>IN</asp:ListItem><asp:ListItem>IA</asp:ListItem><asp:ListItem>KS</asp:ListItem>
                                        <asp:ListItem>KY</asp:ListItem><asp:ListItem>LA</asp:ListItem><asp:ListItem>ME</asp:ListItem><asp:ListItem>MD</asp:ListItem>
                                        <asp:ListItem>MA</asp:ListItem><asp:ListItem>MI</asp:ListItem><asp:ListItem>MN</asp:ListItem><asp:ListItem>MS</asp:ListItem>
                                        <asp:ListItem>MO</asp:ListItem><asp:ListItem>MT</asp:ListItem><asp:ListItem>NE</asp:ListItem><asp:ListItem>NV</asp:ListItem>
                                        <asp:ListItem>NH</asp:ListItem><asp:ListItem>NJ</asp:ListItem><asp:ListItem>NM</asp:ListItem><asp:ListItem>NY</asp:ListItem>
                                        <asp:ListItem>NC</asp:ListItem><asp:ListItem>ND</asp:ListItem><asp:ListItem>OH</asp:ListItem><asp:ListItem>OK</asp:ListItem>
                                        <asp:ListItem>OR</asp:ListItem><asp:ListItem>PA</asp:ListItem><asp:ListItem>RI</asp:ListItem><asp:ListItem>SC</asp:ListItem>
                                        <asp:ListItem>SD</asp:ListItem><asp:ListItem>TN</asp:ListItem><asp:ListItem>TX</asp:ListItem><asp:ListItem>UT</asp:ListItem>
                                        <asp:ListItem>VT</asp:ListItem><asp:ListItem>VA</asp:ListItem><asp:ListItem>WA</asp:ListItem><asp:ListItem>WV</asp:ListItem>
                                        <asp:ListItem>WI</asp:ListItem><asp:ListItem>WY</asp:ListItem><asp:ListItem>AS</asp:ListItem><asp:ListItem>DC</asp:ListItem>
                                        <asp:ListItem>FM</asp:ListItem><asp:ListItem>GU</asp:ListItem><asp:ListItem>MH</asp:ListItem><asp:ListItem>MP</asp:ListItem>
                                        <asp:ListItem>PW</asp:ListItem><asp:ListItem>PR</asp:ListItem><asp:ListItem>VI</asp:ListItem>
                                    </asp:DropDownList>&nbsp
                                    <asp:TextBox ID="zip_textbox" style="text-align:center;" placeholder="Zip Code" runat="server"></asp:TextBox></span></h5>
                                <br />
                                <h5 style="color:#fff;">Phones <span>
                                    <asp:TextBox ID="homephone_textbox" style="text-align:center;" placeholder="Home Phone" runat="server"></asp:TextBox>&nbsp
                                    <asp:TextBox ID="cellphone_textbox" style="text-align:center;" placeholder="Cell Phone" runat="server" Enabled="False"></asp:TextBox>&nbsp
                                    <asp:TextBox ID="emergencyphone_textbox" style="text-align:center;" placeholder="Emergency Phone" runat="server" Enabled="False"></asp:TextBox>&nbsp
                                    <asp:TextBox ID="workphone_textbox" style="text-align:center;" placeholder="Work Phone" runat="server" Enabled="False"></asp:TextBox></span></h5>
                                <br />
                                <h5 style="color:#fff;">Email<span>
                                    <asp:TextBox ID="email_textbox" style="text-align:center;" placeholder="Email Address" runat="server"></asp:TextBox></span></h5>
                                <br />
                                <asp:Button ID="save_button" style="background-color:lightgray;" class="w3-button w3-btn" runat="server" Text="Save" OnClick="save_button_Click"  />&nbsp
                                <asp:Button ID="cancel_button" style="background-color:lightgray;" class="w3-button w3-btn" runat="server" Text="Cancel" OnClick="cancel_button_Click" />
                                <br />
                                <br />
                                <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:ParkingConnectionString %>"  UpdateCommand="UPDATE [contact] SET [fname] = @fname, [lname] = @lname, [street] = @street, [city] = @city, [states] = @states, [zip] = @zip, [phone] = @phone, [email] = @email WHERE [contactId] = @contactId">
                                    <UpdateParameters>
                                        <asp:ControlParameter ControlID="fname_textbox" Name="fname" PropertyName="Text" Type="String" />
                                        <asp:ControlParameter ControlID="lname_textbox" Name="lname" PropertyName="Text" Type="String" />
                                        <asp:ControlParameter ControlID="street_textbox" Name="street" PropertyName="Text" Type="String" />
                                        <asp:ControlParameter ControlID="city_textbox" Name="city" PropertyName="Text" Type="String" />
                                        <asp:ControlParameter ControlID="states_dropdownlist" Name="states" PropertyName="SelectedValue" Type="String" />
                                        <asp:ControlParameter ControlID="zip_textbox" Name="zip" PropertyName="Text" Type="String" />
                                        <asp:ControlParameter ControlID="homephone_textbox" Name="phone" PropertyName="Text" Type="String" />
                                        <asp:ControlParameter ControlID="email_textbox" Name="email" PropertyName="Text" Type="String" />
                                        <asp:ControlParameter ControlID="HiddenField1" Name="contactId" PropertyName="Value" Type="Int32" />
                                    </UpdateParameters>
                                </asp:SqlDataSource>
                            </div>
                        </div>
                    </div>
                </asp:View>  

            <!-- VIEW 5 : user click EDIT VEHICLES -->
            <asp:View ID="View5" runat="server">

            <!-- TOP HEADER -->
            <h1 class="top"></h1>

            <!-- LOGO -->
            <div class="logo img">
                <img src="https://ung.edu//_uploads/images/template/2015/logo-large.png" />
                <img src="https://ung.edu//_uploads/images/template/2015/logo-large-bottom.png" />
            </div>

                <!-- parking services header -->
                <!--<div class="w3-container header">-->
                <h1 class="w3-container header w3-display-topmiddle" style=" text-align:center;">Parking Services</h1>

                <!-- view 5 navbar  -->
                <div class="w3-bar w3-bottombar w3-border-white " style="background-color:#012560;">
                    <div class="w3-bar-item">
                        <asp:Button ID="view5Home_button" style="background-color:lightgray;" class="w3-button w3-btn" runat="server" Text="Home" OnClick="view5Home_button_Click"  />
                    </div>
                    <div class="w3-bar-item">
                        <asp:Button ID="view5Tickets_button" style="background-color:lightgray;" class="w3-button w3-btn" runat="server" Text="Tickets" OnClick="view5Tickets_button_Click"   />
                    </div>
                    <div class="w3-bar-item">
                        <asp:Button ID="view5Permits_button" style="background-color:lightgray;" class="w3-button w3-btn" runat="server" Text="Permits" OnClick="view5Permits_button_Click"  />
                    </div>
                    <div class="w3-bar-item w3-center">
                        <asp:Label ID="view5Error_label" style="color:red; font-variant:small-caps; font-weight:700;" runat="server" Text=""></asp:Label>
                    </div>
                    <div class="w3-bar-item w3-right">
                        <asp:Label ID="view5Who_label" style="color:#fff;" runat="server" Text=""></asp:Label>
                    </div>
                    <div class="w3-bar-item w3-right">
                        <asp:Button ID="view5Logout_button" style="background-color:lightgray;" class="w3-button w3-btn" runat="server" Text="Logout" OnClick="view5Logout_button_Click"   />
                    </div>
                </div>

                <div class="w3-col s12 w3-container w3-center"style="background-color: #012560;">
                        <div class="w3-container">
                            <div class="w3-container">
                                <h3 style="color:#fff;">Edit Vehicle</h3>
                            </div>
                            <div class="" style="">
                                <h5 style="color:#fff;">Plate #: <span>
                                    <asp:Label ID="plateNumber_label" runat="server" Text="" ></asp:Label>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                                State: 
                                    <asp:Label ID="state_label" runat="server" Text="" DataSourceID="SqlDataSource6" DataField="states"></asp:Label></span></h5><br />
                                <h5 style="color:#fff;">Year: <span>
                                    <asp:TextBox ID="year_textbox" style="text-align:center;" placeholder="Enter Vehicle Year" runat="server"></asp:TextBox></span></h5>
                                <h5 style="color:#fff;">Make: <span>
                                    <asp:TextBox ID="make_textbox" style="text-align:center;" placeholder="Enter Vehicle Make" runat="server"></asp:TextBox></span></h5>
                                <h5 style="color:#fff;">Model: <span>
                                    <asp:TextBox ID="model_textbox" style="text-align:center;" placeholder="Enter Vehicle Model" runat="server"></asp:TextBox></span></h5>
                                <h5 style="color:#fff;">Color: <span>
                                    <asp:TextBox ID="color_textbox" style="text-align:center;" placeholder="Enter Vehicle Color" runat="server"></asp:TextBox></span></h5>
                                <br />
                                <asp:Button ID="updateVehicle_button" style="background-color:lightgray;" class="w3-button w3-btn" runat="server" Text="Update" OnClick="updateVehicle_button_Click" />&nbsp
                                <asp:Button ID="cancelUpdate_button" style="background-color:lightgray;" class="w3-button w3-btn" runat="server" Text="Cancel" OnClick="cancelUpdate_button_Click" />
                                <br />
                                <br />
                            </div>
                        </div>
                </div>
                <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:ParkingConnectionString %>" SelectCommand="SELECT [plateId], [states] WHERE [contactId] = @contactId" UpdateCommand="UPDATE [vehicle] SET [yearof] = @yearof, [make] = @make, [model] = @model, [color] = @color WHERE [contactId] = @contactId">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="HiddenField1" Name="contactId" PropertyName="Value" Type="Int32" />
                    </SelectParameters>                
                    <UpdateParameters>
                        <asp:ControlParameter ControlID="year_textbox" Name="yearof" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="make_textbox" Name="make" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="model_textbox" Name="model" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="color_textbox" Name="color" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="HiddenField1" Name="contactId" PropertyName="Value" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </asp:View>


            <!-- VIEW 6 : user click view all tickets -->
            <asp:View ID="View6" runat="server">

            <!-- TOP HEADER -->
            <h1 class="top"></h1>

            <!-- LOGO -->
            <div class="logo img">
                <img src="https://ung.edu//_uploads/images/template/2015/logo-large.png" />
                <img src="https://ung.edu//_uploads/images/template/2015/logo-large-bottom.png" />
            </div>

                <!-- parking services header -->
                <!--<div class="w3-container header">-->
                <h1 class="w3-container header w3-display-topmiddle" style=" text-align:center;">Parking Services</h1>

                <!-- view 6 navbar  -->
                <div class="w3-bar w3-bottombar w3-border-white " style="background-color:#012560;">
                    <div class="w3-bar-item">
                        <asp:Button ID="view6Home_button" style="background-color:lightgray;" class="w3-button w3-btn" runat="server" Text="Home" OnClick="view6Home_button_Click"   />
                    </div>
                    <div class="w3-bar-item">
                        <asp:Button ID="view6Tickets_button" style="background-color:lightgray;" class="w3-button w3-btn" runat="server" Text="Tickets" OnClick="view6Tickets_button_Click"    />
                    </div>
                    <div class="w3-bar-item">
                        <asp:Button ID="view6Permits_button" style="background-color:lightgray;" class="w3-button w3-btn" runat="server" Text="Permits" OnClick="view6Permits_button_Click"   />
                    </div>
                    <div class="w3-bar-item w3-center">
                        <asp:Label ID="view6Error_label"  style="color:red; font-variant:small-caps; font-weight:700;" runat="server" Text=""></asp:Label>
                    </div>
                    <div class="w3-bar-item w3-right">
                        <asp:Label ID="view6Who_label" style="color:#fff;" runat="server" Text=""></asp:Label>
                    </div>
                    <div class="w3-bar-item w3-right">
                        <asp:Button ID="view6Logout_button" style="background-color:lightgray;" class="w3-button w3-btn" runat="server" Text="Logout" OnClick="view6Logout_button_Click"    />
                    </div>
                </div>

                <div class="w3-col s12 w3-container w3-center"style="background-color: #012560;">
                    <div class="w3-container">
                        <div class="w3-container">
                            <h3 style="color:#fff;">Tickets</h3>
                        </div>
                        <div class="" style="display:flex; justify-content:center;">
                            <asp:GridView ID="GridView4" runat="server" AutoGenerateColumns="False" DataKeyNames="Ticket #" DataSourceID="SqlDataSource4" ForeColor="black" CellPadding="8" CellSpacing="2" BorderColor="Black" GridLines="Vertical">
                                <AlternatingRowStyle BackColor="lightgray" />
                                <Columns>
                                    <asp:BoundField DataField="Ticket #" HeaderText="Ticket #" InsertVisible="False" ReadOnly="True" SortExpression="Ticket #" />
                                    <asp:BoundField DataField="Issue Date" HeaderText="Issue Date" ReadOnly="True" SortExpression="Issue Date" />
                                    <asp:BoundField DataField="Current Status" HeaderText="Current Status" SortExpression="Current Status" />
                                    <asp:BoundField DataField="Location" HeaderText="Location" SortExpression="Location" />
                                    <asp:BoundField DataField="Plate #" HeaderText="Plate #" ReadOnly="True" SortExpression="Plate #" />
                                    <asp:BoundField DataField="Violation" HeaderText="Violation" SortExpression="Violation" />
                                    <asp:BoundField DataField="Amount" HeaderText="Amount" SortExpression="Amount" />
                                </Columns>
                                <HeaderStyle BackColor="Gray" />
                                <RowStyle BackColor="lightgray" />
                            </asp:GridView>
                        </div>
                        <br />
                        <br />
                        <div class="w3-col s12 w3-container w3-center"style="background-color: #012560;">
                            <asp:Button ID="pay_button" style="background-color:lightgray;" class="w3-button w3-btn" runat="server" Text="Pay Balance" />
                        </div>

                            <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ParkingConnectionString %>" SelectCommand="get_tickets" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="HiddenField1" Name="contactId" PropertyName="Value" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                    </div>
                </div>
            </asp:View>


            <!-- VIEW 7 : user click order new permit -->
            <asp:View ID="View7" runat="server">

            <!-- TOP HEADER -->
            <h1 class="top"></h1>

            <!-- LOGO -->
            <div class="logo img">
                <img src="https://ung.edu//_uploads/images/template/2015/logo-large.png" />
                <img src="https://ung.edu//_uploads/images/template/2015/logo-large-bottom.png" />
            </div>

                <!-- parking services header -->
                <!--<div class="w3-container header">-->
                <h1 class="w3-container header w3-display-topmiddle" style=" text-align:center;">Parking Services</h1>

                <!-- view 7 navbar  -->
                <div class="w3-bar w3-bottombar w3-border-white " style="background-color:#012560;">
                    <div class="w3-bar-item">
                        <asp:Button ID="view7Home_button" style="background-color:lightgray;" class="w3-button w3-btn" runat="server" Text="Home" OnClick="view7Home_button_Click"    />
                    </div>
                    <div class="w3-bar-item">
                        <asp:Button ID="view7Tickets_button" style="background-color:lightgray;" class="w3-button w3-btn" runat="server" Text="Tickets" OnClick="view7Tickets_button_Click"    />
                    </div>
                    <div class="w3-bar-item">
                        <asp:Button ID="view7Permits_button" style="background-color:lightgray;" class="w3-button w3-btn" runat="server" Text="Permits" OnClick="view7Permits_button_Click"    />
                    </div>
                    <div class="w3-bar-item w3-center">
                        <asp:Label ID="view7Error_label" style="color:red; font-variant:small-caps; font-weight:700;" runat="server" Text=""></asp:Label>
                    </div>
                    <div class="w3-bar-item w3-right">
                        <asp:Label ID="view7Who_label" style="color:#fff;" runat="server" Text=""></asp:Label>
                    </div>
                    <div class="w3-bar-item w3-right">
                        <asp:Button ID="view7Logout_button" style="background-color:lightgray;" class="w3-button w3-btn" runat="server" Text="Logout" OnClick="view7Logout_button_Click"    />
                    </div>
                </div>

                <div class="w3-col s12 w3-container w3-center"style="background-color: #012560;">
                    <div class="w3-container">
                        <div class="w3-container">
                            <h3 style="color:#fff;">Order New Permit</h3>
                        </div>
                        <br />
                        <div class="">
                            <h5 style="color:#fff;">Select A Permit Type: <span>
                                <asp:DropDownList ID="permitType_dropdownlist" runat="server">
                                    <asp:ListItem>Emp - Blue Ridge</asp:ListItem><asp:ListItem>Emp - Cumming</asp:ListItem><asp:ListItem>Emp - Gainesville</asp:ListItem>
                                    <asp:ListItem>Emp - Oconee</asp:ListItem><asp:ListItem>Stu - Blue Ridge Campus</asp:ListItem>
                                    <asp:ListItem>Stu - Cumming Campus</asp:ListItem><asp:ListItem>Stu - Dahl. Commuter</asp:ListItem>
                                    <asp:ListItem>Stu - Dahl. Residence Hall</asp:ListItem><asp:ListItem>Stu - Gainesville Campus</asp:ListItem>
                                    <asp:ListItem>Stu - Oconee Campus</asp:ListItem>
                                </asp:DropDownList><span style="font-size:10pt; font-style:italic;">
                                <br />
                            Please Note: All decals are honored at all UNG Campuses</span></span></h5>
                            <br />
                            <h5 style="color:#fff;">Select A Vehicle or Add New Vehicle: <span>
                                <asp:DropDownList ID="selectVehicle_dropdownlist" runat="server" DataSourceID="SqlDataSource1" DataTextField="Make" DataValueField="Plate #"></asp:DropDownList>&nbsp
                                <asp:Button ID="addVehicle_button" style="background-color:lightgray; color:black;"  class="w3-button w3-btn" runat="server" Text="Add New Vehicle" /></span></h5>
                            <br />
                            <h5 style="color:#fff;">Accept Terms:</h5>
                                <div class="" style="height:250px; overflow-y:visible; padding:10px; display:flex; justify-content:center;">
                                    <div class="" id="termsbox" style=" text-align:center; display:flex; justify-content:center;">
                                        <h3>University of North Georgia Parking and Transportation Services Rules and Regulations</h3>
                                            <h5>ARTICLE I: AUTHORITY</h5>
                                                <p>Authority from the Board of Regents</p>
                                                <p>By virtue of the powers granted to the Board of Regents of the University System of Georgia by the Georgia Constitution, the Board of Regents has the authority to adopt bylaws and policies for the management and governance of this member institutions. The Board of Regents further elects a Chancellor of the System, under whose supervision the presidents of the various institutions are given responsibility and authority to promote the efficient operation of the same. The Parking Service Department is a delegated authority and responsible for the administration of policies and parking regulations designed to promote a safe and efficient parking system.</p>
                                        <h5>ARTICLE II: GENERAL</h5>
                                            <p>These parking rules and regulations establish vehicle regulations on property owned or controlled by UNG. Parking Services is a division of Auxiliary Services.</p>
                                            <p>Parking Services implements the University’s parking plan and manages vehicle registration, permit issuance, lot enforcement, fine collection, citation appeal, immobilization and towing for various unsafe and illegal parking practices, lot scheduling for special events.</p>
                                            <p>It is the desire and intent of the university to provide an adequate amount of parking corresponding with the needs of the faculty, staff, and student body limited by constraints of land and finances</p>
                                            <p>University of North Georgia assumes no responsibility accepts no for a vehicle or its contents while parked or operated on University grounds.</p>
                                        <h5> And so on. . .</h5>
                                            <p>We own you.</p>
                                            <p>The parking lot is not for parking, if we say so.</p>
                                            <p>At all times there shall be more empty faculty-only parking spots than student parking spots.</p>
                                            <p>Patrol personnel have the right to creepily stare into your vehicle for as much time as needed to make the patron feel awkwardly uncomfortable.</p>
                                            </div>
                                        </div>
                            <div class="">
                                <h6 style="color:#fff;"> <span>
                                    <asp:CheckBox ID="CheckBox1" runat="server" />&nbsp
                                    I have read and agree to the terms of service</span></h6>
                                <br />
                                <asp:Button ID="submitNewpermit_button" style="background-color:lightgray;" class="w3-button w3-btn" runat="server" Text="Add to Cart" />
                                <br />
                                <br />
                            </div>
                        </div>
                    </div>
                </div>
            </asp:View>

            
        </asp:MultiView>

        



    </form>

</body>

</html>
