<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ForgotPassword.aspx.cs" Inherits="Assignment1_Assignment2.ForgotPassword" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Forgot Password</title>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
</head>
<body>

  <form id="form1" runat="server">
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-5">
                <div class="card shadow p-4">
                    <h3 class="text-center mb-4">Forgot Password</h3>

                    <!-- Email -->
                    <div class="mb-3">
                        <label for="txtEmail" class="form-label">Email</label>
                        <input type="text" id="txtEmail" class="form-control" />
                        <span id="spEmail" class="text-danger"></span>
                    </div>

                    <!-- OTP -->
                    <div class="mb-3" id="otpDiv" style="display: none">
                        <label for="txtOTP" class="form-label">Enter OTP</label>
                        <div class="d-flex gap-2">
                            <input type="text" id="txtOTP" class="form-control" />
                            <button type="button" id="btnVerifyOTP" class="btn btn-success">
                                Verify OTP
                            </button>
                        </div>
                    </div>

                    <!-- Buttons -->
                    <div class="d-flex justify-content-start">
    <input type="button" id="btnSubmit" value="Submit" class="btn btn-success" />
    <input type="button" id="btnCancel" value="Cancel" class="btn btn-danger ms-1" />
</div>

                </div>
            </div>
        </div>
    </div>
</form>
    <script src="Scripts/jquery-3.7.1.min.js"></script>
    <script src="Scripts/ForgotPassword.js"></script>
</body>
</html>
