<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminEditUser.aspx.cs" Inherits="Assignment1_Assignment2.AdminEditUser" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Edit User</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet" />
</head>

<body style="background: #f4f7fb;">

    <form id="form1" runat="server">

        <div class="container py-5">

            <div class="card shadow-lg border-0">

                <div class="card-header bg-primary text-white">

                    <h3 class="mb-0">
                        <i class="bi bi-pencil-square"></i>
                        Edit User
</h3>

                </div>

                <div class="card-body">

                    <div class="row">

                        <div class="col-md-6 mb-3">

                            <label class="fw-bold">Name</label>

                            <asp:TextBox
                                ID="txtName"
                                runat="server"
                                CssClass="form-control">
                            </asp:TextBox>

                        </div>
                        <div class="col-md-6 mb-3">
                            <label class="fw-bold">Email</label>
                            <asp:TextBox
                                ID="txtEmail"
                                runat="server"
                                CssClass="form-control">
                                 </asp:TextBox>
                        </div>

                    </div>

                    <div class="row">

                        <div class="col-md-6 mb-3">

                            <label class="fw-bold">Mobile</label>

                            <asp:TextBox
                                ID="txtMobile"
                                runat="server"
                                CssClass="form-control">
                            </asp:TextBox>

                        </div>

                        <div class="col-md-6 mb-3">

                            <label class="fw-bold">Date Of Birth</label>

                            <asp:TextBox
                                ID="txtDOB"
                                runat="server"
                                TextMode="Date"
                                CssClass="form-control">
                             </asp:TextBox>
                        </div>

                    </div>

                    <div class="row">

                        <div class="col-md-6 mb-3">

                            <label class="fw-bold">Gender</label>

                            <asp:RadioButtonList
                                ID="rblGender"
                                runat="server"
                                RepeatDirection="Horizontal">
                            </asp:RadioButtonList>

                        </div>

                        <div class="col-md-6 mb-3">

                            <label class="fw-bold">Religion</label>

                            <asp:DropDownList
                                ID="ddlReligion"
                                runat="server"
                                CssClass="form-select">
                            </asp:DropDownList>

                        </div>

                    </div>

                    <div class="mb-3">

                        <label class="fw-bold">Hobbies</label>

                        <div class="border rounded p-3 bg-light">

                            <asp:CheckBoxList
                                ID="cblHobbies"
                                runat="server"
                                RepeatColumns="3">
                            </asp:CheckBoxList>

                        </div>

                    </div>

                    <div class="mb-3">

                        <label class="fw-bold">Address</label>

                        <asp:TextBox
                            ID="txtAddress"
                            runat="server"
                            TextMode="MultiLine"
                            Rows="3"
                            CssClass="form-control">
                        </asp:TextBox>
                        <div class="col-md-6">
                            <label class="fw-bold">Password</label>
                            <asp:TextBox
                                ID="txtPassword"
                                runat="server"
                                CssClass="form-control mb-3">
                               </asp:TextBox>

                        </div>

                    </div>
                    <div class="mb-3">
                        <label>Qualification</label>
                        <asp:TextBox ID="txtQualification" runat="server"
                            CssClass="form-control"></asp:TextBox>
                    </div>

                    <div class="mb-3">
                        <label>Board</label>
                        <asp:TextBox ID="txtBoard" runat="server"
                            CssClass="form-control"></asp:TextBox>
                    </div>

                    <div class="mb-3">
                        <label>Year</label>
                        <asp:TextBox ID="txtYear" runat="server"
                            CssClass="form-control"></asp:TextBox>
                    </div>

                    <div class="mb-3">
                        <label>Percentage</label>
                        <asp:TextBox ID="txtPercentage" runat="server"
                            CssClass="form-control"></asp:TextBox>
                    </div>

                    <hr />
                    <div class="text-center mt-4">

                        <asp:Button
                            ID="btnUpdate"
                            runat="server"
                            Text="💾 Update User"
                            CssClass="btn btn-success btn-lg px-5"
                            OnClick="btnUpdate_Click" />

                        <a href="AdminUsers.aspx"
                            class="btn btn-secondary btn-lg ms-2">← Back
    </a>

                    </div>

                </div>

            </div>

        </div>

    </form>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>

</html>
