<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Jobs.aspx.cs" Inherits="Assignment1_Assignment2.Jobs" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <title>Jobs - Employee Portal</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />

    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet" />

    <style>
        body {
            background: #f5f8fc;
        }

        .navbar-brand {
            font-weight: bold;
            font-size: 24px;
        }

        .job-header {
            background: linear-gradient(135deg, #0d6efd, #6610f2);
            color: white;
            padding: 55px 0;
        }

        .search-box {
            background: white;
            padding: 15px;
            border-radius: 12px;
            box-shadow: 0 8px 25px rgba(0,0,0,0.15);
        }

            .search-box .form-control,
            .search-box .form-select {
                height: 50px;
            }

        .job-card {
            border: none;
            border-radius: 15px;
            transition: 0.3s;
        }

            .job-card:hover {
                transform: translateY(-5px);
                box-shadow: 0 10px 25px rgba(0,0,0,0.12);
            }

        .company-icon {
            width: 55px;
            height: 55px;
            border-radius: 10px;
            background: #e9f2ff;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 25px;
            color: #0d6efd;
        }

        .job-title {
            font-weight: 700;
        }

        .job-info {
            color: #6c757d;
            font-size: 14px;
        }

        .badge-job {
            font-size: 12px;
            padding: 7px 10px;
        }

        footer {
            background: #212529;
            color: white;
        }
        .search-btn {
    height: 50px !important;
    border: none !important;
    border-radius: 8px !important;
    background-color: #ffc107 !important;
    color: #000 !important;
    font-weight: 600;
    cursor: pointer;
}

.search-btn:hover {
    background-color: #e0a800 !important;
    color: #000 !important;
}
    </style>

</head>

<body>

    <form id="form1" runat="server">

        <!-- ================= NAVBAR ================= -->

        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">

            <div class="container">

                <a class="navbar-brand" href="Emp.aspx">
                    <i class="bi bi-people-fill"></i>
                    Employee Portal
            </a>

                <button class="navbar-toggler"
                    type="button"
                    data-bs-toggle="collapse"
                    data-bs-target="#navbarNav">

                    <span class="navbar-toggler-icon"></span>

                </button>

                <div class="collapse navbar-collapse" id="navbarNav">

                    <ul class="navbar-nav ms-auto">

                        <li class="nav-item">
                            <a class="nav-link" href="Emp.aspx">Home
                        </a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link active" href="Jobs.aspx">Jobs
                        </a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link" href="Emp.aspx#about">About
                        </a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link" href="Emp.aspx#contact">Contact
                        </a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link" href="Login.aspx">Login
                        </a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link" href="Registration.aspx">Register
                        </a>
                        </li>

                    </ul>

                </div>

            </div>

        </nav>


        <!-- ================= JOB HEADER ================= -->

        <section class="job-header">

            <div class="container">

                <div class="text-center mb-4">

                    <h1 class="fw-bold">Find Your Dream Job
                </h1>

                    <p class="lead">
                        Search for the right opportunity and take the next step in your career.
               
                    </p>

                </div>


                <!-- ================= SEARCH ================= -->

                <div class="search-box">

                    <div class="row g-2">

                        <div class="col-md-4">

                            <div class="input-group">

                                <span class="input-group-text bg-white">
                                    <i class="bi bi-search text-primary"></i>
                                </span>

                                <asp:TextBox
                                    ID="txtJobSearch" runat="server"
                                    class="form-control"
                                    placeholder="Job title, skills or keywords"></asp:TextBox>


                            </div>

                        </div>


                        <div class="col-md-3">

                            <div class="input-group">

                                <span class="input-group-text bg-white">
                                    <i class="bi bi-geo-alt-fill text-danger"></i>
                                </span>

                                <asp:TextBox ID="txtLocation" runat="server" CssClass="form-control" placeholder="Location"></asp:TextBox>

                            </div>

                        </div>

                        
                        <div class="col-md-3">

                            <asp:DropDownList ID="ddlCategory" runat="server" CssClass="form-select">
                                <asp:ListItem Value="">All Categories</asp:ListItem>
                                <asp:ListItem Value="IT $ Software">IT and Software</asp:ListItem>
                                <asp:ListItem Value="Finance">Finance</asp:ListItem>
                                <asp:ListItem Value="HR">HR</asp:ListItem>

                                <asp:ListItem Value="Marketting">Marketting</asp:ListItem>

                                <asp:ListItem Value="Sales">Sales</asp:ListItem>
                                <asp:ListItem Value="Education">Education</asp:ListItem>
                                <asp:ListItem Value="Engnerring">Engnerring</asp:ListItem>



                            </asp:DropDownList>
                        </div>


                        <div class="col-md-2">

                            <asp:Button ID="btnJobSearch" runat="server" Text="Search" CssClass="btn btn-warning w-100 search-btn" OnClick="btnJobSearch_Click" />

                        </div>

                    </div>

                </div>

            </div>

        </section>


        <!-- ================= JOB LIST ================= -->

        <section class="py-5">

            <div class="container">

                <div class="d-flex justify-content-between align-items-center mb-4">

                    <div>

                        <h2 class="fw-bold mb-1">Latest Jobs
                    </h2>

                        <p class="text-muted mb-0">
                            Explore the latest career opportunities
                   
                        </p>

                    </div>

                    <span class="badge bg-primary px-3 py-2">6 Jobs Available
                </span>

                </div>


                <div class="row g-4">


                    <div class="row g-4">

                        <asp:Repeater ID="rptJobs" runat="server">

                            <ItemTemplate>

                                <div class="col-lg-6">

                                    <div class="card job-card shadow-sm h-100">

                                        <div class="card-body p-4">

                                            <div class="d-flex">

                                                <div class="company-icon me-3">
                                                    <i class="bi bi-briefcase-fill"></i>
                                                </div>

                                                <div>

                                                    <h4 class="job-title mb-1">
                                                        <%# Eval("JobTitle") %>
                                </h4>

                                                    <p class="text-primary fw-semibold mb-1">
                                                        <%# Eval("CompanyName") %>
                                                    </p>

                                                </div>

                                            </div>

                                            <hr />

                                            <div class="job-info mb-3">

                                                <span class="me-3">
                                                    <i class="bi bi-geo-alt"></i>
                                                    <%# Eval("Location") %>
                            </span>

                                                <span class="me-3">
                                                    <i class="bi bi-briefcase"></i>
                                                    <%# Eval("Experience") %>
                            </span>

                                                <span>
                                                    <i class="bi bi-currency-rupee"></i>
                                                    <%# Eval("Salary") %>
                            </span>

                                            </div>

                                            <div class="mb-3">

                                                <span class="badge bg-primary badge-job">
                                                    <%# Eval("Category") %>
                            </span>

                                                <span class="badge bg-success badge-job">
                                                    <%# Eval("JobType") %>
                            </span>

                                            </div>

                                            <div class="d-flex justify-content-between align-items-center">

                                                <small class="text-muted">Posted <%# Convert.ToDateTime(Eval("CreatedDate")).ToString("dd MMM yyyy") %>
                            </small>

                                                <a href='JobDetails.aspx?JobId=<%# Eval("JobId") %>'
                                                    class="btn btn-primary">View Details
                            </a>

                                            </div>

                                        </div>

                                    </div>

                                </div>

                            </ItemTemplate>

                        </asp:Repeater>

                    </div>

                </div>
        </section>


        <!-- ================= FOOTER ================= -->

        <footer class="py-4">

            <div class="container text-center">

                <h5>
                    <i class="bi bi-people-fill"></i>
                    Employee Portal
            </h5>

                <p class="mb-1">
                    Find jobs • Build your profile • Grow your career
           
                </p>

                <small>© 2026 Employee Portal. All Rights Reserved.
            </small>

            </div>

        </footer>

    </form>


    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>

</html>
