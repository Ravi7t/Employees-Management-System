
$(document).ready(function () {
    console.log($("#btnDownloadProfile").length);
    LoadQualification();
    $("#btnDownloadProfile").click(function () {
        window.location = "DownloadProfile.aspx";
    });
    
    $("#btnUpdate").click(function () {
        
        UpdateProfile();
    });
});

function LoadQualification() {
    $.ajax({
        type: "POST",
        url: "EditProfile.aspx/GetQualification",
        contentType: "application/json; charset=utf-8",
        dataType: "json",

        success: function (response) {
            console.log(response);

            $("#tblQualification tbody").empty();

            $.each(response.d, function (i, item) {
                
                $("#tblQualification tbody").append(
                    "<tr>" +
                    "<td><input type='text' class='form-control qualification' value='" + item.Qualification + "'></td>" +
                    "<td><input type='text' class='form-control board' value='" + item.Board + "'></td>" +
                    "<td><input type='text' class='form-control year' value='" + item.Year + "'></td>" +
                    "<td><input type='text' class='form-control percentage' value='" + item.Percentage + "'></td>" +
                    "</tr>"
                );

            });

        },

        error: function (xhr) {
            console.log(xhr.responseText);
        }

    });

}


function UpdateProfile() {

    var hobbies = [];

    $("#divHobbies input:checked").each(function () {
        hobbies.push($(this).val());
    });
    var qualification = [];
    $("#tblQualification tbody tr").each(function () {
        qualification.push({
            Qualification: $(this).find(".qualification").val(),
            Board: $(this).find(".board").val(),
            Year: $(this).find(".year").val(),
            Percentage: $(this).find(".percentage").val()
        });
    });

    var user = {
        Name: $("#txtName").val(),
        Email: $("#txtEmail").val(),
        MobileNo: $("#txtMobile").val(),
        Gender: $("input[name='Gender']:checked").val(),
        Hobbies: hobbies.join(','),
        Religion: $("#ddlReligion").val(),
        DOB: $("#txtDOB").val(),
        Address: $("#txtAddress").val(),
        Password: $("#txtPassword").val(),
        UploadPhoto: "",
        UploadResume: "",
        Qualifications: qualification
        
    };

    // Photo Upload
    var fd = new FormData();
    if ($("#filePhoto")[0].files.length > 0) {
        fd.append("file", $("#filePhoto")[0].files[0]);

        $.ajax({
            url: "UploadPhoto.ashx",
            type: "POST",
            data: fd,
            processData: false,
            contentType: false,
            async: false,
            success: function (fileName) {
                user.UploadPhoto = fileName;
            }
        });
    }

    // Resume Upload
    var fdResume = new FormData();
    if ($("#fileResume")[0].files.length > 0) {
        fdResume.append("file", $("#fileResume")[0].files[0]);

        $.ajax({
            url: "UploadResume.ashx",
            type: "POST",
            data: fdResume,
            processData: false,
            contentType: false,
            async: false,
            success: function (fileName) {
                user.UploadResume = fileName;
            }
        });
    }

    $.ajax({
        type: "POST",
        url: "EditProfile.aspx/UpdateProfile",
        data: JSON.stringify({ user: user }),
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (response) {
            alert(response.d);
        },
        error: function (xhr) {
            alert(xhr.responseText);
        }
    });

}
$(document).on("contextmenu", function (e) {
    e.preventDefault();
});

