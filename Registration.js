
$(document).ready(function () {
    $("#btnExport").click(function () {
        window.location.href = "ExportToExcel.aspx";
    }
    );
    $("#btnSubmit").click(function () {
       
        Validation();      
    });
    $("#btnAdd").click(function () {

        var row = "<tr>";

        row += "<td><input type='text' class='form-control txtQualification'></td>";

        row += "<td><input type='text' class='form-control txtBoard'></td>";

        row += "<td><input type='text' class='form-control txtYear' maxlength='4'></td>";

        row += "<td><input type='text' class='form-control txtPercentage'></td>";

        row += "<td>";

        row += "<button type='button' class='btn btn-danger btnRemove'>Remove</button>";

        row += "</td>";

        row += "</tr>";

        $("#tblQualification tbody").append(row);

    });
    $("#btnCancel").click(function () {
        ResetRegistrationForm();
    });
    $(document).on("click", ".btnRemove", function () {
        $(this).closest("tr").remove();
        $("#tblQualification tbody tr").each(function (index) {
            $(this).find("td:first").text(index + 1);
        });
        count = $("#tblQualification tbody tr").length + 1;
    });
    $("#btnShowPassword").click(function () {

        if ($("#txtPassword").attr("type") == "password") {
            $("#txtPassword").attr("type", "text");
            $(this).text("Hide");
        }
        else {
            $("#txtPassword").attr("type", "password");
            $(this).text("Show");
        }

    });

    $("#btnShowConfirmPassword").click(function () {

        if ($("#txtConfirmPassword").attr("type") == "password") {
            $("#txtConfirmPassword").attr("type", "text");
            $(this).text("Hide");
        }
        else {
            $("#txtConfirmPassword").attr("type", "password");
            $(this).text("Show");
        }

    });
});

