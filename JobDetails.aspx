<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="JobDetails.aspx.cs" Inherits="Assignment1_Assignment2.JobDetails" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <title>Job Details - Employee Portal</title>

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
            padding: 50px 0;
        }

        .job-card {
            border: none;
            border-radius: 15px;
        }

        .company-icon {
            width: 75px;
            height: 75px;
            border-radius: 15px;
            background: #e9f2ff;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 35px;
            color: #0d6efd;
        }

        .detail-box {
            background: #f8f9fa;
            border-radius: 10px;
            padding: 18px;
            height: 100%;
        }

        .detail-box i {
            font-size: 25px;
        }

        .section-title {
            font-weight: 700;
        }

        .apply-card {
            border: none;
            border-radius: 15px;
            position: sticky;
            top: 20px;
        }

        footer {
            background: #212529;
            color: white;
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
                        <a class="nav-link" href="Emp.aspx">
                            Home
                        </a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link active" href="Jobs.aspx">
                            Jobs
                        </a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link" href="Emp.aspx#about">
                            About
                        </a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link" href="Emp.aspx#contact">
                            Contact
                        </a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link" href="Login.aspx">
                            Login
                        </a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link" href="Registration.aspx">
                            Register
                        </a>
                    </li>

                </ul>

            </div>

        </div>

    </nav>


    <!-- ================= JOB HEADER ================= -->

    <section class="job-header">

        <div class="container">

            <div class="row align-items-center">

                <div class="col-md-8">

                    <span class="badge bg-light text-primary mb-3">
                        Full Time
                    </span>

                    <h1 class="fw-bold"><asp:Label ID="lblJobTitle" runat="server"></asp:Label>
                        
                    </h1>

                    <p class="lead mb-2">
                        <i class="bi bi-building"></i>
                        <asp:Label ID="lblCompanyName" runat="server"></asp:Label>
                       
                    </p>

                    <p class="mb-0">
                        <i class="bi bi-geo-alt-fill"></i>
                        <asp:Label ID="lblLocation" runat="server"></asp:Label>
                       
                    </p>

                </div>

                <div class="col-md-4 text-md-end mt-4 mt-md-0">

                    <div class="company-icon bg-white mx-md-auto">

                        <i class="bi bi-code-slash"></i>

                    </div>

                </div>

            </div>

        </div>

    </section>


    <!-- ================= JOB DETAILS ================= -->

    <section class="py-5">

        <div class="container">

            <div class="row g-4">

                <!-- ================= LEFT CONTENT ================= -->

                <div class="col-lg-8">

                    <div class="card job-card shadow-sm">

                        <div class="card-body p-4">


                            <!-- JOB INFORMATION -->

                            <div class="row g-3 mb-4">

                                <div class="col-md-4">

                                    <div class="detail-box">

                                        <i class="bi bi-briefcase-fill text-primary"></i>

                                        <p class="text-muted mb-1 mt-2">
                                            Experience
                                        </p>

                                        <h6 class="fw-bold">
                                          <asp:Label ID="lblExperience" runat="server"></asp:Label>
                                        </h6>

                                    </div>

                                </div>


                                <div class="col-md-4">

                                    <div class="detail-box">

                                        <i class="bi bi-currency-rupee text-success"></i>

                                        <p class="text-muted mb-1 mt-2">
                                            Salary
                                        </p>

                                        <h6 class="fw-bold">
                                           <asp:Label ID="lblSalary" runat="server"></asp:Label>
                                        </h6>

                                    </div>

                                </div>


                                <div class="col-md-4">

                                    <div class="detail-box">

                                        <i class="bi bi-clock-fill text-warning"></i>

                                        <p class="text-muted mb-1 mt-2">
                                            Job Type
                                        </p>

                                        <h6 class="fw-bold">
                                           <asp:Label ID="lblJobType" runat="server"></asp:Label>
                                        </h6>

                                    </div>

                                </div>

                            </div>


                            <hr />


                            <!-- DESCRIPTION -->

                            <h4 class="section-title mb-3">
                                Job Description
                            </h4>

                            <p class="text-muted">

                               <asp:Label ID="lblDescription" runat="server"></asp:Label>
                            </p>


                            <!-- RESPONSIBILITIES -->

                            <h4 class="section-title mt-4 mb-3">
                                Key Responsibilities
                            </h4>

                            <ul class="text-muted">

                                <li class="mb-2">
                                    Develop web applications using ASP.NET and C#.
                                </li>

                                <li class="mb-2">
                                    Work with SQL Server databases.
                                </li>

                                <li class="mb-2">
                                    Develop and maintain REST APIs.
                                </li>

                                <li class="mb-2">
                                    Debug and fix application issues.
                                </li>

                                <li class="mb-2">
                                    Work with the development team on new features.
                                </li>

                            </ul>


                            <!-- REQUIREMENTS -->

                            <h4 class="section-title mt-4 mb-3">
                                Requirements
                            </h4>

                            <ul class="text-muted">

                                <li class="mb-2">
                                    <asp:Label ID="lblRequirements" runat="server"></asp:Label>
                                </li>
                                </ul>


                            <!-- SKILLS -->

                            <h4 class="section-title mt-4 mb-3">
                                Required Skills
                            </h4>

                            <span class="badge bg-primary p-2 me-2">
                                C#
                            </span>

                            <span class="badge bg-success p-2 me-2">
                                ASP.NET
                            </span>

                            <span class="badge bg-secondary p-2 me-2">
                                SQL Server
                            </span>

                            <span class="badge bg-info text-dark p-2 me-2">
                                MVC
                            </span>

                            <span class="badge bg-warning text-dark p-2">
                                JavaScript
                            </span>


                        </div>

                    </div>

                </div>


                <!-- ================= RIGHT APPLY CARD ================= -->

                <div class="col-lg-4">

                    <div class="card apply-card shadow-sm">

                        <div class="card-body p-4 text-center">

                            <i class="bi bi-send-fill text-primary"
                                style="font-size:55px;"></i>

                            <h4 class="fw-bold mt-3">
                                Interested in this job?
                            </h4>

                            <p class="text-muted">
                                Login to your account and apply for this position.
                            </p>


                            <a href="Login.aspx"
                                class="btn btn-primary btn-lg w-100 mb-3">

                                <i class="bi bi-send"></i>
                                Apply Now

                            </a>


                            <a href="Registration.aspx"
                                class="btn btn-outline-primary w-100">

                                <i class="bi bi-person-plus"></i>
                                Create Account

                            </a>


                            <hr />


                            <div class="text-muted small">

                                <p class="mb-2">
                                    <i class="bi bi-calendar3"></i>
                                    Posted 2 days ago
                                </p>

                                <p class="mb-0">
                                    <i class="bi bi-people"></i>
                                    Multiple positions available
                                </p>

                            </div>

                        </div>

                    </div>

                </div>

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

            <small>
                © 2026 Employee Portal. All Rights Reserved.
            </small>

        </div>

    </footer>


</form>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>

</html>