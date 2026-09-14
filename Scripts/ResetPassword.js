$(document).ready(function () {

    $("#btnSubmit").click(function () {
        var password = $("#txtPassword").val();
        var confirm = $("#txtConfirmPassword").val();
        const email = new URLSearchParams(window.location.search).get("Email");
       
        if (password == "") {
            $("#spPassword").text("Enter Password");
            return;
        }

        if (confirm == "") {
            $("#spConfirmPassword").text("Enter Confirm Password");
            return;
        }

        if (password != confirm) {
            alert("Password and Confirm Password do not match");
            return;
        }

        $.ajax({

            type: "POST",

            url: "ResetPassword.aspx/UpdatePassword",

            data: JSON.stringify({
                Email: email,
                Password: password
            }),

            contentType: "application/json;charset=utf-8",

            dataType: "json",

            success: function (response) {

                if (response.d == "Success") {

                    alert("Password Updated Successfully");

                    window.location = "Login.aspx";
                }
                else {

                    alert("Failed");

                }

            }

        });

    });

    $("#btnCancel").click(function () {

        window.location = "Login.aspx";

    });

});