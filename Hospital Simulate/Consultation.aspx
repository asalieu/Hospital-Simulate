<%@ Page Title="" Language="C#" MasterPageFile="~/doctorsMasterPage.Master" AutoEventWireup="true" CodeBehind="Consultation.aspx.cs" Inherits="Hospital_Simulate.Consultation" %>
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
            margin-top: 10px;
            font-size: 23px;
            color: darkblue;
            margin-bottom: 20px;

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
                        <a href="consultation.aspx" style="color: #fff; text-decoration: none; font-family: Footlight MT Light;  font-size: 14px">Manage Appointments</a>
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
     <div style="background: #ecedef;">
        <style>
            span p {
                float: right;
            }
        </style> 
        <div style="border: 1px solid #99B3FF; border-left: none; border-right: none; height: 60px; margin-bottom: 10px">
            <span><i class="fa fa-info-circle"></i>
                <em style="color: #000; font-family: Tiranti Solid LET; width: 100%">Doctor's Dashboard</em>
                <p style="text-align: center">
                    Active Appointments
                <br />
                    <asp:Label Text="6" runat="server" />
                </p>
                <p style="text-align:center;margin-left:5px">
                    Re-Scheduled Appointments   |    
                    <br />
                    <asp:Label Text="4" runat="server" />
                </p>
                
            </span>
        </div> 
        
            <div id="smainTable" style="border-radius:30px">
                <h5>Consultation Booking </h5> 
                <table class="table" style="width:40%;margin:auto;font-family:'helvetica',Segoe UI;font-size:17px; background-color:#99B3FF;border-radius:30px">
                    <tr>
                        <td>Enter PatienID</td>
                        <td>
                          <asp:TextBox ID="txtpid" Width="160" runat="server"></asp:TextBox> 
                            <asp:Button runat="server" CssClass="btn btn Success" Text="GO" ID="btnGo" OnClick="btnGo_Click" />
                           
                        </td>
                       
                        
                    </tr>
                   
                    <tr>
                        <td>Full Name</td>
                        <td><asp:TextBox runat="server" ID="txtfname" CssClass="form-control" ></asp:TextBox></td>
                        
                    </tr>      
                     <tr>
                        <td>Condition</td>
                        <td><asp:TextBox runat="server" ID="txtcondition" CssClass="form-control" ></asp:TextBox></td>
                        
                    </tr>
                      <tr>
                        <td>Topography</td>
                        <td><asp:TextBox runat="server" ID="txttopography" CssClass="form-control" ></asp:TextBox></td>
                        
                    </tr>               
                      <tr>
                        <td>Birth Date</td>
                        <td><asp:TextBox runat="server" ID="txtdob" CssClass="form-control"  TextMode="Date"></asp:TextBox></td>
                        
                    </tr>
                     <tr>
                        <td>Appointment Date</td>
                        <td><asp:TextBox runat="server" ID="txtapptdt" CssClass="form-control" TextMode="Date"></asp:TextBox></td>
                        
                    </tr>
                      <tr>
                        <td>Phone</td>
                        <td><asp:TextBox runat="server" ID="txtphone" CssClass="form-control" ></asp:TextBox></td>
                        
                    </tr>
                      <tr>
                        <td>Address</td>
                        <td><asp:TextBox runat="server" ID="txtadd" CssClass="form-control" TextMode="MultiLine" ></asp:TextBox></td>
                         
                    </tr>
                    

                    <tr>
                        <td>Action</td>
                        <td>
                            <asp:Button Text="SAVE" ID="btnSave" runat="server" CssClass="btn btn-success" OnClick="btnSave_Click" />
                            <asp:Button Text="RESET" runat="server" CssClass="btn btn-warning" OnClick="Unnamed5_Click" />
                        
                        </td>
                    </tr>
                </table>
            </div>

        </div> 
</asp:Content>
