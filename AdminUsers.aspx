<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminUsers.aspx.cs" Inherits="Assignment1_Assignment2.AdminUsers" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">

    <title>Admin Users</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />

    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet" />

</head>

<body style="background: #f4f7fb;">

    <form id="form1" runat="server">

        <div class="container-fluid">

            <div class="row">

                <!-- Sidebar -->

                <div class="col-md-2 bg-dark text-white vh-100 p-3">

                    <h3 class="text-center">Admin</h3>

                    <hr />

                    <a href="AdminDashboard.aspx" class="text-white d-block mb-3 text-decoration-none">🏠 Dashboard
                    </a>

                    <a href="AdminUsers.aspx" class="text-warning d-block mb-3 text-decoration-none">👥 Users
                    </a>

                    <a href="#" class="text-white d-block mb-3 text-decoration-none">📊 Reports
                    </a>

                    <a href="AdminLogin.aspx" class="text-white d-block text-decoration-none">🚪 Logout
                    </a>

                </div>


                <!-- Main -->



                <div class="col-md-10 p-4">

                    <h2 class="mb-4">User Management
                    </h2>

                    <div class="row mb-3">

                        <div class="col-md-4">

                            <input
                                type="text"
                                id="txtSearch"
                                class="form-control"
                                placeholder="Search Name / Email / Mobile" />

                        </div>
                        <div class="col-md-2">

                            <button
                                type="button"
                                id="btnSearch"
                                class="btn btn-primary">

                                <i class="bi bi-search"></i>Search

   
                            </button>

                        </div>

                        <div class="text-end mb-3">
                            <asp:Button ID="btnExport"
                                runat="server"
                                Text="Export to Excel"
                                CssClass="btn btn-success"
                                OnClick="btnExport_Click1" />
                        </div>
                        <div class="table-responsive">

                            <table
                                class="table table-bordered table-hover text-center align-top"
                                id="tblUsers">

                                <thead class="table-dark">

                                    <tr>

                                        <th>ID</th>

                                        <th>Name</th>

                                        <th>Email</th>

                                        <th>Mobile</th>

                                        <th>Gender</th>

                                        <th>Religion</th>
                                        <th>Hobbies</th>
                                        <th>Qualification</th>
                                        <th>Edit</th>
                                        <th>Status</th>
                                        <th>Delete</th>

                                    </tr>

                                </thead>

                                <tbody id="tblBody" runat="server">
                                </tbody>

                            </table>

                        </div>

                        <div class="mt-3 text-center">

                            <button
                                type="button"
                                id="btnPrevious"
                                class="btn btn-secondary">
                                Previous

                            </button>

                            <button
                                type="button"
                                id="lblPage"
                                class="btn btn-primary">
                                1

                            </button>

                            <button
                                type="button"
                                id="btnNext"
                                class="btn btn-secondary">
                                Next

                            </button>

                        </div>

                    </div>
                </div>

            </div>
    </form>

</body>

</html>
<script src="Scripts/jquery-3.7.1.min.js"></script>
<script src="Scripts/bootstrap.bundle.min.js"></script>
<script>

    let currentPage = 1;
    let pageSize = 10;
    let totalPages = 1;

    //=================== Enable / Disable Buttons ===================

    function UpdateButtons() {

        $("#btnPrevious").prop("disabled", currentPage <= 1);

        $("#btnNext").prop("disabled", currentPage >= totalPages);

    }

    //=================== Get Users ===================

    function GetAdminUsers() {

        $.ajax({

            type: "POST",
            url: "AdminUsers.aspx/GetAdminUsers",
            data: JSON.stringify({
                pageNumber: currentPage,
                pageSize: pageSize
            }),
            contentType: "application/json; charset=utf-8",
            dataType: "json",

            success: function (response) {

                $("#tblBody").html(response.d);
                $("#lblPage").text(currentPage);
                UpdateButtons();

            },

            error: function () {

                alert("Error loading users.");

            }

        });

    }

    $(document).ready(function () {

        // Total Records

        $.ajax({

            type: "POST",
            url: "AdminUsers.aspx/GetTotalUsersCount",
            data: "{}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",

            success: function (response) {

                totalPages = Math.ceil(response.d / pageSize);

                GetAdminUsers();

            }

        });

        //=================== Search ===================

        $("#btnSearch").click(function () {

            var search = $("#txtSearch").val();

            if (search == "") {

                currentPage = 1;
                GetAdminUsers();
                return;

            }

            $.ajax({

                type: "POST",
                url: "AdminUsers.aspx/SearchUsers",
                data: JSON.stringify({ search: search }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",

                success: function (response) {

                    $("#tblBody").html(response.d);

                },

                error: function () {

                    alert("Search Failed");

                }

            });

        });

        $("#txtSearch").keyup(function () {

            $("#btnSearch").click();

        });

        //=================== Delete ===================
        $(document).on("click", ".btnDelete", function () {

            if (!confirm("Are you sure want to delete this user?"))
                return;

            var id = $(this).data("id");

            $.ajax({

                type: "POST",
                url: "AdminUsers.aspx/DeleteUser",
                data: JSON.stringify({ RegistrationId: id }),
                contentType: "application/json;charset=utf-8",
                dataType: "json",

                success: function (response) {

                    if (response.d == "AccessDenied") {

                        alert("You don't have permission to delete users.");
                        return;
                    }

                    if (response.d == "Success") {

                        alert("User Deleted Successfully");

                        $.ajax({

                            type: "POST",
                            url: "AdminUsers.aspx/GetTotalUsersCount",
                            data: "{}",
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",

                            success: function (response) {

                                totalPages = Math.ceil(response.d / pageSize);

                                if (currentPage > totalPages)
                                    currentPage = totalPages;

                                if (currentPage < 1)
                                    currentPage = 1;

                                GetAdminUsers();

                            }

                        });
                    }
                },

                error: function () {

                    alert("Delete Failed");

                }

            });

        });
        $(document).on("click", ".btnStatus", function () {

            var id = $(this).data("id");

            $.ajax({

                type: "POST",
                url: "AdminUsers.aspx/ChangeUserStatus",
                data: JSON.stringify({ RegistrationId: id }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",

                success: function () {

                    GetAdminUsers();

                },

                error: function () {

                    alert("Status Change Failed");

                }

            });

        });

        //=================== Next ===================

        $("#btnNext").click(function () {

            if (currentPage < totalPages) {

                currentPage++;
                GetAdminUsers();

            }

        });

        //=================== Previous ===================

        $("#btnPrevious").click(function () {

            if (currentPage > 1) {

                currentPage--;
                GetAdminUsers();

            }

        });

    });

</script>
