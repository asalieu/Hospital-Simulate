<%@ Page Title="" Language="C#" MasterPageFile="~/doctorsMasterPage.Master" AutoEventWireup="true" CodeBehind="Patients.aspx.cs" Inherits="Hospital_Simulate.Patients" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="fMainBody" runat="server">
     <link href="Content/jquery.dataTables.min.css" rel="stylesheet" />
    <script src="Content/jquery.dataTables.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"></script>
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
        
            <div id="mainTable">
                <h5>Patient Master Records </h5>
                <div>
                <a href="RegisterPatient.aspx">
                    <i class="fa fa-plus-square" >AddNew</i>  <%--<asp:Button CssClass="btn btn-info" runat="server" Text="AddNew"  />--%>
                </a>
                <br />
                <br />
                <table class="dataTable" id="table">
                    <thead>
                        <tr>
                            <th>ID No</th> 
                            <th>FullName</th>
                            <th>Sex</th>
                            <th>Admit Date</th>
                            <th>D.O.B</th> 
                            <th>Phone</th>
                            <th>Address</th>
                            <th>Complain</th> 
                            <th>Select Option</th>
                        </tr>
                    </thead>
                    <tbody id="tlist" runat="server">
                    </tbody>
                </table>
            </div>

        </div>
    </div>
</asp:Content>