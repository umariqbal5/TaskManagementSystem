$(function() {

    $("#datatable-responsive2").on('click','.edit',onUpdate);
    $("#datatable-responsive2").on('click','#btnDelete',deleteUser);
   // $("#clear").on('click');
    $("#save").click(addUser);
    $("#cancel").click(onCancel);
    getUsers();
});

function onCancel(){
    $('#userId').val("");
    $('#userName').val("");
    $('#password').val("");
    $('#fullName').val("");

}
function onUpdate(){
    let userid = $(this).attr("data-id");
    let username = $(this).attr("data-name");
    let fullname = $(this).attr("data-fullName");
    let gender = $(this).attr("data-gender");
    let state = $(this).attr("data-states");
    let city = $(this).attr("data-city");
    let street = $(this).attr("data-street");
    let zipcode = $(this).attr("data-zipcode");
    let birthdate = $(this).attr("data-birthdate");
    let email = $(this).attr("data-email");
    let role = $(this).attr("data-role");

    $('#userId').val(userid);
    $('#userName').val(username);
    $('#fullName').val(fullname);
    $('#gender').val(gender);
    $('#state').val(state);
    $('#city').val(city);
    $('#role').val(role);
    $('#birthdate').val(birthdate);
console.log("onscreen"+ $('#userName').val());
    console.log("notonscreen"+username);
}




function deleteUser(){

    let userid = $(this).attr("data-id");

    swal({
        title: "Are you sure?",
        text: "Once deleted, you will not be able to recover this imaginary file!",
        icon: "warning",
        buttons: true,
        dangerMode: true,
    })
        .then((willDelete) => {
        if (willDelete) {

            $('#ajax-loader').show();
            $.ajax("deleteuser", {
                "type": "post",
                "data": {
                    "userId": userid
                }
            }).done(function (response) {
                getUsers();
                swal("Poof! Your User Account has been deleted!", {
                        icon: "success",
                    }
                );
            }).fail(function () {
                swal("Your imaginary file is safe!");
            }).always(function () {
                $('#ajax-loader').hide();
            });
}
});}
    //     .then(willDelete) => {
    //     if(willDelete) {
    //
    //     }
    // };
    // }


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


        console.log(value.role);
        $("#datatable-responsive2").find('tbody').append("<tr data-id=" + value.userId + "><td>" + value.userId + "</td><td >" + value.userName + "</td><td data-fullName=" + value.fullName + " >" + value.fullName + "</td>   <td data-role=" + value.role + " >" + value.role + "</td>   <td><button data-role=" + value.role + "  data-name="+ value.userName +"  data-fullName=" + value.fullName + "  data-id=" + value.userId + " class=\"edit btn btn-info btn-xs\"><i class=\"fa fa-pencil\"></i> Edit </button><button type='button' data-role=" + value.role + "  data-name="+ value.userName +" data-fullName="+ value.fullName +"   data-id="+ value.userId +" id=\"btnDelete\"  class=\"btn btn-danger btn-xs\"><i class=\"fa fa-trash-o\"></i> Delete </button></td></tr>");
    });
    $("#datatable-responsive2").DataTable();
}
function displayfail() {

    swal("Sorry", "Something went wrong", "error");
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

        swal("Perfect!", "Your User is updated!", "success");
        getUsers();
    }).always(function() {
        $('#ajax-loader').hide();
    });

}