var photoRemoved = false;
function RemovePhoto() {
    document.getElementById("filePhoto").value = "";
    document.getElementById("imgPreview").src = "";
    document.getElementById("imgPreview").style.display = "none";
    document.getElementById("btnRemovePhoto").style.display = "none";

    $("#spPhoto").text("");

    photoRemoved = true;
}
function Validation() {

    var flag = true;
    //---------- Name----------------------------
    var name = $("#txtName").val().trim();
    var regName = /^[A-Za-z ]+$/;

    if (name == "") {
        $("#spName").text("Name is required");
        flag = false;
    }
    else if (!regName.test(name)) {
        $("#spName").text("Only alphabets and whitespace are allowed");
        flag = false;
    }
    else {
        $("#spName").text("");
    }

    //--------- Email------------------------------
    var email = $("#txtEmail").val().trim();
    var regEmail = /^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$/;

    if (email == "") {
        $("#spEmail").text("Email is required");
        flag = false;
    }
    else if (!regEmail.test(email)) {
        $("#spEmail").text("Invalid Email");
        flag = false;
    }
    else {
        $("#spEmail").text("");
    }

    //--------------Mobile---------------------------
    var mobile = $("#txtMobile").val().trim();
    var regMobile = /^[1-9][0-9]{9}$/;

    if (mobile == "") {
        $("#spMobile").text("Mobile Number is required");
        flag = false;
    }
    else if (!regMobile.test(mobile)) {
        $("#spMobile").text("Enter valid 10 digit mobile number");
        flag = false;
    }
    else {
        $("#spMobile").text("");
    }

    // Gender
    if ($("input[name='Gender']:checked").length == 0) {
        $("#spGender").text("Select Gender");
        flag = false;
    }
    else {
        $("#spGender").text("");
    }

    // Hobbies
    if ($("#divHobbies input:checked").length == 0) {
        $("#spHobbies").text("Select at least one hobby");
        flag = false;
    }
    else {
        $("#spHobbies").text("");
    }

    // Religion
    if ($("#ddlReligion").val() == "") {
        $("#spReligion").text("Select Religion");
        flag = false;
    }
    else {
        $("#spReligion").text("");
    }

    //Dob Validation ==============

    // DOB
    var dob = $("#txtDOB").val();

    if (dob == "") {
        $("#spDOB").text("Select Date Of Birth");
        flag = false;
    }
    else {

        var birth = new Date(dob);
        var today = new Date();

        var age = today.getFullYear() - birth.getFullYear();

        var m = today.getMonth() - birth.getMonth();

        if (m < 0 || (m == 0 && today.getDate() < birth.getDate()))
            age--;

        $("#txtAge").val(age);

        if (age < 18) {
            $("#spDOB").text("Age should be 18 years or above");
            flag = false;
        }
        else {
            $("#spDOB").text("");
        }
    }

    // Address
    var Address = $("#txtAddress").val().trim();
    var regAddress= /^[A-Za-z0-9\s,.\-/#]{5,200}$/;


    if (Address == "") {
        $("#txtAddress").text("Address is required");
        flag = false;
    }
    else if (!regName.test(Address)) {
        $("#spAddress").text("Address should be multiple text area");
        flag = false;
    }
    else {
        $("#spAddress").text("");
    }

   
    // Photo
    var photo = $("#filePhoto").val();

    if (photo == "") {
        if (!photoRemoved) { 
        $("#spPhoto").text("Select Photo");
        flag = false;
        }
    }
    else {
        var ext = photo.split('.').pop().toLowerCase();

        if ($.inArray(ext, ['jpg', 'jpeg', 'png', 'gif']) == -1) {
            $("#spPhoto").text("Only jpg, jpeg, png, gif allowed");
            flag = false;
        }
        else {
            var size = $("#filePhoto")[0].files[0].size;

            if (size > 2097152) {
                $("#spPhoto").text("Photo size must be less than 2 MB");
                flag = false;
            }
            else {
                $("#spPhoto").text("");
            }
        }
    }

    // Resume
    var resume = $("#fileResume").val();

    if (resume == "") {
        $("#spResume").text("Select Resume");
        flag = false;
    }
    else {

        var ext = resume.split('.').pop().toLowerCase();

        if ($.inArray(ext, ['doc', 'docx', 'pdf']) == -1) {
            $("#spResume").text("Only doc, docx, pdf allowed");
            flag = false;
        }
        else {

            var size = $("#fileResume")[0].files[0].size;

            if (size > 2097152) {
                $("#spResume").text("Resume size must be less than 2 MB");
                flag = false;
            }
            else {
                $("#spResume").text("");
            }
        }
    }

     //Qualification
    if ($("#tblQualification tbody tr").length == 0) {
        $("#spQualification").text("Please Add Qualification");
        flag = false;
    }
    else {
        $("#spQualification").text("");
    }


    if (flag == false) {
        return false;
    } else {
        SaveRegistration();
    }
}
function SaveRegistration() {
    
    var hobbies = [];

    $("#divHobbies input:checked").each(function () {

        hobbies.push($(this).val());

    });
    var qualification = [];

    $("#tblQualification tbody tr").each(function () {
        qualification.push({
            Qualification: $(this).find(".txtQualification").val(),
            Board: $(this).find(".txtBoard").val(),
            Year: $(this).find(".txtYear").val(),
            Percentage: $(this).find(".txtPercentage").val()
        });
    });

    var userRegistration = {
        Name: $("#txtName").val(),
        Email: $("#txtEmail").val(),
        MobileNo: $("#txtMobile").val(),
        Gender: $("input[name='Gender']:checked").val(),
        Hobbies: hobbies.join(','),
        Religion: $("#ddlReligion").val(),
        DOB: $("#txtDOB").val(),
        Address: $("#txtAddress").val(),
        Password: $("#txtPassword").val(),
        Qualifications: qualification,
        Uploadphoto: "",
        UploadResume: "",
        



        
    };
    var fd = new FormData();
    fd.append("file", $("#filePhoto")[0].files[0]);
    var photo = $("#filePhoto")[0].files[0];

    $.ajax({
        url: "UploadPhoto.ashx",
        type: "POST",
        data: fd,
        processData: false,
        contentType: false,
        async: false,
        success: function (fileName) {
            userRegistration.Uploadphoto = fileName;
        }


    });
        var fdResume = new FormData();
    fdResume.append("file", $("#fileResume")[0].files[0]);

    $.ajax({
        url: "UploadResume.ashx",
        type: "POST",
        data: fdResume,
        processData: false,
        contentType: false,
        async: false,
        success: function (fileName) {
            userRegistration.UploadResume = fileName;
            
        }
    });
    
    $.ajax({
        type: "POST",
        url: "Registration.aspx/SaveRegistration",
        data: JSON.stringify({ reg: userRegistration }),
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (response) {
            alert("Saved Successfully");
            location.reload();
        },
        error: function () {
            alert("Error");
        }
    });
}




function ResetRegistrationForm() {
    
    $("#frmRegistration")[0].reset();

    $("span").text("");

    $("#txtAge").val("");

    $("#imgPreview").hide();

    $("#tblQualification tbody").empty();

    $("#divGender input").prop("checked", false);

    $("#divHobbies input").prop("checked", false);

    $("#ddlReligion").prop("selectedIndex", 0);
}

//====================================================================
$("#fileResume").change(function () {
    var file = this.files[0];
    if (file) {
        $("#spResume").text(file.name);
        $("#btnRemoveResume").show();
    }
});
function RemoveResume() {
    $("#fileResume").val("");
    $("#spResume").text("");
    $("#btnRemoveResume").hide();
}
$("#fileResume").change(function () {
    if ($(this).val() != "") {
        $("#btnRemoveResume").show();
    }
});
function onlyCharacters(e) {
    var key = e.which || e.keyCode;
    var ch = String.fromCharCode(key);

    var regex = /^[A-Za-z ]$/;

    if (regex.test(ch) || key == 8 || key == 9 || key == 13) {
        $("#spName").text("");
        return true;
    }
    $("#spName").text("Only alphabets and whitespace are allowed");
    return false;
}

function ValidateEmail(e) {
    
    var email = document.getElementById("txtEmail").value;
    var regex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[A-Za-z]{2,}$/;
    if (regex.test(email)) {
        $("#spEmail").text("");
    } else {
        $("#spEmail").text("Email as a form of abc@.com");
    }
}

function ValidateMobile(e) {

    var mobile = document.getElementById("txtMobile").value;
    var regex = /^[6-9][0-9]{9}$/;
    if (regex.test(mobile)) {
        $("#spMobile").text("");
    } else {
        $("#spMobile").text("Mobile Number should be 10 digit");
    }
}

function validateReligion() {
    var ddlReligion = document.getElementById("ddlReligion");
    var spReligion = document.getElementById("spReligion");

    if (ddlReligion.value == "") {
        spReligion.innerHTML = "Please select Religion.";
    ddlReligion.focus();
    return false;
    } else {
        spReligion.innerHTML = "";
    return true;
    }
}
function validateAge() {

    var dob = $("#txtDOB").val();

    if (dob == "") {
        $("#spDOB").text("Select Date of Birth");
        return false;
    }

    var birth = new Date(dob);
    var today = new Date();

    var age = today.getFullYear() - birth.getFullYear();
    var month = today.getMonth() - birth.getMonth();

    if (month < 0 || (month == 0 && today.getDate() < birth.getDate())) {
        age--;
    }

    $("#txtAge").val(age);

    if (age < 18) {
        $("#spDOB").text("Age should be 18 years or above");
        $("#spDOB").css("color", "red");
        return false;
    }
    else {
        $("#spDOB").text("");
        return true;
    }
}
function ValidateAddress(e) {

    var Address = document.getElementById("txtAddress").value;
    var regex = /^[A-Za-z0-9\s,.\-/#]{5,200}$/;
    if (regex.test(Address)) {
        $("#spAddress").text("");
    } else {
        $("#spAddress").text("Address should be in multiple text");
    }
}
function validatePassword() {
    var password = document.getElementById("txtPassword").value;

    var regex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&]).{8,}$/;

    if (regex.test(password)) {
        document.getElementById("spPassword").innerHTML = "✔";
        document.getElementById("spPassword").style.color = "green";
    } else {
        document.getElementById("spPassword").innerHTML =
            "✖ Password must contain 8+ characters, uppercase, lowercase, number and special character.";
        document.getElementById("spPassword").style.color = "red";
    }
}
function checkConfirmPassword() {
    var password = document.getElementById("txtPassword").value;
    var confirmPassword = document.getElementById("txtConfirmPassword").value;

    if (confirmPassword === "") {
        document.getElementById("spConfirmPassword").innerHTML = "";
    }
    else if (password === confirmPassword) {
        document.getElementById("spConfirmPassword").innerHTML = "✔ Password Matched";
        document.getElementById("spConfirmPassword").style.color = "green";
    }
    else {
        document.getElementById("spConfirmPassword").innerHTML = "✖ Password Not Matched";
        document.getElementById("spConfirmPassword").style.color = "red";
    }
}

