<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminResume.aspx.cs" Inherits="Assignment1_Assignment2.AdminResume" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container mt-4">

            <div class="card shadow-lg border-0">

                <div class="card-header bg-primary text-white d-flex justify-content-between align-items-center">

                    <h3 class="mb-0">📄 My Resume</h3>

                    <a href="AdminDashboard.aspx" class="btn btn-light btn-sm">← Back
            </a>

                </div>

                <div class="card-body">

                    <div class="row">

                        <div class="col-md-6 mb-3">
                            <label class="form-label fw-bold">Full Name</label>
                            <asp:TextBox ID="txtName" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>

                        <div class="col-md-6 mb-3">
                            <label class="form-label fw-bold">Email</label>
                            <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>

                        <div class="col-md-6 mb-3">
                            <label class="form-label fw-bold">Mobile</label>
                            <asp:TextBox ID="txtMobile" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>

                        <div class="col-md-6 mb-3">
                            <label class="form-label fw-bold">Address</label>
                            <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>

                        <div class="col-md-12 mb-3">
                            <label class="form-label fw-bold">Career Objective</label>
                            <asp:TextBox ID="txtObjective" runat="server" CssClass="form-control"
                                TextMode="MultiLine" Rows="4"></asp:TextBox>
                        </div>

                        <div class="col-md-12 mb-3">
                            <label class="form-label fw-bold">Technical Skills</label>
                            <asp:TextBox ID="txtSkills" runat="server" CssClass="form-control"
                                TextMode="MultiLine" Rows="4"></asp:TextBox>
                        </div>

                        <div class="col-md-12 mb-3">
                            <label class="form-label fw-bold">Education</label>
                            <asp:TextBox ID="txtEducation" runat="server" CssClass="form-control"
                                TextMode="MultiLine" Rows="4"></asp:TextBox>
                        </div>

                        <div class="col-md-12 mb-3">
                            <label class="form-label fw-bold">Experience</label>
                            <asp:TextBox ID="txtExperience" runat="server" CssClass="form-control"
                                TextMode="MultiLine" Rows="4"></asp:TextBox>
                        </div>

                        <div class="col-md-12 mb-3">
                            <label class="form-label fw-bold">Projects</label>
                            <asp:TextBox ID="txtProjects" runat="server" CssClass="form-control"
                                TextMode="MultiLine" Rows="4"></asp:TextBox>
                        </div>

                    </div>

                    <div class="text-center mt-4">

                        <asp:Button ID="btnSave"
                            runat="server"
                            Text="💾 Save Resume"
                            CssClass="btn btn-success btn-lg me-2" />

                        <asp:Button ID="btnDownload"
                            runat="server"
                            Text="⬇️ Download Resume"
                            CssClass="btn btn-primary btn-lg" />

                        
                    </div>

                </div>

            </div>

        </div>
    </form>
</body>
</html>
