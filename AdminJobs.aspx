<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminJobs.aspx.cs" Inherits="Assignment1_Assignment2.AdminJobs" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <title>Manage Jobs - Admin</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />

    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet" />

    <style>

        body {
            background: #f5f8fc;
        }

        .sidebar {
            min-height: 100vh;
        }

        .sidebar a {
            display: block;
            text-decoration: none;
            color: white;
            padding: 11px 15px;
            border-radius: 8px;
            margin-bottom: 5px;
        }

        .sidebar a:hover,
        .sidebar a.active {
            background: rgba(255,255,255,0.15);
        }

        .page-title {
            font-weight: 700;
        }

        .job-form {
            border: none;
            border-radius: 15px;
        }

        .job-table {
            border-radius: 15px;
            overflow: hidden;
        }

        .status-active {
            color: #198754;
            font-weight: 600;
        }

        .status-inactive {
            color: #dc3545;
            font-weight: 600;
        }

    </style>

</head>

<body>

<form id="form1" runat="server">

    <div class="container-fluid">

        <div class="row">

            <!-- ================= SIDEBAR ================= -->

            <div class="col-md-2 bg-dark text-white sidebar p-3">

                <h3 class="mb-3">
                    <i class="bi bi-shield-lock-fill"></i>
                    Admin
                </h3>

                <hr />

                <a href="AdminDashboard.aspx">
                    <i class="bi bi-speedometer2 me-2"></i>
                    Dashboard
                </a>

                <a href="AdminUsers.aspx">
                    <i class="bi bi-people-fill me-2"></i>
                    Users
                </a>

                <a href="AdminReport.aspx">
                    <i class="bi bi-bar-chart-fill me-2"></i>
                    Reports
                </a>

                <a href="AdminResume.aspx">
                    <i class="bi bi-file-earmark-person me-2"></i>
                    Resume
                </a>

                <a href="AdminExport.aspx">
                    <i class="bi bi-file-earmark-excel me-2"></i>
                    Export
                </a>

                <a href="AdminJobs.aspx" class="active">
                    <i class="bi bi-briefcase-fill me-2"></i>
                    Manage Jobs
                </a>

                <hr />

                <a href="Emp.aspx">
                    <i class="bi bi-house-fill me-2"></i>
                    Home
                </a>

                <a href="AdminLogin.aspx">
                    <i class="bi bi-box-arrow-right me-2"></i>
                    Logout
                </a>

            </div>


            <!-- ================= MAIN CONTENT ================= -->

            <div class="col-md-10 p-4">

                <!-- PAGE HEADER -->

                <div class="d-flex justify-content-between align-items-center mb-4">

                    <div>

                        <h2 class="page-title">
                            <i class="bi bi-briefcase-fill text-primary"></i>
                            Manage Jobs
                        </h2>

                        <p class="text-muted mb-0">
                            Add and manage job opportunities.
                        </p>

                    </div>

                    <span class="badge bg-primary px-3 py-2">
                        Job Management
                    </span>

                </div>


                <!-- ================= ADD JOB FORM ================= -->

                <div class="card job-form shadow-sm mb-4">

                    <div class="card-header bg-primary text-white">

                        <h5 class="mb-0">
                            <i class="bi bi-plus-circle"></i>
                            Add New Job
                        </h5>

                    </div>


                    <div class="card-body p-4">

                        <div class="row g-3">

                            <!-- Job Title -->

                            <div class="col-md-6">

                                <label class="form-label fw-semibold">
                                    Job Title
                                </label>

                                <input type="text"
                                    id="txtJobTitle" runat="server"
                                    
                                    class="form-control"
                                    placeholder="Enter job title" />

                            </div>


                            <!-- Company -->

                            <div class="col-md-6">

                                <label class="form-label fw-semibold">
                                    Company
                                </label>

                                <input type="text"
                                    id="txtCompany" runat="server"
                                    class="form-control"
                                    placeholder="Enter company name" />

                            </div>


                            <!-- Location -->

                            <div class="col-md-4">

                                <label class="form-label fw-semibold">
                                    Location
                                </label>

                                <input type="text"
                                    id="txtLocation" runat="server"
                                    class="form-control"
                                    placeholder="e.g. Delhi" />

                            </div>


                            <!-- Category -->

                            <div class="col-md-4">

                                <label class="form-label fw-semibold">
                                    Category
                                </label>

                                <select id="ddlCategory" runat="server"
                                    class="form-select">

                                    <option value="">
                                        Select Category
                                    </option>

                                    <option>IT & Software</option>
                                    <option>Finance</option>
                                    <option>HR</option>
                                    <option>Marketing</option>
                                    <option>Sales</option>
                                    <option>Education</option>
                                    <option>Engineering</option>

                                </select>

                            </div>


                            <!-- Job Type -->

                            <div class="col-md-4">

                                <label class="form-label fw-semibold">
                                    Job Type
                                </label>

                                <select id="ddlJobType" runat="server"
                                    class="form-select">

                                    <option value="">
                                        Select Job Type
                                    </option>

                                    <option>Full Time</option>
                                    <option>Part Time</option>
                                    <option>Work From Home</option>
                                    <option>Internship</option>

                                </select>

                            </div>


                            <!-- Experience -->

                            <div class="col-md-4">

                                <label class="form-label fw-semibold">
                                    Experience
                                </label>

                                <input type="text"
                                    id="txtExperience" runat="server"
                                    class="form-control"
                                    placeholder="e.g. 1-3 Years" />

                            </div>


                            <!-- Salary -->

                            <div class="col-md-4">

                                <label class="form-label fw-semibold">
                                    Salary
                                </label>

                                <input type="text"
                                    id="txtSalary" runat="server"
                                    class="form-control"
                                    placeholder="e.g. ₹4-7 LPA" />

                            </div>


                            <!-- Skills -->

                            <div class="col-md-4">

                                <label class="form-label fw-semibold">
                                    Skills
                                </label>

                                <input type="text"
                                    id="txtSkills" runat="server"
                                   
                                    class="form-control"
                                    placeholder="e.g. C#, ASP.NET, SQL" />

                            </div>


                            <!-- Description -->

                            <div class="col-md-12">

                                <label class="form-label fw-semibold">
                                    Job Description
                                </label>

                                <textarea id="txtDescription" runat="server"
                                    class="form-control"
                                    rows="4"
                                    placeholder="Enter job description"></textarea>

                            </div>


                            <!-- Requirements -->

                            <div class="col-md-12">

                                <label class="form-label fw-semibold">
                                    Requirements
                                </label>

                                <textarea id="txtRequirements" runat="server"
                                    class="form-control"
                                    rows="3"
                                    placeholder="Enter job requirements"></textarea>

                            </div>


                            <!-- Status -->

                            <div class="col-md-4">

                                <label class="form-label fw-semibold">
                                    Status
                                </label>

                                <select id="ddlStatus" runat="server"
                                    class="form-select">

                                    <option value="1">
                                        Active
                                    </option>

                                    <option value="0">
                                        Inactive
                                    </option>

                                </select>

                            </div>


                            <!-- Buttons -->

                            <div class="col-md-12 text-end">

                                <button type="button"
                                    class="btn btn-secondary me-2">

                                    <i class="bi bi-x-circle"></i>
                                    Reset

                                </button>

                               <asp:Button ID="btnSavejobs" runat="server" Text="Save Job" CssClass="btn btn-success" OnClick="btnSavejobs_Click" />

                            </div>

                        </div>

                    </div>

                </div>


                <!-- ================= JOB LIST ================= -->

                <div class="card job-table shadow-sm">

                    <div class="card-header bg-dark text-white">

                        <div class="d-flex justify-content-between align-items-center">

                            <h5 class="mb-0">
                                <i class="bi bi-list-ul"></i>
                                Job Listings
                            </h5>

                            <span class="badge bg-primary">
                                0 Jobs
                            </span>

                        </div>

                    </div>


                    <div class="card-body p-0">

                        <div class="table-responsive">

                            <table class="table table-hover table-bordered mb-0">

                                <thead class="table-light">

                                    <tr>

                                        <th>#</th>
                                        <th>Job Title</th>
                                        <th>Company</th>
                                        <th>Location</th>
                                        <th>Category</th>
                                        <th>Salary</th>
                                        <th>Status</th>
                                        <th>Action</th>

                                    </tr>

                                </thead>


                                <tbody><asp:Literal ID="litJobs" runat="server"></asp:Literal>

                                    <tr>

                                        <td colspan="8"
                                            class="text-center text-muted py-4">

                                            No jobs available.

                                            <br />

                                            Add your first job using the form above.

                                        </td>

                                    </tr>

                                </tbody>

                            </table>

                        </div>

                    </div>

                </div>

            </div>

        </div>

    </div>

</form>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>

</html>