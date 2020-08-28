<%@ Page Title="" Language="C#" MasterPageFile="~/doctorsMasterPage.Master" AutoEventWireup="true" CodeBehind="RegisterPatient.aspx.cs" Inherits="Hospital_Simulate.RegisterPatient" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="fMainBody" runat="server">
      <link href="Content/jquery.dataTables.min.css" rel="stylesheet" />
    <script src="Content/jquery.dataTables.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $('#table').DataTable({

            });
        });
    </script>
    <style>
        #mainTable {
        }

        table, thead, tbody { 
            margin-left: -15px;
        }

        h5 {
            text-align: center;
            font-family: 'Segoe UI';
            margin-top: 40px;
            font-size: 23px;
            color: darkblue;
            margin-bottom: 0px;
        }

        .paging_full_numbers span.paginate_button {
            background-color: #fff;
        }

            .paging_full_numbers span.paginate_button:hover {
                background-color: #ccc;
            }

        .paging_full_numbers span.paginate_active {
            background-color: #99B3FF;
        }

        #filders {
            margin-top: 10px;
            padding-bottom: 30px;
        }



        .fa {
            font-size: 22px;
        }
    </style>
    <div>
        <table class="maintbl" style="background-color:#3057d4; width: 100%">

            <tr>
                <td style="border: 1px solid initial; height: 200px">
                   <asp:Image runat="server" src="images/avatar1.jpg"  Height="209"></asp:Image>
                </td>
            </tr>
            <tr>

                <td class="auto-style1" style="margin-bottom: 40px">
                    <p style="border-bottom: 0.1px solid  #698fb0;">
                        <img src="images/scrren.svg" width="50" height="25" />
                        <a href="DoctorPage.aspx" style="color: #fff; text-decoration: none; font-family: Footlight MT Light;  font-size: 14px">Dashboard</a>
                    </p>
                    <p style="border-bottom: 0.1px solid  #698fb0;">
                        <img src="images/ld.svg" style="" width="55" height="30" />
                        <a href="Patients.aspx" style="color: #fff; text-decoration: none; font-family: Footlight MT Light;  font-size: 14px">Patients</a>
                    </p>
                    <p style="border-bottom: 0.1px solid  #698fb0;">
                        <img src="images/docs.svg" style="" width="50" height="20" />
                        <a href="Prescriptions.aspx" style="color: #fff; text-decoration: none; font-family: Footlight MT Light;  font-size: 14px">Manage Priscription</a>
                    </p>
                    <p style="border-bottom: 0.1px solid  #698fb0;">
                        <img src="images/adds.svg" style="" width="50" height="30" />
                        <a href="consultation.aspx" style="color: #fff; text-decoration: none; font-family: Footlight MT Light;  font-size: 14px">Manage Consultations</a>
                    </p>
                    <p style="border-bottom: 0.1px solid #698fb0;">
                        <img src="images/accounts.svg" style="" width="50" height="30" />
                        <a href="#" style="color: #fff; text-decoration: none; font-family: Footlight MT Light;  font-size: 14px">View History</a>
                    </p>
                    <p style="border-bottom: 0.1px solid  #698fb0;">
                        <img src="images/usersettings.svg" style="" width="50" height="30" />
                        <a href="#" style="color: #fff; text-decoration: none; font-family: Footlight MT Light;  font-size: 14px">User Settings</a>

                    </p>
                    <p style="border-bottom: 0.1px solid  #698fb0;">
                        <img src="images/reports.png" style="" width="50" height="35" />
                        <a href="#" style="color: #fff; text-decoration: none; font-family: Footlight MT Light;  font-size: 14px">Reports</a>

                    </p>
                   
                </td>
            </tr>
            <tr>
                <td style="border: 1px solid inherit; height: 80px">
                    <asp:Image runat="server"></asp:Image>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="sMainContent" runat="server">
     <div style="margin: auto; width: 70%;">

        <div style="margin: auto; width: 50%; border: 3px solid #0b5a85; border-left-color:#84db41; border-right-color:red; border:double; border-top-left-radius: 10px; border-top-right-radius: 40px; font-size: 18px; font-family: 'Segoe UI'; color: darkblue">

            <h6 style="font-size: 18px; font-family: 'Segoe UI'; color: darkblue; text-align: center; width: ">Register Patient</h6>

            <asp:Label Text="Admission No" runat="server" />   :         
            <asp:Label ID="ptxtregid" runat="server" />  <br />

            <asp:Label Text="First Name" runat="server" />
            <asp:TextBox runat="server" CssClass="form-control" ID="txtfname" Font-Names="Segoe UI" Font-Size="14" placeholder="Macky " />

            <asp:Label Text="Last Name" runat="server" />
            <asp:TextBox runat="server" CssClass="form-control" ID="txtlname" Font-Names="Segoe UI" Font-Size="14" placeholder="Sall" />

            <asp:Label Text="Gender" runat="server" />
            <asp:TextBox runat="server" CssClass="form-control" ID="txtgender" Font-Names="Segoe UI" Font-Size="14" placeholder="Sall" />

            <asp:Label Text="AdmitDate" runat="server" />
            <asp:TextBox runat="server" CssClass="form-control" TextMode="Date" ID="txtadmitdate" Font-Names="Segoe UI" Font-Size="14" placeholder="President" />

            <asp:Label Text="Birth Date" runat="server" />
            <asp:TextBox runat="server" CssClass="form-control" ID="txtdob" TextMode="Date" Font-Names="Segoe UI" Font-Size="14" placeholder="2018-11-28" />

            <asp:Label Text="Phone No" runat="server" />
            <asp:TextBox runat="server" CssClass="form-control" ID="txtphone" Font-Names="Segoe UI" Font-Size="14" placeholder="01" />
           
            <asp:Label Text="Address" runat="server" />
            <asp:TextBox runat="server" CssClass="form-control" ID="txtaddress" Font-Names="Segoe UI" Font-Size="14" placeholder="157 Road Drive" />
         
             <asp:Label Text="Condition" runat="server" />
            <asp:DropDownList ID="ddlcondition"  Font-Names="Segoe UI" Font-Size="12" CssClass="form-control" runat="server">
                <asp:ListItem Value="flu">Flu</asp:ListItem>
                <asp:ListItem Value="cancer">Cancer</asp:ListItem>
            </asp:DropDownList>
         
             <asp:Label Text="Topography" runat="server" />
            <asp:DropDownList ID="ddltopography"  Font-Names="Segoe UI" Font-Size="12" CssClass="form-control" runat="server" style="margin-bottom:5px" >
                <asp:ListItem Value="head">Head</asp:ListItem>
                <asp:ListItem Value="breast">Breast</asp:ListItem>
                <asp:ListItem Value="neck">Neck</asp:ListItem>
                <asp:ListItem Value="none">None</asp:ListItem>
            </asp:DropDownList>
             
            <asp:Button runat="server" Text="SAVE" ID="btnAddPatient" CssClass="btn btn-success" OnClick="btnAddPatient_Click" />
            <asp:Button runat="server" Text="Reset" ID="btnReset" CssClass="btn btn-warning" />
            <asp:Button runat="server" Text="GoBack" ID="btnBack" CssClass="btn btn-info" />


        </div>
    </div>
</asp:Content>