function validatePhoto() {
    photoRemoved = false;

    var file = document.getElementById("filePhoto").value;

    if (file == "") {
        document.getElementById("spPhoto").innerHTML = "* Please Select Photo";
        document.getElementById("spPhoto").style.color = "red";
        return false;
    }

    var regex = /\.(jpg|jpeg|png|gif)$/i;

    if (regex.test(file)) {
        document.getElementById("spPhoto").innerHTML = "✔️ Valid Photo";
        document.getElementById("spPhoto").style.color = "green";
    }
    else {
        document.getElementById("spPhoto").innerHTML = "* Only JPG, JPEG, PNG, GIF allowed";
        document.getElementById("spPhoto").style.color = "red";
        document.getElementById("filePhoto").value = "";
    }
}
function previewPhoto() {

    var file = document.getElementById("filePhoto").files[0];

    if (file) {

        var reader = new FileReader();

        reader.onload = function (e) {

            document.getElementById("imgPreview").src = e.target.result;
            $("#btnRemovePhoto").show();
            document.getElementById("imgPreview").style.display = "block";

        };

        reader.readAsDataURL(file);
    }
}

function validateResume() {

    var file = document.getElementById("fileResume");
    var btn = document.getElementById("btnRemoveResume");

    if (file.files.length > 0) {
        btn.style.display = "inline-block";
    }
    else {
        btn.style.display = "none";
    }

    var filename = file.value;

    var regex = /\.(pdf|doc|docx)$/i;

    if (regex.test(filename)) {
        document.getElementById("spResume").innerHTML = "✔️ Valid Resume";
        document.getElementById("spResume").style.color = "green";
    }
    else {
        document.getElementById("spResume").innerHTML = "* Only PDF, DOC and DOCX files are allowed.";
        document.getElementById("spResume").style.color = "red";
        file.value = "";
    }
}
$(document).on("input blur", ".txtQualification", function () {

    var value = $(this).val().trim();

    if (/^[A-Za-z ]+$/.test(value)) {
        $("#spQualification").text("");
    } else {
        $("#spQualification").text("Enter valid Qualification");
    }

});

$(document).on("input blur", ".txtBoard", function () {

    var value = $(this).val().trim();

    if (/^[A-Za-z ]+$/.test(value)) {
        $("#spQualification").text("");
    } else {
        $("#spQualification").text("Enter valid Board");
    }

});

$(document).on("input blur", ".txtYear", function () {

    var value = $(this).val().trim();

    if (/^(19|20)\d{2}$/.test(value)) {
        $("#spQualification").text("");
    } else {
        $("#spQualification").text("Enter valid Year");
    }

});

$(document).on("input blur", ".txtPercentage", function () {

    var value = $(this).val().trim();

    if (/^(100|[1-9]?[0-9](\.[0-9]{1,2})?)$/.test(value)) {
        $("#spQualification").text("");
    } else {
        $("#spQualification").text("Enter valid Percentage");
    }

});