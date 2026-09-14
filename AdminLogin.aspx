<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminLogin.aspx.cs" Inherits="Assignment1_Assignment2.AdminLogin" %>

<!DOCTYPE html>

<html>

<head runat="server">

<title>Admin Login</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"/>

</head>

<body class="bg-light">

<form id="form1" runat="server">

<div class="container">

<div class="row justify-content-center mt-5">

<div class="col-md-4">

<div class="card shadow">

<div class="card-header text-center bg-primary text-white">

<h3>Admin Login</h3>

</div>

<div class="card-body">

<input
type="text"
id="txtEmail"
runat="server"
class="form-control mb-3"
placeholder="Email" />

<input
type="password"
id="txtPassword"
runat="server"
class="form-control mb-3"
placeholder="Password" />

<asp:Button
ID="btnLogin"
runat="server"
Text="Login"
CssClass="btn btn-primary w-100"
OnClick="btnLogin_Click"/>

</div>

</div>

</div>

</div>

</div>

</form>

</body>

</html>