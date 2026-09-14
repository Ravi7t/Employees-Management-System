<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminDashboard.aspx.cs" Inherits="Assignment1_Assignment2.AdminDashboard" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <title>Admin Dashboard</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />

</head>

<body>

    <form id="form1" runat="server">

        <div class="container-fluid">

            <div class="row">

                <div class="col-md-2 bg-dark text-white vh-100 p-3">

                    <h3>Admin</h3>
                    <hr />

                    <a href="AdminDashboard.aspx" class="btn btn-dark w-100 text-start mb-2">🏠 Dashboard</a>

                    <a href="AdminUsers.aspx" class="btn btn-dark w-100 text-start mb-2">👥 Users</a>

                    <a href="AdminReport.aspx" class="btn btn-dark w-100 text-start mb-2">📊 Reports</a>

                    <a href="AdminResume.aspx" class="btn btn-dark w-100 text-start mb-2">📄 Resume</a>


                    <a href="AdminExport.aspx" class="btn btn-dark w-100 text-start mb-2">📄 Export</a>
                    <asp:LinkButton ID="btnLogout" runat="server" CssClass="btn btn-danger w-100 text-start" OnClick="btnLogout_Click">🚪 Logout</asp:LinkButton>
                </div>

                <div class="col-md-10">

                    <h2 class="mt-3">Dashboard</h2>

                    <div class="row mt-4">

                        <div class="col-md-3">

                            <div class="card bg-primary text-white">

                                <div class="card-body">

                                    <h5>Total Users</h5>

                                    <h2 id="lblUsers" runat="server">0</h2>

                                </div>

                            </div>

                        </div>

                        <div class="col-md-3">

                            <div class="card bg-success text-white">

                                <div class="card-body">

                                    <h5>Male</h5>

                                    <h2 id="lblMale" runat="server">0</h2>

                                </div>

                            </div>

                        </div>

                        <div class="col-md-3">

                            <div class="card bg-danger text-white">

                                <div class="card-body">

                                    <h5>Female</h5>

                                    <h2 id="lblFemale" runat="server">0</h2>

                                </div>

                            </div>

                        </div>

                        <div class="col-md-3">

                            <div class="card bg-warning text-dark">

                                <div class="card-body">

                                    <h5>Qualification</h5>

                                    <h2 id="lblQualification" runat="server">0</h2>

                                </div>
                            </div>



                        </div>
                    </div>
                    <div class="row mt-4">

                        <!-- Gender Chart -->
                        <div class="col-md-6">
                            <div class="card shadow-lg border-0">
                                <div class="card-header bg-dark text-white">
                                    Users By Gender
           
                                </div>

                                <div class="card-body" style="height: 350px;">
                                    <canvas id="genderChart"></canvas>
                                </div>
                            </div>
                        </div>

                        <!-- Qualification Chart -->
                        <div class="col-md-6">
                            <div class="card shadow-lg border-0">
                                <div class="card-header bg-primary text-white">
                                    Qualification Wise Chart
           
                                </div>

                                <div class="card-body" style="height: 350px;">
                                    <canvas id="qualificationChart"></canvas>
                                </div>
                            </div>
                        </div>

                    </div>
    </form>

    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script>
        $(document).ready(function () {

            // ==========================
            // Gender Chart
            // ==========================
            $.ajax({
                type: "POST",
                url: "AdminDashboard.aspx/GetGenderChart",
                data: '{}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",

                success: function (response) {

                    var data = response.d.split(',');

                    var male = parseInt(data[0]);
                    var female = parseInt(data[1]);

                    var ctx = document.getElementById("genderChart").getContext("2d");

                    new Chart(ctx, {
                        type: "pie",
                        data: {
                            labels: ["Male", "Female"],
                            datasets: [{
                                data: [male, female],
                                backgroundColor: [
                                    "#198754",
                                    "#dc3545"
                                ]
                            }]
                        },
                        options: {
                            responsive: true,
                            maintainAspectRatio: false,
                            plugins: {
                                legend: {
                                    position: "bottom"
                                }
                            }
                        }
                    });

                }
            });


            // ==========================
            // Qualification Chart
            // ==========================
            $.ajax({
                type: "POST",
                url: "AdminDashboard.aspx/GetQualificationChart",
                data: '{}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",

                success: function (response) {
                    var items = response.d.split(',');

                    var labels = [];
                    var values = [];

                    for (var i = 0; i < items.length; i++) {

                        if (items[i] != "") {

                            var arr = items[i].split(':');

                            labels.push(arr[0]);
                            values.push(parseInt(arr[1]));
                        }
                    }

                    var ctx2 = document.getElementById("qualificationChart").getContext("2d");
                    console.log(document.getElementById("qualificationChart"));
                    console.log(ctx2);
                    console.log(labels);
                    console.log(values);
                    new Chart(ctx2, {
                        type: 'bar',
                        data: {
                            labels: labels,
                            datasets: [{
                                label: 'Qualification',
                                data: values,
                                backgroundColor: [
                                    '#0d6efd',
                                    '#198754',
                                    '#ffc107',
                                    '#dc3545',
                                    '#6f42c1',
                                    '#20c997'
                                ]
                            }]
                        },
                        options: {
                            responsive: true,
                            maintainAspectRatio: false
                        }
                    });
                }
            });

        });
</script>
</body>

</html>
