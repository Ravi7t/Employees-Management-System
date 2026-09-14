<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="Assignment1_Assignment2.HomePage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>User Details</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />

    <style>
        body {
            background: #f4f7fc;
        }

        .card {
            border-radius: 15px;
        }

        .card-header {
            border-radius: 15px 15px 0 0 !important;
        }

        .profile-img {
            width: 160px;
            height: 160px;
            border-radius: 50%;
            object-fit: cover;
            border: 5px solid #0d6efd;
        }

        label {
            font-weight: 600;
            margin-bottom: 5px;
        }

        .form-control {
            background: #f8f9fa;
        }

        .resume-link {
            text-decoration: none;
            font-weight: bold;
        }

        .resume-link:hover {
            text-decoration: underline;
        }
    </style>

</head>

<body>

    <form id="form1" runat="server">

        <div class="container py-5">

            <div class="row justify-content-center">

                <div class="col-lg-9">

                    <div class="card shadow-lg">

                        <div class="card-header bg-primary text-white text-center">
                            <h2>User Details</h2>
                            <a href="Logout.aspx"  class="btn btn-danger btn-sm">Logout</a>
                        </div>

                        <div class="card-body">

                            <!-- Image -->

                            <div class="text-center mb-4">
                                <img id="imgPhoto" runat="server" class="profile-img" />
                            </div>

                            <!-- User Details -->

                            <div class="row">

                                <div class="col-md-6 mb-3">
                                    <label>Name</label>
                                    <input type="text" id="txtName" runat="server" readonly="readonly" class="form-control" />
                                </div>

                                <div class="col-md-6 mb-3">
                                    <label>Email</label>
                                    <input type="text" id="txtEmail" runat="server" readonly="readonly" class="form-control" />
                                </div>

                                <div class="col-md-6 mb-3">
                                    <label>Mobile</label>
                                    <input type="text" id="txtMobile" runat="server" readonly="readonly" class="form-control" />
                                </div>

                                <div class="col-md-6 mb-3">
                                    <label>Gender</label>
                                    <input type="text" id="txtGender" runat="server" readonly="readonly" class="form-control" />
                                </div>

                                <div class="col-md-6 mb-3">
                                    <label>Hobbies</label>
                                    <input type="text" id="txtHobbies" runat="server" readonly="readonly" class="form-control" />
                                </div>

                                <div class="col-md-6 mb-3">
                                    <label>Religion</label>
                                    <input type="text" id="txtReligion" runat="server" readonly="readonly" class="form-control" />
                                </div>

                                <div class="col-md-6 mb-3">
                                    <label>Date Of Birth</label>
                                    <input type="text" id="txtDOB" runat="server" readonly="readonly" class="form-control" />
                                </div>

                                <div class="col-md-6 mb-3">
                                    <label>Age</label>
                                    <input type="text" id="txtAge" runat="server" readonly="readonly" class="form-control" />
                                </div>

                                <div class="col-12 mb-3">
                                    <label>Address</label>
                                    <textarea id="txtAddress" runat="server" readonly="readonly" class="form-control" rows="3"></textarea>
                                </div>

                            </div>

                            <!-- Resume -->

                            <div class="text-center mb-4">
                                <a id="lnkResume" runat="server" href="#" target="_blank" class="btn btn-success">
                                    Download Resume
                                </a>
                                <a href="EditProfile.aspx" class="btn btn-warning">EditProfile</a>
                            </div>

                            <!-- Qualification Table -->

                            <h4 class="text-center mb-3">Educational Qualification</h4>

                            <div class="table-responsive">

                                <table class="table table-bordered table-striped table-hover text-center">

                                    <thead class="table-primary">

                                        <tr>
                                            <th>Qualification</th>
                                            <th>Board</th>
                                            <th>Year</th>
                                            <th>Percentage</th>
                                        </tr>

                                    </thead>
                                    <tbody id="tbodyQualification" runat="server"></tbody>

                                    
                                   

                                </table>

                            </div>

                        </div>

                    </div>

                </div>

            </div>

        </div>

    </form>

</body>
</html>