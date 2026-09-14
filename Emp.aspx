<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Emp.aspx.cs" Inherits="Assignment1_Assignment2.Emp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <title>Employee Management Portal</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />

    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet" />

    <style>
        /* ================= GENERAL ================= */

        body {
            background: #f5f8fc;
            color: #212529;
            overflow-x: hidden;
        }

        .navbar {
            padding: 13px 0;
        }

        .navbar-brand {
            font-weight: 700;
            font-size: 23px;
            letter-spacing: .2px;
        }

        .navbar-nav {
            align-items: center;
            gap: 3px;
        }

            .navbar-nav .nav-link {
                font-weight: 500;
                padding: 8px 12px !important;
                border-radius: 7px;
                transition: .25s ease;
            }

                .navbar-nav .nav-link:hover {
                    background: rgba(255,255,255,0.10);
                }


        /* ================= HERO ================= */

        .hero {
            min-height: 590px;
            display: flex;
            align-items: center;
            background: linear-gradient(135deg, #0d6efd 0%, #4f46e5 55%, #6610f2 100%);
            color: white;
            position: relative;
            overflow: hidden;
        }

            .hero::before {
                content: "";
                position: absolute;
                width: 520px;
                height: 520px;
                background: rgba(255,255,255,0.07);
                border-radius: 50%;
                right: -180px;
                top: -190px;
            }

            .hero::after {
                content: "";
                position: absolute;
                width: 380px;
                height: 380px;
                background: rgba(255,255,255,0.06);
                border-radius: 50%;
                left: -170px;
                bottom: -200px;
            }

        .hero-content {
            position: relative;
            z-index: 2;
            padding: 55px 0;
        }

        .hero-brand {
            font-size: 17px;
            font-weight: 600;
            letter-spacing: .5px;
            margin-top: 3px;
        }

        .hero h1 {
            font-size: 48px;
            font-weight: 800;
            line-height: 1.15;
            letter-spacing: -.5px;
        }

        .hero p {
            font-size: 18px;
            opacity: .93;
            line-height: 1.7;
            max-width: 720px;
        }

        .hero-badge {
            font-size: 13px;
            font-weight: 600;
            border-radius: 30px;
        }


        /* ================= JOB SEARCH ================= */

        .job-search-box {
            background: rgba(255,255,255,0.13);
            padding: 12px;
            border-radius: 15px;
            max-width: 850px;
            border: 1px solid rgba(255,255,255,0.18);
            box-shadow: 0 12px 35px rgba(0,0,0,0.12);
            backdrop-filter: blur(8px);
        }

            .job-search-box .form-control {
                height: 50px;
                border: none;
                box-shadow: none;
            }

            .job-search-box .input-group-text {
                border: none;
            }

            .job-search-box .btn {
                min-height: 50px;
                border: none;
            }


        /* ================= HERO BUTTONS ================= */

        .hero-buttons {
            display: flex;
            gap: 12px;
            flex-wrap: wrap;
        }

            .hero-buttons .btn {
                min-width: 175px;
                padding: 12px 20px;
                font-weight: 600;
                border-radius: 9px;
                transition: .25s ease;
            }

                .hero-buttons .btn:hover {
                    transform: translateY(-2px);
                }


        /* ================= HERO RIGHT PANEL ================= */

        .hero-visual {
            position: relative;
            z-index: 2;
            background: rgba(255,255,255,0.12);
            border: 1px solid rgba(255,255,255,0.25);
            border-radius: 28px;
            padding: 38px;
            backdrop-filter: blur(10px);
            box-shadow: 0 20px 50px rgba(0,0,0,0.18);
        }

        .hero-visual-icon {
            width: 165px;
            height: 165px;
            margin: auto;
            border-radius: 50%;
            background: rgba(255,255,255,0.17);
            display: flex;
            align-items: center;
            justify-content: center;
        }

            .hero-visual-icon i {
                font-size: 85px;
            }

        .hero-visual h3 {
            font-size: 27px;
        }

        .hero-feature-box {
            background: rgba(255,255,255,0.96);
            color: #212529;
            border-radius: 12px;
            padding: 15px 10px;
            height: 100%;
            transition: .25s ease;
        }

            .hero-feature-box:hover {
                transform: translateY(-3px);
            }


        /* ================= SECTION COMMON ================= */

        section:not(.hero) {
            scroll-margin-top: 80px;
        }

        .section-heading {
            max-width: 700px;
            margin-left: auto;
            margin-right: auto;
        }


        /* ================= FEATURE CARDS ================= */

        .feature-card {
            border: none;
            border-radius: 16px;
            transition: all .3s ease;
            overflow: hidden;
        }

            .feature-card:hover {
                transform: translateY(-7px);
                box-shadow: 0 14px 30px rgba(0,0,0,0.10) !important;
            }

        .feature-icon {
            font-size: 40px;
        }

        .why-icon {
            width: 72px;
            height: 72px;
            margin: auto;
            border-radius: 16px;
            display: flex;
            align-items: center;
            justify-content: center;
        }


        /* ================= ABOUT ================= */

        .about-icon {
            width: 250px;
            height: 250px;
            margin: auto;
            border-radius: 50%;
            background: #eaf2ff;
            display: flex;
            align-items: center;
            justify-content: center;
        }

            .about-icon i {
                font-size: 130px;
            }


        /* ================= LOGIN ================= */

        .login-card {
            border-radius: 17px;
            border: none;
            transition: all .3s ease;
            overflow: hidden;
        }

            .login-card:hover {
                transform: translateY(-6px);
                box-shadow: 0 15px 35px rgba(0,0,0,0.12) !important;
            }

        .login-icon {
            width: 85px;
            height: 85px;
            margin: auto;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .login-card .btn {
            border-radius: 9px;
            padding: 11px;
            font-weight: 600;
        }


        /* ================= CONTACT ================= */

        .contact-section {
            background: #ffffff;
        }

        .contact-card {
            border: none;
            border-radius: 18px;
            transition: all .3s ease;
            overflow: hidden;
        }

            .contact-card:hover {
                transform: translateY(-7px);
                box-shadow: 0 15px 35px rgba(0,0,0,0.12) !important;
            }

        .contact-icon {
            width: 75px;
            height: 75px;
            margin: auto;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 30px;
        }

        .contact-link {
            display: inline-block;
            font-weight: 500;
            transition: .2s ease;
        }

            .contact-link:hover {
                text-decoration: underline !important;
            }


        /* ================= FOOTER ================= */

        footer {
            background: #212529;
            color: white;
            padding-top: 18px !important;
            padding-bottom: 18px !important;
        }

            footer h5 {
                font-size: 16px;
                margin-bottom: 4px;
            }

            footer p {
                font-size: 13px;
                margin-bottom: 3px !important;
            }

            footer small {
                font-size: 11px;
                opacity: 0.8;
            }


        /* ================= MOBILE ================= */

        @media (max-width: 991px) {

            .navbar-nav {
                align-items: stretch;
                margin-top: 12px;
            }

                .navbar-nav .nav-link {
                    padding: 9px 12px !important;
                }

            .hero {
                min-height: auto;
            }

            .hero-content {
                padding: 60px 0 35px;
            }

            .hero h1 {
                font-size: 40px;
            }

            .hero-visual {
                margin-bottom: 55px;
            }
        }

        @media (max-width: 767px) {

            .hero h1 {
                font-size: 34px;
            }

            .hero p {
                font-size: 16px;
            }

            .job-search-box {
                padding: 10px;
            }

            .hero-buttons {
                flex-direction: column;
            }

                .hero-buttons .btn {
                    width: 100%;
                }

            .hero-visual {
                padding: 25px;
            }

            .hero-visual-icon {
                width: 135px;
                height: 135px;
            }

                .hero-visual-icon i {
                    font-size: 70px;
                }

            .about-icon {
                width: 190px;
                height: 190px;
                margin-top: 30px;
            }

                .about-icon i {
                    font-size: 100px;
                }
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
                            <a class="nav-link active" href="Emp.aspx">Home
                            </a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link active" href="Jobs.aspx">Jobs
                            </a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link active" href="Companies.aspx">Companies
                            </a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link active" href="#features">Features
                            </a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link active" href="#about">About
                            </a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link active" href="#contact">Contact
                            </a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link active" href="#login">Login
                            </a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link active" href="Registration.aspx">Register
                            </a>
                        </li>

                    </ul>

                </div>

            </div>

        </nav>


        <!-- ================= HERO SECTION ================= -->

        <section class="hero">

            <div class="container">

                <div class="row align-items-center g-5">

                    <!-- LEFT -->

                    <div class="col-lg-7 hero-content">

                        <div class="mb-3">

                            <span class="badge bg-light text-primary px-3 py-2 hero-badge">

                                <i class="bi bi-briefcase-fill me-1"></i>
                                Employee Management System

                            </span>

                        </div>


                        <div class="hero-brand mb-2">

                            <i class="bi bi-people-fill me-1"></i>
                            Employee Portal

                       
                        </div>


                        <h1 class="mt-2">Manage Your Employee
                           
                            <br />
                            Information Easily

                        </h1>


                        <p class="mt-4 mb-4">
                            A secure and user-friendly platform for employee
                            registration, profile management, qualifications,
                            resumes, jobs and administrative reporting.

                       
                        </p>


                        <!-- SEARCH -->

                        <div class="job-search-box">

                            <div class="row g-2">

                                <div class="col-md-5">

                                    <asp:TextBox ID="txtJobSearch" runat="server" CssClass="form-control" placeholder="jobtitle,skills, or keyword">
                                    </asp:TextBox>
                                </div>


                                <div class="col-md-4">

                                    <asp:TextBox ID="txtLocation" runat="server" CssClass="form-control" placeholder="Location">

                                    </asp:TextBox>

                                </div>

                                <div class="col-md-3">
                                    <asp:Button ID="btnSearch" runat="server" Text="Search Jobs" CssClass="btn btn-primary w-100" OnClick="btnSearch_Click" />

                                </div>

                            </div>

                        </div>


                        <!-- HERO BUTTONS -->

                        <div class="hero-buttons mt-4">

                            <a href="Registration.aspx"
                                class="btn btn-light btn-lg">

                                <i class="bi bi-person-plus-fill me-1"></i>
                                Register Now

                            </a>


                            <a href="Login.aspx"
                                class="btn btn-outline-light btn-lg">

                                <i class="bi bi-box-arrow-in-right me-1"></i>
                                User Login

                            </a>

                        </div>


                        <!-- TRUST -->

                        <div class="mt-4">

                            <small>

                                <i class="bi bi-shield-check me-1"></i>
                                Secure

                               

                                <span class="mx-2">|</span>

                                <i class="bi bi-phone me-1"></i>
                                Easy to Use

                               

                                <span class="mx-2">|</span>

                                <i class="bi bi-bar-chart me-1"></i>
                                Smart Reports

                               

                                <span class="mx-2">|</span>

                                <i class="bi bi-briefcase me-1"></i>
                                Job Portal

                            </small>

                        </div>

                    </div>


                    <!-- RIGHT -->

                    <div class="col-lg-5">

                        <div class="hero-visual text-center">

                            <div class="hero-visual-icon">

                                <i class="bi bi-person-workspace"></i>

                            </div>


                            <h3 class="fw-bold mt-4">Employee Portal
                            </h3>


                            <p class="mb-3">
                                Everything you need in one place.

                           
                            </p>


                            <div class="row g-3 mt-3">

                                <div class="col-6">

                                    <div class="hero-feature-box">

                                        <i class="bi bi-person-check-fill text-primary fs-3"></i>

                                        <div class="fw-bold mt-2">
                                            Profiles
                                       
                                        </div>

                                    </div>

                                </div>


                                <div class="col-6">

                                    <div class="hero-feature-box">

                                        <i class="bi bi-file-earmark-person-fill text-success fs-3"></i>

                                        <div class="fw-bold mt-2">
                                            Resumes
                                       
                                        </div>

                                    </div>

                                </div>


                                <div class="col-6">

                                    <div class="hero-feature-box">

                                        <i class="bi bi-briefcase-fill text-warning fs-3"></i>

                                        <div class="fw-bold mt-2">
                                            Jobs
                                       
                                        </div>

                                    </div>

                                </div>


                                <div class="col-6">

                                    <div class="hero-feature-box">

                                        <i class="bi bi-bar-chart-fill text-danger fs-3"></i>

                                        <div class="fw-bold mt-2">
                                            Reports
                                       
                                        </div>

                                    </div>

                                </div>

                            </div>

                        </div>

                    </div>

                </div>

            </div>

        </section>


        <!-- ================= WHY CHOOSE US ================= -->

        <section class="py-5 bg-light">

            <div class="container">

                <div class="text-center mb-5 section-heading">

                    <h2 class="fw-bold">Why Choose Us?
                    </h2>

                    <p class="text-muted mb-0">
                        Simple, secure and powerful employee management
                        in one centralized platform.
                   
                    </p>

                </div>


                <div class="row g-4">

                    <!-- SECURE -->

                    <div class="col-md-6 col-lg-3">

                        <div class="card feature-card shadow-sm h-100">

                            <div class="card-body text-center p-4">

                                <div class="why-icon bg-primary bg-opacity-10 mb-3">

                                    <i class="bi bi-shield-lock-fill text-primary"
                                        style="font-size: 42px;"></i>

                                </div>

                                <h5 class="fw-bold">Secure
                                </h5>

                                <p class="text-muted mb-0">
                                    Employee information is managed through
                                    secure user and admin access.
                               
                                </p>

                            </div>

                        </div>

                    </div>


                    <!-- MANAGEMENT -->

                    <div class="col-md-6 col-lg-3">

                        <div class="card feature-card shadow-sm h-100">

                            <div class="card-body text-center p-4">

                                <div class="why-icon bg-success bg-opacity-10 mb-3">

                                    <i class="bi bi-speedometer2 text-success"
                                        style="font-size: 42px;"></i>

                                </div>

                                <h5 class="fw-bold">Easy Management
                                </h5>

                                <p class="text-muted mb-0">
                                    Manage profiles, qualifications and resumes
                                    from one convenient platform.
                               
                                </p>

                            </div>

                        </div>

                    </div>


                    <!-- REPORTS -->

                    <div class="col-md-6 col-lg-3">

                        <div class="card feature-card shadow-sm h-100">

                            <div class="card-body text-center p-4">

                                <div class="why-icon bg-warning bg-opacity-10 mb-3">

                                    <i class="bi bi-bar-chart-fill text-warning"
                                        style="font-size: 42px;"></i>

                                </div>

                                <h5 class="fw-bold">Smart Reports
                                </h5>

                                <p class="text-muted mb-0">
                                    View useful reports and employee statistics
                                    through the admin dashboard.
                               
                                </p>

                            </div>

                        </div>

                    </div>


                    <!-- SEARCH -->

                    <div class="col-md-6 col-lg-3">

                        <div class="card feature-card shadow-sm h-100">

                            <div class="card-body text-center p-4">

                                <div class="why-icon bg-danger bg-opacity-10 mb-3">

                                    <i class="bi bi-search text-danger"
                                        style="font-size: 42px;"></i>

                                </div>

                                <h5 class="fw-bold">Fast Search
                                </h5>

                                <p class="text-muted mb-0">
                                    Quickly find employee information using
                                    smart search functionality.
                               
                                </p>

                            </div>

                        </div>

                    </div>

                </div>

            </div>

        </section>


        <!-- ================= FEATURES ================= -->

        <section id="features" class="py-5">

            <div class="container">

                <div class="text-center mb-5 section-heading">

                    <h2 class="fw-bold">Powerful Features
                    </h2>

                    <p class="text-muted mb-0">
                        Everything you need to manage employee information
                        efficiently and securely.
                   
                    </p>

                </div>


                <div class="row g-4">

                    <!-- REGISTRATION -->

                    <div class="col-md-6 col-lg-4">

                        <div class="card feature-card shadow-sm h-100">

                            <div class="card-body text-center p-4">

                                <i class="bi bi-person-plus-fill text-primary feature-icon"></i>

                                <h4 class="mt-3">Easy Registration
                                </h4>

                                <p class="text-muted mb-0">
                                    Register employees with personal,
                                    educational and professional details.
                               
                                </p>

                            </div>

                        </div>

                    </div>


                    <!-- PROFILE -->

                    <div class="col-md-6 col-lg-4">

                        <div class="card feature-card shadow-sm h-100">

                            <div class="card-body text-center p-4">

                                <i class="bi bi-person-circle text-success feature-icon"></i>

                                <h4 class="mt-3">Profile Management
                                </h4>

                                <p class="text-muted mb-0">
                                    Users can view and update their
                                    profile information easily.
                               
                                </p>

                            </div>

                        </div>

                    </div>


                    <!-- RESUME -->

                    <div class="col-md-6 col-lg-4">

                        <div class="card feature-card shadow-sm h-100">

                            <div class="card-body text-center p-4">

                                <i class="bi bi-file-earmark-person-fill text-danger feature-icon"></i>

                                <h4 class="mt-3">Resume Management
                                </h4>

                                <p class="text-muted mb-0">
                                    Manage and update resume information
                                    from the portal.
                               
                                </p>

                            </div>

                        </div>

                    </div>


                    <!-- REPORTS -->

                    <div class="col-md-6 col-lg-4">

                        <div class="card feature-card shadow-sm h-100">

                            <div class="card-body text-center p-4">

                                <i class="bi bi-bar-chart-fill text-warning feature-icon"></i>

                                <h4 class="mt-3">Reports & Analytics
                                </h4>

                                <p class="text-muted mb-0">
                                    Admin can view users and generate
                                    useful reports and charts.
                               
                                </p>

                            </div>

                        </div>

                    </div>


                    <!-- SEARCH -->

                    <div class="col-md-6 col-lg-4">

                        <div class="card feature-card shadow-sm h-100">

                            <div class="card-body text-center p-4">

                                <i class="bi bi-search text-info feature-icon"></i>

                                <h4 class="mt-3">Smart Search
                                </h4>

                                <p class="text-muted mb-0">
                                    Quickly search registered users by
                                    name, email or mobile number.
                               
                                </p>

                            </div>

                        </div>

                    </div>


                    <!-- EXPORT -->

                    <div class="col-md-6 col-lg-4">

                        <div class="card feature-card shadow-sm h-100">

                            <div class="card-body text-center p-4">

                                <i class="bi bi-file-earmark-excel-fill text-success feature-icon"></i>

                                <h4 class="mt-3">Excel Export
                                </h4>

                                <p class="text-muted mb-0">
                                    Export employee information into
                                    Excel for further use.
                               
                                </p>

                            </div>

                        </div>

                    </div>

                </div>

            </div>

        </section>


        <!-- ================= ABOUT ================= -->

        <section id="about" class="py-5 bg-light">

            <div class="container">

                <div class="row align-items-center g-5">

                    <div class="col-lg-6">

                        <span class="badge bg-primary bg-opacity-10 text-primary px-3 py-2 mb-3">About Our Platform
                        </span>

                        <h2 class="fw-bold mb-3">About Employee Management Portal
                        </h2>

                        <p class="text-muted">
                            Employee Management Portal is a complete web-based
                            solution designed to manage employee registration,
                            profiles, educational qualifications and resumes
                            from a single platform.
                       
                        </p>

                        <p class="text-muted">
                            The system provides separate access for users and
                            administrators, making employee information easy
                            to manage, search, update and analyze.
                       
                        </p>


                        <div class="row mt-4 g-3">

                            <div class="col-6">

                                <div class="bg-white rounded-3 p-3 shadow-sm">

                                    <h3 class="text-primary fw-bold mb-1">100%
                                    </h3>

                                    <p class="text-muted mb-0">
                                        Easy Management
                                   
                                    </p>

                                </div>

                            </div>


                            <div class="col-6">

                                <div class="bg-white rounded-3 p-3 shadow-sm">

                                    <h3 class="text-success fw-bold mb-1">Secure
                                    </h3>

                                    <p class="text-muted mb-0">
                                        User Access
                                   
                                    </p>

                                </div>

                            </div>

                        </div>

                    </div>


                    <div class="col-lg-6 text-center">

                        <div class="about-icon shadow-sm">

                            <i class="bi bi-building text-primary"></i>

                        </div>

                    </div>

                </div>

            </div>

        </section>


        <!-- ================= LOGIN SECTION ================= -->

        <section id="login" class="py-5">

            <div class="container">

                <div class="text-center mb-5 section-heading">

                    <h2 class="fw-bold">Access Portal
                    </h2>

                    <p class="text-muted mb-0">
                        Choose your login option to access the portal.
                   
                    </p>

                </div>


                <div class="row justify-content-center g-4">

                    <!-- USER LOGIN -->

                    <div class="col-md-6 col-lg-4">

                        <div class="card login-card shadow-sm h-100">

                            <div class="card-body text-center p-4 d-flex flex-column">

                                <div>

                                    <div class="login-icon bg-primary bg-opacity-10">

                                        <i class="bi bi-person-circle text-primary"
                                            style="font-size: 55px;"></i>

                                    </div>

                                    <h4 class="mt-4">User Login
                                    </h4>

                                    <p class="text-muted">
                                        Login to view and manage your profile.
                                   
                                    </p>

                                </div>


                                <div class="mt-auto pt-3">

                                    <a href="Login.aspx"
                                        class="btn btn-primary w-100">

                                        <i class="bi bi-box-arrow-in-right me-1"></i>
                                        User Login

                                    </a>

                                </div>

                            </div>

                        </div>

                    </div>


                    <!-- ADMIN LOGIN -->

                    <div class="col-md-6 col-lg-4">

                        <div class="card login-card shadow-sm h-100">

                            <div class="card-body text-center p-4 d-flex flex-column">

                                <div>

                                    <div class="login-icon bg-danger bg-opacity-10">

                                        <i class="bi bi-shield-lock-fill text-danger"
                                            style="font-size: 55px;"></i>

                                    </div>

                                    <h4 class="mt-4">Admin Login
                                    </h4>

                                    <p class="text-muted">
                                        Admin can manage users, reports and dashboard.
                                   
                                    </p>

                                </div>


                                <div class="mt-auto pt-3">

                                    <a href="AdminLogin.aspx"
                                        class="btn btn-danger w-100">

                                        <i class="bi bi-shield-lock me-1"></i>
                                        Admin Login

                                    </a>

                                </div>

                            </div>

                        </div>

                    </div>

                </div>

            </div>

        </section>


        <!-- ================= CONTACT US ================= -->

        <section id="contact" class="py-5 contact-section">

            <div class="container">

                <div class="text-center mb-5 section-heading">

                    <h2 class="fw-bold">Contact Us
                    </h2>

                    <p class="text-muted mb-0">
                        Have a question? Get in touch with us.
                   
                    </p>

                </div>


                <div class="row justify-content-center g-4">

                    <!-- EMAIL -->

                    <div class="col-md-6 col-lg-4">

                        <div class="card contact-card shadow-sm h-100">

                            <div class="card-body text-center p-4">

                                <div class="contact-icon bg-primary bg-opacity-10">

                                    <i class="bi bi-envelope-fill text-primary"></i>

                                </div>

                                <h5 class="mt-4 fw-bold">Email
                                </h5>

                                <p class="text-muted small mb-2">
                                    Send us your query
                               
                                </p>

                                <a href="https://mail.google.com/mail/?view=cm&fs=1&to=raviranjan867@gmail.com"
                                    target="_blank"
                                    class="contact-link text-primary text-decoration-none">

                                    <i class="bi bi-envelope me-1"></i>
                                    raviranjan867@gmail.com

</a>
                            </div>

                        </div>

                    </div>


                    <!-- PHONE -->

                    <div class="col-md-6 col-lg-4">

                        <div class="card contact-card shadow-sm h-100">

                            <div class="card-body text-center p-4">

                                <div class="contact-icon bg-success bg-opacity-10">

                                    <i class="bi bi-telephone-fill text-success"></i>

                                </div>

                                <h5 class="mt-4 fw-bold">Phone
                                </h5>

                                <p class="text-muted small mb-2">
                                    Call us for assistance
                               
                                </p>

                                <a href="tel:+918586944072"
                                    class="contact-link text-success text-decoration-none">

                                    <i class="bi bi-telephone me-1"></i>
                                    +91 8586944072

                                </a>

                            </div>

                        </div>

                    </div>


                    <!-- ADDRESS -->

                    <div class="col-md-6 col-lg-4">

                        <div class="card contact-card shadow-sm h-100">

                            <div class="card-body text-center p-4">

                                <div class="contact-icon bg-danger bg-opacity-10">

                                    <i class="bi bi-geo-alt-fill text-danger"></i>

                                </div>

                                <h5 class="mt-4 fw-bold">Address
                                </h5>

                                <p class="text-muted small mb-2">
                                    Our office location
                               
                                </p>

                                <p class="text-muted mb-0">
                                    Rohini, North West Delhi, India
                               
                                </p>

                            </div>

                        </div>

                    </div>

                </div>

            </div>

        </section>


        <!-- ================= FOOTER ================= -->

        <footer>

            <div class="container text-center">

                <h5><i class="bi bi-people-fill"></i>Employee Management Portal

                </h5>

                <p>
                    Registration • Profile • Resume • Jobs • Reports
               
                </p>

                <small>© 2026 Employee Management Portal. All Rights Reserved.
                </small>

            </div>

        </footer>

    </form>


    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>

</html>
