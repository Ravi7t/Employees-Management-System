<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminReport.aspx.cs" Inherits="Assignment1_Assignment2.AdminReport" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet" />

    <style>
    @media print {

        .btn {
            display: none;
        }

        body {
            margin: 20px;
        }

        h2 {
            text-align: center;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        table, th, td {
            border: 1px solid black;
        }

        th, td {
            padding: 8px;
            text-align: center;
        }
    }
</style>
    <title></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />

</head>
<body>
 <form id="form1" runat="server">
     <div class="d-flex justify-content-beetween align-baseline align-items-center mb-4">
         <a href="AdminDashboard.aspx" class="btn btn-primary">
             <i class="bi bi-arrow-left"></i>Back
         </a>
     </div>
        <div class="container mt-4">
<h2 class="text-center mb-4">Dashboard Report</h2>

    <div class="row mb-4">

        <div class="col-md-3">
            <div class="card bg-primary text-white">
                <div class="card-body">
                    <asp:Label ID="lblTotal" runat="server"></asp:Label>
                </div>
            </div>
        </div>

        <div class="col-md-3">
            <div class="card bg-success text-white">
                <div class="card-body">
                    <asp:Label ID="lblMale" runat="server"></asp:Label>
                </div>
            </div>
        </div>

        <div class="col-md-3">
            <div class="card bg-danger text-white">
                <div class="card-body">
                    <asp:Label ID="lblFemale" runat="server"></asp:Label>
                </div>
            </div>
        </div>

        <div class="col-md-3">
            <div class="card bg-warning">
                <div class="card-body">
                    <asp:Label ID="lblQualification" runat="server"></asp:Label>
                </div>
            </div>
        </div>

    </div>
            <div class="mb-4">
                <button type="button" class="btn btn-primary" onclick="window.print()">PrintReport</button>
            </div>

    <asp:GridView ID="gvReport"
        runat="server"
        CssClass="table table-bordered"
        AutoGenerateColumns="true"
        GridLines="Both"
        Width="100%">
        
    </asp:GridView>

</div>
    </form>
</body>
</html>
