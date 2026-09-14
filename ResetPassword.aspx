<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ResetPassword.aspx.cs" Inherits="Assignment1_Assignment2.ResetPassword" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Reset Password</title>

    <link href="Content/bootstrap.min.css" rel="stylesheet" />
</head>

<body>

<form id="form1" runat="server">

<div class="container mt-5">

<div class="row">

<div class="col-md-4 offset-md-4">

<h3 class="text-center">Reset Password</h3>

<label>New Password</label>

<input type="password" id="txtPassword" class="form-control"/>

<span id="spPassword" class="text-danger"></span>

<br />

<label>Confirm Password</label>

<input type="password" id="txtConfirmPassword" class="form-control"/>

<span id="spConfirmPassword" class="text-danger"></span>

<br />

<input type="button" id="btnSubmit" value="Submit" class="btn btn-success"/>

<input type="button" id="btnCancel" value="Cancel" class="btn btn-danger"/>

</div>

</div>

</div>

</form>

<script src="Scripts/jquery-3.7.1.min.js"></script>
<script src="Scripts/ResetPassword.js"></script>

</body>
</html>

