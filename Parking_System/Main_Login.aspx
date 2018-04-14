<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Main_Login.aspx.cs" Inherits="Parking_System.Main_Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css"/>
    <link href="Styling/main_style.css" rel="stylesheet" />
    <title>Parking Services</title>
    <style>
        .header{background-color:#012560; color:#fff; font-variant:small-caps; }
    </style>
</head>

<body>

    <form id="form1" runat="server">

        <!-- MULTI VIEW : VIEW 0 -->
        <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">

            <!-- VIEW 1 -->
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
                
                

                <!-- navbar -->
                <div class="w3-bar w3-bottombar w3-border-white " style="background-color:#012560;">
                    <div class="w3-bar-item">
                        <asp:Button ID="home_button" style="background-color:lightgray;" class="w3-button w3-btn" runat="server" Text="Home" OnClick="home_button_Click" />
                    </div>
                    <div class="w3-bar-item">
                        <asp:Button ID="tickets_button" style="background-color:lightgray;" class="w3-button w3-btn" runat="server" Text="Tickets" OnClick="tickets_button_Click" />
                    </div>
                    <div class="w3-bar-item">
                        <asp:Button ID="permits_button" style="background-color:lightgray;" class="w3-button w3-btn" runat="server" Text="Permits" OnClick="permits_button_Click" />
                    </div>
                    <div class="w3-bar-item w3-right">
                        <asp:Button ID="login_button" style="background-color:lightgray;" class="w3-button w3-btn" runat="server" Text="Click here to login" OnClick="login_button_Click" />
                    </div>
                </div>


                <!-- big button options -->
                <div class="" style="display:flex; flex-direction:column; justify-content:center;">
                    <!--<div class="w3-row w3-container w3-center w3-gray">-->
                        <div class="w3-col w3-container w3-center " style="background-color: #012560; ">
                            <asp:Button ID="lookup_button" class="btns grow" style="background-color: #393333;" runat="server" Text="Lookup A Ticket" OnClick="lookup_button_Click" />
                        </div>
                        <div class="w3-col w3-container w3-center " style="background-color: #012560; ">
                            <asp:Button ID="request_button" class="btns grow" style="background-color: #393333;" runat="server" Text="Request A Permit" OnClick="request_button_Click" />
                        </div>
                        <div class="w3-col w3-container w3-center " style="background-color: #012560; ">
                            <asp:Button ID="view_button" class="btns grow" style="background-color: #393333;" runat="server" Text="View Parking Account" OnClick="view_button_Click" />
                        </div>
                </div>

                <div class="footimg w3-card-4" style="height:300px; width:100%;">
                    <br />

                </div>

            </asp:View>
            
            <!-- VIEW 2 : click navbar tickets -->
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

                <!-- navbar -->
                <div class="w3-bar w3-bottombar w3-border-white " style="background-color:#012560;">
                    <div class="w3-bar-item">
                        <asp:Button ID="Button1" style="background-color:lightgray;" class="w3-button w3-btn" runat="server" Text="Home" OnClick="home_button_Click" />
                    </div>
                    <div class="w3-bar-item">
                        <asp:Button ID="Button4" style="background-color:lightgray;" class="w3-button w3-btn" runat="server" Text="Tickets" OnClick="tickets_button_Click" />
                    </div>
                    <div class="w3-bar-item">
                        <asp:Button ID="Button5" style="background-color:lightgray;" class="w3-button w3-btn" runat="server" Text="Permits" OnClick="Button5_Click" />
                    </div>
                    <div class="w3-bar-item w3-right">
                        <asp:Button ID="Button6" style="background-color:lightgray;" class="w3-button w3-btn" runat="server" Text="Click here to login" OnClick="Button6_Click" />
                    </div>
                </div>

                <div class="w3-col s12 w3-container w3-center" style="background-color:#012560;">
                    <div class="w3-container">
                        <div class="w3-container">
                            <h3 style="color: #fff;">Lookup A Parking Ticket</h3>
                        </div>
                        <div class="">
                            <asp:TextBox ID="TextBox1" style="text-align:center;" placeholder="Enter Ticket #" runat="server"></asp:TextBox>
                            <br />
                            <br />
                            <asp:TextBox ID="TextBox2" style="text-align:center;" placeholder="Enter Plate # or VIN" runat="server"></asp:TextBox>
                            <br />
                            <br />
                            <asp:Button ID="ticketsearch_button" style="background-color:lightgray;" class="w3-button w3-btn" runat="server" Text="Search" OnClick="ticketsearch_button_Click" />
                            <br />
                            <br />
                        </div>
                    </div>
                </div>
                
                
            </asp:View>

            <!-- VIEW 3 : click navbar permits -->
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

                <!-- nav bar -->
                <div class="w3-bar w3-bottombar w3-border-white " style="background-color:#012560;">
                    <div class="w3-bar-item">
                        <asp:Button ID="Button7" style="background-color:lightgray;" class="w3-button w3-btn" runat="server" Text="Home" OnClick="home_button_Click" />
                    </div>
                    <div class="w3-bar-item">
                        <asp:Button ID="Button8" style="background-color:lightgray;" class="w3-button w3-btn" runat="server" Text="Tickets" OnClick="tickets_button_Click" />
                    </div>
                    <div class="w3-bar-item">
                        <asp:Button ID="Button9" style="background-color:lightgray;" class="w3-button w3-btn" runat="server" Text="Permits" OnClick="Button9_Click" />
                    </div>
                    <div class="w3-bar-item w3-right">
                        <asp:Button ID="Button10" style="background-color:lightgray;" class="w3-button w3-btn" runat="server" Text="Click here to login" OnClick="Button10_Click" />
                    </div>
                </div>

                <div class="w3-col s12 w3-container w3-center" style="background-color: #012560;">
                    <div class="w3-container">
                        <div class="w3-container" style="color:#fff;">
                            <h3>UNG Authentication</h3>
                            <p>Successful login requires your UNG network ID and password.</p>
                            <p>For example, if your email address is jtdoe1234@ung.edu then login using jtdoe1234 along with your email password.</p>
                        </div>

                        <div class="">
                            <asp:TextBox ID="uname_textbox" style="text-align:center;" placeholder="Enter Username" runat="server"></asp:TextBox>
                            <br />
                            <br />
                            <asp:TextBox ID="pword_textbox" style="text-align:center;" placeholder="Enter Password" runat="server"></asp:TextBox>
                            <br />
                            <asp:Label ID="error_label" style="color:#fff; font-variant:small-caps; font-weight:700;" runat="server" Text=""></asp:Label>
                            <br />
                            <asp:Button ID="enter_button" style="background-color:lightgray;" class="w3-button w3-btn" runat="server" Text="Login" OnClick="enter_button_Click" />
                            <br />
                            <br />
                        </div>
                    </div>
                </div>
            </asp:View>
        
        </asp:MultiView>

    </form>

</body>

</html>
