<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="Assignment1_Assignment2.Registration" %>

<!DOCTYPE html>

<html>
<head runat="server">

    <title>Employee Registration</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />

    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet" />

    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

    <script src="Registration.js"></script>

    <style>
        body {
            background: #f4f7fc;
        }

        .main-card {
            border: none;
            border-radius: 18px;
            overflow: hidden;
        }

        .main-header {
            background: linear-gradient(135deg, #0d6efd, #6610f2);
            color: white;
            padding: 25px;
        }

            .main-header h2 {
                margin: 0;
                font-weight: 700;
            }

            .main-header p {
                margin: 8px 0 0;
                opacity: 0.9;
            }

        .section-card {
            border: 1px solid #e2e6ea;
            border-radius: 12px;
            margin-bottom: 25px;
            overflow: hidden;
            background: white;
        }

        .section-header {
            background: #f1f5ff;
            border-left: 5px solid #0d6efd;
            padding: 13px 18px;
            font-size: 19px;
            font-weight: 600;
            color: #212529;
        }

            .section-header i {
                color: #0d6efd;
                margin-right: 8px;
            }

        .section-body {
            padding: 25px;
        }

        label {
            font-weight: 600;
            color: #343a40;
        }

        .required {
            color: #dc3545;
        }

        .form-control,
        .form-select {
            border-radius: 8px;
            min-height: 42px;
        }

            .form-control:focus,
            .form-select:focus {
                box-shadow: 0 0 0 0.15rem rgba(13, 110, 253, .15);
            }

        .document-box {
            background: #f8f9fa;
            border: 1px dashed #adb5bd;
            border-radius: 10px;
            padding: 18px;
        }

        .preview-box {
            margin-top: 15px;
        }

        #imgPreview {
            border-radius: 10px;
            object-fit: cover;
            border: 2px solid #dee2e6;
        }

        .qualification-table th {
            background: #0d6efd;
            color: white;
            text-align: center;
        }

        .qualification-table td {
            vertical-align: middle;
        }

        .bottom-buttons {
            padding: 25px 0 10px;
        }

        .btn {
            border-radius: 8px;
        }
        /* Gender & Hobbies */

.option-box {
    display: flex !important;
    flex-direction: row !important;
    flex-wrap: wrap !important;
    align-items: center;
    gap: 12px 20px;
}

/* Dynamic <br> ko hide karega */
.option-box br {
    display: none !important;
}

.option-box label {
    display: inline-flex !important;
    align-items: center;
    gap: 7px;
    margin: 0 !important;
    padding: 8px 14px;
    border: 1px solid #ced4da;
    border-radius: 8px;
    background: #f8f9fa;
    cursor: pointer;
    font-weight: 500;
    white-space: nowrap;
}

.option-box label:hover {
    background: #e9f2ff;
    border-color: #0d6efd;
}

.option-box input[type="radio"],
.option-box input[type="checkbox"] {
    width: 18px;
    height: 18px;
    margin: 0;
    accent-color: #0d6efd;
}
    </style>

</head>

