
$(document).ready(function () {
    $("#btnLogin").click(function () {
        Validation();
    });
});

function Validation() {
    var email = $("#txtLoginEmail").val().trim();
    var password = $("#txtLoginPassword").val();

    var flag = true;
    var regEmail = /^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$/;
    if (email == "") {
        $("#spLoginEmail").text("Email is required");
        flag = false;
    }
    else if (!regEmail.test(email)) {
        $("#spLoginEmail").text("Invalid Email");
        flag = false;
    }
    else {
        $("#spLoginEmail").text("");
    }

    if (password == "") {
        $("#spLoginPassword").text("Password is required");
        flag = false;
    }
    else {
        $("#spLoginPassword").text("");
    }
    if (flag == false)
        return false;

    Login();
}
function Login() {
    $.ajax({
        type: "POST",
        url: "Login.aspx/UserLogin",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        data: JSON.stringify({
            Email: $("#txtLoginEmail").val(),
            Password: $("#txtLoginPassword").val()
        }),
        success: function (response) {
            if (response.d == "Success") {
                alert("Login Successfully");
                window.location.href = "HomePage.aspx";
            }
            else {
                alert("Invalid Email or Password");
            }
        },
        error: function () {
            alert("Server Error");
        }
    });
}
