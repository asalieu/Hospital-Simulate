<%@ Page Title="" Language="C#" MasterPageFile="~/doctorsMasterPage.Master" AutoEventWireup="true" CodeBehind="Prescriptions.aspx.cs" Inherits="Hospital_Simulate.Prescriptions" %>
<asp:Content ID="Content2" ContentPlaceHolderID="fMainBody" runat="server">
     <link href="Content/jquery.dataTables.min.css" rel="stylesheet" />
    <script src="Content/jquery.dataTables.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $('#table').DataTable({

            });
        });
        var table = $('#table').DataTable({
            ajax: "data.json"
        });

        setInterval(function () {
            table.ajax.reload(null, false); // user paging is not reset on reload
        }, 30000);
    </script>
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" />
    <style>
        #mainTable {
        }

        table, thead, tbody {
            margin-left: -15px;
        }

        h5 {
            text-align: center;
            font-family: 'Segoe UI'; 
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
        <table class="maintbl" style="background-color: #3057d4; width: 100%">

            <tr>
                <td style="border: 1px solid initial; height: 200px">
                    <asp:Image runat="server" src="images/avatar1.jpg"  Height="209"></asp:Image>
                </td>
            </tr>
            <tr>

                <td class="auto-style1" style="margin-bottom: 40px">
                    <p style="border-bottom: 0.1px solid  #698fb0;">
                        <img src="images/scrren.svg" width="50" height="25" />
                        <a href="DoctorPage.aspx" style="color: #fff; text-decoration: none; font-family: Footlight MT Light; font-size: 14px">Dashboard</a>
                    </p>
                    <p style="border-bottom: 0.1px solid  #698fb0;">
                        <img src="images/ld.svg" style="" width="55" height="30" />
                        <a href="Patients.aspx" style="color: #fff; text-decoration: none; font-family: Footlight MT Light; font-size: 14px">Patients</a>
                    </p>
                    <p style="border-bottom: 0.1px solid  #698fb0;">
                        <img src="images/docs.svg" style="" width="50" height="20" />
                        <a href="Prescriptions.aspx" style="color: #fff; text-decoration: none; font-family: Footlight MT Light; font-size: 14px">Manage Priscription</a>
                    </p>
                    <p style="border-bottom: 0.1px solid  #698fb0;">
                        <img src="images/adds.svg" style="" width="50" height="30" />
                        <a href="consultation.aspx" style="color: #fff; text-decoration: none; font-family: Footlight MT Light; font-size: 14px">Manage Appointments</a>
                    </p>
                    <p style="border-bottom: 0.1px solid #698fb0;">
                        <img src="images/accounts.svg" style="" width="50" height="30" />
                        <a href="#" style="color: #fff; text-decoration: none; font-family: Footlight MT Light; font-size: 14px">View History</a>
                    </p>
                    <p style="border-bottom: 0.1px solid  #698fb0;">
                        <img src="images/usersettings.svg" style="" width="50" height="30" />
                        <a href="#" style="color: #fff; text-decoration: none; font-family: Footlight MT Light; font-size: 14px">User Settings</a>

                    </p>
                    <p style="border-bottom: 0.1px solid  #698fb0;">
                        <img src="images/reports.png" style="" width="50" height="35" />
                        <a href="#" style="color: #fff; text-decoration: none; font-family: Footlight MT Light; font-size: 14px">Reports</a>

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
    <div style="border: ; width: 100%"> 
        <div class="col-md-3">
            <table class="stable" style="border-top-right-radius:20px;border-bottom-right-radius:20px; font-size:14px; font-family:'Segoe UI'; background-color:#ffffff; border: none">
                <tr>
                    <td colspan="4">
                        <h4 style="color: red;font-family:'Frutiger LT 65'">Patient Info:</h4>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label runat="server" Text="PatientID" ForeColor="#3333ff"  />:
                        <asp:Label ID="lblid" runat="server" /><br />
                        <asp:Label Text="FullName" ForeColor="#3333ff"  runat="server"  />: 
                        <asp:Label ID="lblname" runat="server" /> <br /> 
                        <asp:Label Text="Age" ForeColor="#3333ff" runat="server" /> : 
                        <asp:Label ID="txtage" runat="server" /> 
                    </td> 
                </tr> 
                <tr>
                    <td>
                        <asp:Label Text="Address" runat="server" ForeColor="#3333ff"  /> : 
                        <asp:Label  ID="txtaddress" runat="server" /> <br />
                        <asp:Label Text="Phone" runat="server" ForeColor="#3333ff" /> : 
                        <asp:Label  ID="txtphone" runat="server" />
                    </td> 
                </tr>

            </table>
        </div>
        <div class="col-md-9"> 
                <table class="table-condensed" style="margin:auto;background-color:ActiveBorder; border-radius:30px">
                   <tr>
                       <td colspan="8">
                           <h4 style="text-align:center;font-family:'Frutiger LT 65';color:red;">Add New Prescription </h4>
                       </td>
                   </tr>
                     <tr>
                        <td>Drug Type</td>
                        <td>
                            <asp:DropDownList runat="server" ID="ddldrugtype" CssClass="form-control">
                                <asp:ListItem Text="Inj" />
                                <asp:ListItem Text="Tab" />
                            </asp:DropDownList>
                        </td>
                        <td>Drug Name</td>
                        <td>
                            <asp:DropDownList runat="server" ID="ddldrugname" CssClass="form-control">
                                <asp:ListItem Text="Quinin" />
                                <asp:ListItem Text="Doxy" />
                            </asp:DropDownList>
                        </td>
                        <td>Dosage</td>
                        <td>
                            <asp:DropDownList runat="server" ID="ddldrugdosage" CssClass="form-control">
                                <asp:ListItem Text="1-1-1" />
                                <asp:ListItem Text="0-1-1" />
                                <asp:ListItem Text="0-0-1" />
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>                        
                        <td>Drug Strength</td>
                        <td>
                            <asp:DropDownList runat="server" ID="ddldrugstrength" CssClass="form-control">
                                <asp:ListItem Text="120mg" />
                                <asp:ListItem Text="100ml" />
                            </asp:DropDownList>
                        </td>
                        <td>Days</td>
                        <td>
                            <asp:DropDownList runat="server" ID="ddldays" CssClass="form-control">
                                <asp:ListItem Text="1" />
                                <asp:ListItem Text="2" />
                                <asp:ListItem Text="3" />
                                <asp:ListItem Text="4" />
                                <asp:ListItem Text="5" />
                                <asp:ListItem Text="6" />
                                <asp:ListItem Text="7" />
                                <asp:ListItem Text="8" />
                                <asp:ListItem Text="9" />
                                <asp:ListItem Text="10" />
                                <asp:ListItem Text="11" />
                                <asp:ListItem Text="12" />
                                <asp:ListItem Text="13" />
                                <asp:ListItem Text="14" />
                                <asp:ListItem Text="15" />
                                <asp:ListItem Text="16" />
                                <asp:ListItem Text="17" />
                                <asp:ListItem Text="18" />
                                <asp:ListItem Text="19" />
                                <asp:ListItem Text="20" />
                            </asp:DropDownList>
                        </td>
                        <td>Drug Advise</td>
                        <td>
                            <asp:TextBox TextMode="MultiLine" ID="txtadvise" runat="server" CssClass="form-control"> 
                            </asp:TextBox>
                        </td>
                        <td>
                            <asp:Button Text="Add" runat="server" CssClass="btn btn-success" ID="btnAdd" OnClick="btnAdd_Click" />
                        </td>
                        <td>
                            <asp:Button Text="Clear" runat="server" CssClass="btn btn-reset" />
                        </td>
                    </tr> 
                </table>
            </div> 
        </div>
         <div>
        <div id="mainTable">
            <h4 style="color:darkblue;font-family:'Segoe UI'">Prescriptions</h4> 
            <table class="table" id="table" style="width:100%; margin:auto;border-radius:30px">
                <thead  style="width:100%;background-color:#3057d4; margin:auto">
                    <tr>
                        <th>PatientID</th>
                        <th>Drug Name</th>
                        <th>Type</th>
                        <th>Dosage</th>
                        <th>Strength</th>
                        <th>Days</th>
                        <th>Advise</th>
                        <th>Prescribed By</th>
                        <th>Prescribe Date</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody id="tlist" runat="server"  style="width:100%;background-color:#fff; margin:auto">
                </tbody>
            </table>
        </div>
    </div> 
</asp:Content>
