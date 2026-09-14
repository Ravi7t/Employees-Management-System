<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Assignment1_Assignment2.Login" %>

<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body class="bg-light">

    <div class="container py-5">
        <div class="row justify-content-center">
            <div class="col-lg-5 col-md-6">

                <div class="card shadow-lg rounded-4">

                    <div class="card-header bg-primary text-white text-center py-3">
                        <h2 class="mb-0">Login</h2>
                    </div>

                    <div class="card-body p-4">

                        <form id="frmLogin">

                            <!-- Email -->
                            <div class="mb-3">
                                <label class="form-label">
                                    Email <span class="text-danger">*</span>
                                </label>

                                <input type="text"
                                    id="txtLoginEmail"
                                    class="form-control"
                                    placeholder="Enter Email">

                                <span id="spLoginEmail" class="text-danger"></span>
                            </div>

                            <!-- Password -->
                            <div class="mb-3">
                                <label class="form-label">
                                    Password <span class="text-danger">*</span>
                                </label>

                                <input type="password"
                                    id="txtLoginPassword"
                                    class="form-control"
                                    placeholder="Enter Password">

                                <span id="spLoginPassword" class="text-danger"></span>
                            </div>

                            <!-- Remember Me -->
                            <div class="form-check mb-3">
                                <input class="form-check-input"
                                    type="checkbox"
                                    id="chkRememberMe">

                                <label class="form-check-label" for="chkRememberMe">
                                    Remember Me
                                </label>
                            </div>

                            <!-- Forgot Password -->
                            <div class="text-end mb-4">
                                <a href="ForgotPassword.aspx" id="lnkForgotPassword">
                                    Forgot Password?
                                </a>
                            </div>

                            <!-- Buttons -->
                            <div class="d-grid gap-2 d-md-flex justify-content-center mb-4">

                                <button type="button"
                                    id="btnLogin"
                                    class="btn btn-success px-4">
                                    Login
                                </button>

                                <button type="reset"
                                    id="btnCancel"
                                    class="btn btn-danger px-4">
                                    Cancel
                                </button>

                            </div>

                            <!-- Signup -->
                            <div class="text-center">
                                <p class="mb-0">
                                    Don't Have An Account?
                                    <a href="Registration.aspx" id="lnkSignup">
                                        Sign Up
                                    </a>
                                </p>
                            </div>

                        </form>

                    </div>

                </div>

            </div>
        </div>
    </div>

</body>
</html>

<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script src="Scripts/Login.js"></script>