<body>

    <form id="form1" runat="server">

        <div class="container py-5">

            <div class="card main-card shadow-lg">

                <!-- ================= HEADER ================= -->

                <div class="main-header text-center">

                    <i class="bi bi-person-plus-fill"
                        style="font-size: 40px;"></i>

                    <h2>Employee Registration
                </h2>

                    <p>
                        Create your account and provide your personal,
                    security, document and qualification details.
               
                    </p>

                </div>


                <div class="card-body p-4 p-md-5">


                    <!-- ================================================= -->
                    <!-- PERSONAL DETAILS -->
                    <!-- ================================================= -->

                    <div class="section-card">

                        <div class="section-header">

                            <i class="bi bi-person-vcard-fill"></i>

                            Personal Details

                   
                        </div>


                        <div class="section-body">

                            <!-- Name -->

                            <div class="row mb-3">

                                <div class="col-md-3">
                                    <label>
                                        Name <span class="required">*</span>
                                    </label>
                                </div>

                                <div class="col-md-5">

                                    <input type="text"
                                        id="txtName"
                                        class="form-control"
                                        placeholder="Enter Name"
                                        onkeypress="return onlyCharacters(event)" />

                                </div>

                                <div class="col-md-4">

                                    <span id="spName"
                                        class="text-danger"></span>

                                </div>

                            </div>


                            <!-- Email -->

                            <div class="row mb-3">

                                <div class="col-md-3">

                                    <label>
                                        Email <span class="required">*</span>
                                    </label>

                                </div>

                                <div class="col-md-5">

                                    <input type="text"
                                        id="txtEmail"
                                        class="form-control"
                                        placeholder="Enter Email"
                                        onkeypress="return ValidateEmail(event)" />

                                </div>

                                <div class="col-md-4">

                                    <span id="spEmail"
                                        class="text-danger"></span>

                                </div>

                            </div>


                            <!-- Mobile -->

                            <div class="row mb-3">

                                <div class="col-md-3">

                                    <label>
                                        Mobile Number <span class="required">*</span>
                                    </label>

                                </div>

                                <div class="col-md-5">

                                    <input type="text"
                                        id="txtMobile"
                                        maxlength="10"
                                        class="form-control"
                                        placeholder="Enter Mobile Number"
                                        onkeyup="return ValidateMobile(event)" />

                                </div>

                                <div class="col-md-4">

                                    <span id="spMobile"
                                        class="text-danger"></span>

                                </div>

                            </div>


                            <!-- Gender -->

                            <div class="row mb-3">

                                <div class="col-md-3">

                                    <label>
                                        Gender <span class="required">*</span>
                                    </label>

                                </div>

                                <div class="col-md-5">

                                    <div id="divGender"
                                        runat="server"
                                        class="option-box"
                                        onchange="validateGender()">
                                    </div>
                                </div>

                                <div class="col-md-4">

                                    <span id="spGender"
                                        class="text-danger"></span>

                                </div>

                            </div>


                            <!-- Hobbies -->

                            <div class="row mb-3">

                                <div class="col-md-3">

                                    <label>
                                        Hobbies <span class="required">*</span>
                                    </label>

                                </div>

                                <div class="col-md-9">

                                    <div id="divHobbies"
                                        runat="server"
                                        clientidmode="Static"
                                        class="option-box"
                                        onchange="validateHobbies()">
                                    </div>
                                </div>

                                <div class="col-md-4">

                                    <span id="spHobbies"
                                        class="text-danger"></span>

                                </div>

                            </div>


                            <!-- Religion -->

                            <div class="row mb-3">

                                <div class="col-md-3">

                                    <label>
                                        Religion <span class="required">*</span>
                                    </label>

                                </div>

                                <div class="col-md-5">

                                    <select id="ddlReligion"
                                        runat="server"
                                        clientidmode="Static"
                                        class="form-select"
                                        onchange="validateReligion()">

                                        <option value="">Select Religion
                                    </option>

                                    </select>

                                </div>

                                <div class="col-md-4">

                                    <span id="spReligion"
                                        class="text-danger"></span>

                                </div>

                            </div>


                            <!-- DOB -->

                            <div class="row mb-3">

                                <div class="col-md-3">

                                    <label>
                                        Date Of Birth <span class="required">*</span>
                                    </label>

                                </div>

                                <div class="col-md-5">

                                    <input type="date"
                                        id="txtDOB"
                                        class="form-control"
                                        onchange="validateAge();" />

                                </div>

                                <div class="col-md-4">

                                    <span id="spDOB"
                                        class="text-danger"></span>

                                </div>

                            </div>


                            <!-- Age -->

                            <div class="row mb-3">

                                <div class="col-md-3">

                                    <label>
                                        Age
                               
                                    </label>

                                </div>

                                <div class="col-md-5">

                                    <input type="text"
                                        id="txtAge"
                                        class="form-control"
                                        readonly />

                                </div>

                            </div>


                            <!-- Address -->

                            <div class="row mb-3">

                                <div class="col-md-3">

                                    <label>
                                        Address
                               
                                    </label>

                                </div>

                                <div class="col-md-5">

                                    <textarea id="txtAddress"
                                        rows="4"
                                        class="form-control"
                                        placeholder="Enter Address"
                                        onkeyup="return ValidateAddress(event)">
                                </textarea>

                                </div>

                                <div class="col-md-4">

                                    <span id="spAddress"
                                        class="text-danger"></span>

                                </div>

                            </div>

                        </div>

                    </div>


                    <!-- ================================================= -->
                    <!-- ACCOUNT & SECURITY -->
                    <!-- ================================================= -->

                    <div class="section-card">

                        <div class="section-header">

                            <i class="bi bi-shield-lock-fill"></i>

                            Account & Security

                   
                        </div>


                        <div class="section-body">


                            <!-- Password -->

                            <div class="row mb-3">

                                <div class="col-md-3">

                                    <label>
                                        Password <span class="required">*</span>
                                    </label>

                                </div>

                                <div class="col-md-5">

                                    <div class="input-group">

                                        <input type="password"
                                            id="txtPassword"
                                            class="form-control"
                                            autocomplete="off"
                                            placeholder="Enter Password"
                                            onkeyup="validatePassword();checkConfirmPassword();" />

                                        <button type="button"
                                            id="btnShowPassword"
                                            class="btn btn-outline-secondary">
                                            Show

                                   
                                        </button>

                                    </div>

                                </div>

                                <div class="col-md-4">

                                    <span id="spPassword"
                                        class="text-danger"></span>

                                </div>

                            </div>


                            <!-- Confirm Password -->

                            <div class="row mb-3">

                                <div class="col-md-3">

                                    <label>
                                        Confirm Password <span class="required">*</span>
                                    </label>

                                </div>

                                <div class="col-md-5">

                                    <div class="input-group">

                                        <input type="password"
                                            id="txtConfirmPassword"
                                            class="form-control"
                                            autocomplete="off"
                                            placeholder="Confirm Password"
                                            onkeyup="checkConfirmPassword();" />

                                        <button type="button"
                                            id="btnShowConfirmPassword"
                                            class="btn btn-outline-secondary">
                                            Show

                                   
                                        </button>

                                    </div>

                                </div>

                                <div class="col-md-4">

                                    <span id="spConfirmPassword"
                                        class="text-danger"></span>

                                </div>

                            </div>

                        </div>

                    </div>


                    <!-- ================================================= -->
                    <!-- DOCUMENTS -->
                    <!-- ================================================= -->

                    <div class="section-card">

                        <div class="section-header">

                            <i class="bi bi-file-earmark-person-fill"></i>

                            Documents

                   
                        </div>


                        <div class="section-body">


                            <div class="row g-4">


                                <!-- PHOTO -->

                                <div class="col-md-6">

                                    <div class="document-box h-100">

                                        <div class="mb-3">

                                            <label>
                                                <i class="bi bi-camera-fill"></i>
                                                Upload Profile Photo
                                       
                                            </label>

                                        </div>

                                        <input type="file"
                                            id="filePhoto"
                                            class="form-control"
                                            accept=".jpg,.jpeg,.png,.gif"
                                            onchange="validatePhoto(); previewPhoto();" />

                                        <span id="spPhoto"
                                            class="text-danger"></span>


                                        <div class="preview-box">

                                            <img id="imgPreview"
                                                src=""
                                                width="120"
                                                height="120"
                                                style="display: none;" />

                                            <br />
                                            <br />

                                            <button type="button"
                                                id="btnRemovePhoto"
                                                class="btn btn-danger btn-sm"
                                                style="display: none;"
                                                onclick="RemovePhoto()">

                                                <i class="bi bi-trash"></i>
                                                Remove Photo

                                       
                                            </button>

                                        </div>

                                    </div>

                                </div>


                                <!-- RESUME -->

                                <div class="col-md-6">

                                    <div class="document-box h-100">

                                        <div class="mb-3">

                                            <label>
                                                <i class="bi bi-file-earmark-text-fill"></i>
                                                Upload Resume
                                       
                                            </label>

                                        </div>

                                        <input type="file"
                                            id="fileResume"
                                            class="form-control"
                                            accept=".doc,.docx,.pdf"
                                            onchange="validateResume()" />

                                        <span id="spResume"
                                            class="text-danger"></span>

                                        <br />
                                        <br />

                                        <button type="button"
                                            id="btnRemoveResume"
                                            class="btn btn-danger btn-sm"
                                            style="display: none;"
                                            onclick="RemoveResume()">

                                            <i class="bi bi-trash"></i>
                                            Remove Resume

                                   
                                        </button>

                                    </div>

                                </div>

                            </div>

                        </div>

                    </div>


                    <!-- ================================================= -->
                    <!-- EDUCATIONAL QUALIFICATION -->
                    <!-- ================================================= -->

                    <div class="section-card">

                        <div class="section-header">

                            <i class="bi bi-mortarboard-fill"></i>

                            Educational Qualification

                   
                        </div>


                        <div class="section-body">

                            <div class="row mb-3">

                                <div class="col-md-3">

                                    <button type="button"
                                        id="btnAdd"
                                        class="btn btn-primary">

                                        <i class="bi bi-plus-circle"></i>
                                        Add Qualification

                               
                                    </button>

                                </div>

                                <div class="col-md-9">

                                    <span id="spQualification"
                                        class="text-danger"></span>

                                </div>

                            </div>


                            <div class="table-responsive">

                                <table class="table table-bordered table-hover qualification-table"
                                    id="tblQualification">

                                    <thead>

                                        <tr>

                                            <th>Qualification
                                        </th>

                                            <th>Board
                                        </th>

                                            <th>Year
                                        </th>

                                            <th>Percentage
                                        </th>

                                        </tr>

                                    </thead>

                                    <tbody id="tblBody" runat="server"></tbody>

                                </table>

                            </div>

                        </div>

                    </div>


                    <!-- ================================================= -->
                    <!-- BUTTONS -->
                    <!-- ================================================= -->

                    <div class="bottom-buttons text-center">

                        <button type="button"
                            id="btnSubmit"
                            onclick="return validateForm();"
                            class="btn btn-success btn-lg px-5 me-2">

                            <i class="bi bi-check-circle-fill"></i>
                            Submit Registration

                   
                        </button>


                        <button type="reset"
                            id="btnCancel"
                            class="btn btn-danger btn-lg px-5">

                            <i class="bi bi-arrow-counterclockwise"></i>
                            Reset

                   
                        </button>

                    </div>

                </div>

            </div>

        </div>

    </form>

</body>
</html>
