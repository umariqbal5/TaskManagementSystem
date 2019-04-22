$(function() {

    $("#save").click(addUser);
    getUsers();
});

function getUsers(){
    $('#ajax-loader').show();
    $.ajax("users", {
        "type": "get"
    }).done(displayGuests)
        .fail(displayfail)
       .always(function() {
    $('#ajax-loader').hide();
     });

}
function displayGuests(data) {

    var object = $.parseJSON(data);
    $("#datatable-responsive2").find('tbody').find("tr").remove();
    $.each(object, function (index, value) {

        $("#datatable-responsive2").find('tbody').append("<tr data-id=" + value.userId + "><td>" + value.userId + "</td><td>" + value.userName + "</td><td>" + value.fullName + "</td><td>" + value.gender + "</td><td>" + value.state + "</td><td>" + value.city + "</td><td>" + value.street + "</td><td>" + value.zipCode + "</td><td>" + value.birthDate + "</td><td>" + value.email + "</td>    <td><a href=\"#\" class=\"btn btn-info btn-xs\"><i class=\"fa fa-pencil\"></i> Edit </a><a href=\"#\" class=\"btn btn-danger btn-xs\"><i class=\"fa fa-trash-o\"></i> Delete </a></td></tr>");
    });
    $("#datatable-responsive2").DataTable();
}
function displayfail() {

    alert("Something Wrong");
}


function addUser(){
    var UserName = $("#userName").val();
    var Password = $("#password").val();
    var FullName = $("#fullName").val();
    var gender = $("#gender").val();
    var Country = $("#country").val();
    var State = $("#state").val();
    var City=$("#city").val();
    var Role = $('#role').val();
var birthdate=$("#birthdate").val()

    $('#ajax-loader').show();
    $.ajax("users", {
        "type": "post",
        "data": {
            "userName": UserName,
            "password": Password,
            "fullName":FullName,
            "gender": gender,
            "country": Country,
            "state": State,
            "city": City,
            "birthDate" :birthdate,
            "role" : Role
        }
    }).done(function (){

        getUsers();

        alert("Added");
    }).always(function() {
        $('#ajax-loader').hide();
    });

}

