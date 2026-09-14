<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AccessDenied.aspx.cs" Inherits="Assignment1_Assignment2.AccessDenied" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Access Denied</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
</head>

<body>

<form id="form1" runat="server">

    <div class="container text-center mt-5">

        <h1 class="text-danger">Access Denied</h1>

        <p class="mt-3">
            You don't have permission to access this page.
        </p>

        <a href="AdminDashboard.aspx" class="btn btn-primary mt-3">
            Back to Dashboard
        </a>

    </div>

</form>

</body>
</html>