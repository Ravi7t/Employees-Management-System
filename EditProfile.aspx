<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditProfile.aspx.cs" Inherits="Assignment1_Assignment2.EditProfile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <title>Edit Profile</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />

    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet"/>

    <style>

        body{
            background:#eef3f8;
            font-family:'Segoe UI',sans-serif;
        }

        .profile-card{
            border:none;
            border-radius:20px;
            overflow:hidden;
        }

        .profile-header{
            background:linear-gradient(135deg,#0d6efd,#4b8dff);
            color:#fff;
            padding:35px;
            position:relative;
        }

        .back-btn{
            position:absolute;
            left:20px;
            top:20px;
        }

        .profile-photo{
            width:150px;
            height:150px;
            border-radius:50%;
            border:5px solid white;
            object-fit:cover;
            background:white;
            box-shadow:0 5px 15px rgba(0,0,0,.2);
        }

        .section-box{
            background:#fff;
            border-radius:15px;
            padding:25px;
            margin-bottom:25px;
            box-shadow:0 3px 10px rgba(0,0,0,.08);
        }

        .section-title{
            font-size:22px;
            font-weight:700;
            color:#0d6efd;
            margin-bottom:20px;
            border-left:5px solid #0d6efd;
            padding-left:10px;
        }

        .form-label{
            font-weight:600;
            color:#444;
        }

        .form-control,
        .form-select{
            border-radius:10px;
            min-height:46px;
        }

        textarea.form-control{
            min-height:110px;
        }

    </style>

</head>

<body>

<form id="form1" runat="server">

<div class="container py-5">

<div class="row justify-content-center">

<div class="col-lg-10">

<div class="card profile-card shadow-lg">

<div class="profile-header text-center">

<a href="HomePage.aspx"
class="btn btn-light btn-sm back-btn">
<i class="bi bi-arrow-left"></i> Back
</a>

<img id="imgPreview"
runat="server"
class="profile-photo"
style="display:none;" />

<h2 class="mt-3 fw-bold">Edit Profile</h2>

<p class="mb-0">
Update your personal information and account details
</p>

</div>

<div class="card-body p-4">

<!-- ================= Personal Information ================= -->

<div class="section-box">

<div class="section-title">
<i class="bi bi-person-circle"></i>
Personal Information
</div>

<div class="row">

<div class="col-md-6 mb-3">

<label class="form-label">
Full Name
</label>

<input type="text"
id="txtName"
runat="server"
class="form-control"/>

</div>

<div class="col-md-6 mb-3">

<label class="form-label">
Email
</label>

<input type="text"
id="txtEmail"
runat="server"
class="form-control"/>

</div>

<div class="col-md-6 mb-3">

<label class="form-label">
Mobile Number
</label>

<input type="text"
id="txtMobile"
runat="server"
class="form-control"/>

</div>

<div class="col-md-6 mb-3">

<label class="form-label">
Religion
</label>

<select id="ddlReligion"
runat="server"
class="form-select">

<option value="">
Select Religion
</option>

</select>

</div>

<div class="col-md-6 mb-3">

<label class="form-label">
Gender
</label>

<div id="divGender"
runat="server"
class="mt-2">
</div>

</div>

<div class="col-md-6 mb-3">

<label class="form-label">
Hobbies
</label>

<div id="divHobbies"
runat="server"
class="mt-2">
</div>

</div>

<div class="col-md-6 mb-3">

<label class="form-label">
Date of Birth
</label>

<input type="date"
id="txtDOB"
runat="server"
class="form-control"/>

</div>

<div class="col-md-6 mb-3">

<label class="form-label">
Age
</label>

<input type="text"
id="txtAge"
runat="server"
readonly
class="form-control"/>

</div>

<div class="col-12 mb-3">

<label class="form-label">
Address
</label>

<textarea id="txtAddress"
runat="server"
class="form-control"></textarea>

</div>
    </div>
    </div>
    
    <!-- ================= Account Information ================= -->

<div class="section-box">

<div class="section-title">
<i class="bi bi-shield-lock"></i>
Account Information
</div>

<div class="row">

<div class="col-md-6 mb-3">

<label class="form-label">
Password
</label>

<input type="text"
id="txtPassword"
runat="server"
class="form-control"/>

</div>

<div class="col-md-6 mb-3">

<label class="form-label">
Confirm Password
</label>

<input type="text"
id="txtConfirmPassword"
runat="server"
class="form-control"/>

</div>

</div>

</div>

<!-- ================= Documents ================= -->

<div class="section-box">

<div class="section-title">
<i class="bi bi-folder2-open"></i>
Profile & Documents
</div>

<div class="row">

<div class="col-md-4 text-center">

<label class="form-label fw-bold">
Profile Photo
</label>

<div class="mb-3">

<input type="file"
id="filePhoto"
class="form-control"
accept=".jpg,.jpeg,.png"/>

</div>

</div>

<div class="col-md-8">

<label class="form-label fw-bold">
Resume
</label>

<div class="mb-3">

<a id="lnkResume"
runat="server"
target="_blank"
class="btn btn-outline-primary">

<i class="bi bi-file-earmark-arrow-down"></i>
Download Resume

</a>

</div>

<input type="file"
id="fileResume"
class="form-control"
accept=".pdf,.doc,.docx"/>

</div>

</div>

</div>

<!-- ================= Qualification ================= -->

<div class="section-box">

<div class="d-flex justify-content-between align-items-center mb-4">

<h4 class="fw-bold text-primary mb-0">
<i class="bi bi-mortarboard"></i>
Qualification Details
</h4>
</div>

<div class="mb-3">

<span id="spQualification"
class="text-danger fw-bold">
</span>

</div>

<div class="table-responsive">

<table
class="table table-hover table-bordered align-middle"
id="tblQualification">

<thead class="table-primary">

<tr>

<th>Qualification</th>

<th>Board</th>

<th>Year</th>

<th>Percentage</th>

</tr>

</thead>

<tbody>

</tbody>

</table>

</div>

</div>
    <!-- ================= Update Button And Download Profile Button ================= -->

<div class="d-flex justify-content-center align-items-center gap-3 mt-4">

    <button
        type="button"
        id="btnUpdate"
        class="btn btn-success btn-lg px-5 shadow">
        <i class="bi bi-check-circle"></i>
        Update Profile
    </button>

    <button
        type="button"
        id="btnDownloadProfile"
        class="btn btn-primary btn-lg px-5 shadow">
        <i class="bi bi-download"></i>
        Download Profile
    </button>

</div>

</div> 

</div> 

</div>

</div> 

</div> 
<script src="Scripts/jquery-3.7.1.min.js"></script>
<script src="Scripts/bootstrap.bundle.min.js"></script>
<script src="Scripts/EditProfile.js"></script>

</form>

</body>
</html>