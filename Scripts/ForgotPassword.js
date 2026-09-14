
$(document).ready(function () {
    $("#btnSubmit").click(function (e) {
        e.preventDefault();
        var email = $("#txtEmail").val();
        if (email == "") {
            $("#spEmail").text("Enter Email");
            return;
        }
        $.ajax({
            type: "POST",
            url: "ForgotPassword.aspx/CheckEmail",
            data: JSON.stringify({ Email: email }),
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            success: function (response) {
                if (response.d == "Success") {
                    if (response.d == "Success") {
                        alert("OTP Sent");
                        $("#otpDiv").show();
                    }
                    else {
                        alert("Email not found");
                    }
                }
            }
        });
    });

    $("#btnVerifyOTP").click(function () {
        $.ajax({
            type: "POST",
            url: "ForgotPassword.aspx/VerifyOTP",
            data: JSON.stringify({ Email: $("#txtEmail").val(), OTP: $("#txtOTP").val() }),
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (response) {
                if (response.d == "Success") {
                        const btn = document.getElementById("btnVerifyOTP");
                        btn.innerHTML = "Verified ✓";
                        btn.classList.remove("btn-success");
                        btn.classList.add("btn-success");
                        btn.disabled = true; 

                    setTimeout(() => {
                        window.location.href = "ResetPassword.aspx?Email=" + encodeURIComponent($("#txtEmail").val());
                    }, 3000);
                    }
                    else {
                        alert("Email not found");
                    }               
            }
        });
    });

    $("#btnCancel").click(function () {
        window.location = "Login.aspx";
    });
 });
