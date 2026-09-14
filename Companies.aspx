<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Companies.aspx.cs" Inherits="Assignment1_Assignment2.Companies" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Companies</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
</head>

<body>

<form id="form1" runat="server">

    <div class="container py-5">

        <div class="text-center mb-5">
            <h2>Top Companies</h2>
            <p class="text-muted">
                Explore companies and their available job opportunities.
            </p>
        </div>

        <div class="row g-4">

            <asp:Repeater ID="rptCompanies" runat="server">

                <ItemTemplate>

                    <div class="col-md-6 col-lg-4">

                        <div class="card shadow-sm h-100">

                            <div class="card-body">

                                <h5 class="card-title">
                                    <%# Eval("CompanyName") %>
                                </h5>

                                <p class="text-muted mb-2">
                                    <i class="bi bi-geo-alt"></i>
                                    <%# Eval("Location") %>
                                </p>

                                <p class="mb-3">
                                    Category:
                                    <%# Eval("Category") %>
                                </p>

                                <a href='Jobs.aspx?company=<%# Server.UrlEncode(Eval("CompanyName").ToString()) %>'
                                   class="btn btn-primary">
                                    View Jobs
                                </a>

                            </div>

                        </div>

                    </div>

                </ItemTemplate>

            </asp:Repeater>

        </div>

    </div>

</form>

</body>
</html>