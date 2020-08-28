<%@ Page Title="" Language="C#" MasterPageFile="~/doctorsMasterPage.Master" AutoEventWireup="true" CodeBehind="DoctorPage.aspx.cs" Inherits="Hospital_Simulate.DoctorPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="fMainBody" runat="server">

    <link href="Content/jquery.dataTables.min.css" rel="stylesheet" />
    <script src="Content/jquery.dataTables.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $('#table').DataTable({
                "bLengthChange": true,
                "paging": true,
                "pageLength": 4,
                "sPaginationType": "full_numbers",
                //For Different Paging  Style
                // "scrollY": 400,                                     // For Scrolling
                // "jQueryUI": true,
                //"perPage": 7,
                //"showPrevNext": false,
                //"numbersPerPage": 4,
                // "hidePageNumbers": false,
                // "showFirstLast": true
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
            margin-top: 0px;
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
                        <a href="Manage_appointment.aspx" style="color: #fff; text-decoration: none; font-family: Footlight MT Light;  font-size: 14px">Manage Appointments</a>
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
            #sd{
                background:url(images/dtBg.png) no-repeat #999;
                background-size:cover;
            }
        </style>
        <div style="border: 1px solid #99B3FF; border-left: none; border-right: none; height: 60px; margin-bottom: 10px">
            <span><i class="fa fa-info-circle"></i>
                <em style="color: #000; font-family: Tiranti Solid LET; width: 100%">Doctor's Dashboard</em>
                <p style="text-align: center">
                    Doctors
                <br />
                    <asp:Label Text="6" runat="server" />
                </p>
                <p style="text-align: center">
                    Nurses<br />
                    <asp:Label Text="4" runat="server" />
                </p>
                <p style="text-align: center">
                    Patients<br />
                    <asp:Label Text="3" runat="server" />
                </p>
            </span>
        </div> 
    </div>
    <div id="sd">
            <style>
                .test {
                    height: 60px;
                }

                    .test p {
                        float: right;
                    }

                  
                .dashitems li {
                    width: 150px;
                    height: 60px;
                    border: 1px solid lightblue; 
                    border-radius: 20px; 
                    background:#4800ff;
                    margin-bottom:10px;
                }

                    .dashitems li i {
                        margin-top: 10px;
                        
                    }

                .dashitems i {
                    color: #000;
                    font-size: 20px;
                }

                .dashitems li, i {
                    list-style-type: none;
                    display: inline-block;
                    margin-right: 10px;
                    text-align: center;
                    font-size: 20px;
                    color: #000;
                }

                .dashitems li, i, span {
                    font-size: 14px;
                    font-family: 'Frutiger LT 45';
                    text-align: center; 
                }
                 li span{
                      font-family:'Segoe UI';
                      font-size:16px;
                      font:; 

                 }

                    .dashitems li:hover {
                        background-color: #f2bd0f;
                        -webkit-animation-duration: 10s;
                        -webkit-animation-delay: 10s;
                        transition-duration: 1s;
                        -webkit-border-image: url('images/images.png') 30 30 round;
                    }

                .dashitems a:hover {
                    -webkit-animation-duration: 10s;
                    -webkit-animation-delay: 10s;
                    -webkit-border-image: url('images/images.png') 30 30 round;
                }
            </style>
            <ul class="dashitems">
                <a href="Patients.aspx">
                    <li>
                        <i class="fa fa-user" style="color:lightblue" ></i>
                        <br />
                        <span>Patients</span>
                    </li>
                </a> 
                <a href="Prescriptions.aspx">
                    <li>
                        <i class="fa fa-pencil" style="color:lightgoldenrodyellow"></i>
                        <br />
                        <span>Prescription</span>
                    </li>
                </a>
                 <a href="consultation.aspx">
                    <li>
                        <i class="fa fa-arrows-h" style="color:gold"></i>
                        <br />
                        <span>Appointments</span>                     
                    </li>
                </a>
                <a href="#">
                    <li>
                        <i class="fa fa-home" style="color:red"></i>
                        <br />
                        <span>Admits</span>
                    </li>
                </a>
                 <a href="#">
                    <li> 
                        <i class="fa fa-history" style="color:darkblue"></i>
                        <br />
                           <span>Patient History</span>
                    </li>
                </a>
                <a href="#">
                    <li>
                        <i class="fa fa-calendar"></i>
                        <br />
                        <span>View Payments</span>
                    </li>
                </a>
               
            </ul>
        </div>
    <div id="mainTable"> 
        <h5 style="text-align:center;margin-bottom:10px; margin-top:30px;color:red;font-family:'Segoe UI'">Patients On Your Waiting List</h5>
            <table class="dataTable" id="table">
                
                <thead>
                   <tr>
                        <th>ID No</th> 
                        <th>FullName</th>
                        <th>Sex</th>
                        <th>Admit Date</th>
                        <th>D.O.B</th> 
                        <th>Phone</th>
                        <th>Country</th>
                        <th>Complain</th> 
                        <th>L/Results</th>
                        <th>Option</th>
                        </tr>
                </thead>
                <tbody id="tlist" runat="server">
                </tbody>
            </table>
        </div> 
</asp:Content>
