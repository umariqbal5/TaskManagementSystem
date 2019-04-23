$(function() {

    $("#save").click(addTeams);
    $("#datatable-responsive2").on('click','.edit',onUpdate);
    $("#datatable-responsive2").on('click','#btnDelete',deleteTeam);
    getUsers();
   getTeams();
});


function showTeams(data) {

    var object = $.parseJSON(data);
    $("#datatable-responsive2").find('tbody').find("tr").remove();
    $.each(object, function (index, value) {

        $("#datatable-responsive2").find('tbody').append("<tr  data-id=" + value.teamid + "><td>" + value.teamid + "</td><td>" + value.teamname + "</td> <td data-desc=" + value.teamdescription +">" + value.teamdescription + "</td> <td><button type='button' data-desc=" + value.teamdescription +"  data-id=" + value.teamid + " data-name=" + value.teamname + " class=\"edit btn btn-info btn-xs\"><i class=\"fa fa-pencil\"></i> Edit </button><button   data-id=" + value.teamid + " id=\"btnDelete\" class=\"btn btn-danger btn-xs\"><i class=\"fa fa-trash-o\"></i> Delete </button></td></tr>");
    });
    $("#datatable-responsive2").DataTable();
}

function showTeamsfail() {

    swal("Sorry", "Something went wrong", "error");
}





function getTeams() {
    $('#ajax-loader').show();
    $.ajax("teams", {
        "type": "get"
    }).done(showTeams)
        .fail(showTeamsfail)
        .always(function () {
            $('#ajax-loader').hide();
        });

}



function displayGuests(data) {

    var object = $.parseJSON(data);
    // $("#datatable-responsive2").find('tbody').find("tr").remove();
    $.each(object, function (index, value) {

        $("#selectusers").append("<option data-id=" + value.userId + " id=" + value.userId + ">" + value.fullName + "</option>");
    });
    $("#datatable-responsive2").DataTable();
}

function displayfail() {

    swal("Sorry", "Something went wrong", "error");
}


function getUsers() {
    $('#ajax-loader').show();
    $.ajax("users", {
        "type": "get"
    }).done(displayGuests)
        .fail(displayfail)
        .always(function () {
            $('#ajax-loader').hide();
        });
}

function deleteTeam() {

    let teamid = $(this).attr("data-id");
    console.log(teamid);

    swal({
        title: "Are you sure?",
        text: "Once deleted, you will not be able to recover this Team file!",
        icon: "warning",
        buttons: true,
        dangerMode: true,
    })
        .then((willDelete) => {
            if (willDelete) {

                $('#ajax-loader').show();
                $.ajax("deleteteam", {
                    "type": "post",
                    "data": {
                        "teamId": teamid
                    }
                }).done(function (response) {
                    getTeams();
                    swal("Poof! Your Team  has been deleted!", {
                            icon: "success",
                        }
                    );
                }).fail(function () {
                    swal("Your Team  file is safe!");
                }).always(function () {
                    $('#ajax-loader').hide();
                });
            }
        });
}
function addTeams() {
    var TeamName = $("#teamname").val();
    var Description = $("#teamdesc").val();
    var usersteams = [];
    var TeamUsers1 = $("#selectusers").val();


    var x = document.getElementById("selectusers");
    var xx = document.getElementById("selectusers").options.length;
    for (let i = 0; i < xx; i++) {

        if (x.options[i].selected) {

            usersteams[usersteams.length] = x.options[i].id;
        }
        console.log(x.options[i].id);



    }

    console.log(usersteams.toString());

    $('#ajax-loader').show();
    $.ajax("teams", {
        "type": "post",
        "data": {
            "teamName": TeamName,
            "description": Description,
            "teamusers[]": usersteams,

        }
    }).done(function () {

        swal("Perfect!", "Your Team is updated!", "success");
        getTeams();


    }).always(function () {
        $('#ajax-loader').hide();
    });

}


function onUpdate() {
    let teamid = $(this).attr("data-id");
    let teamname = $(this).attr("data-name");
    let description = $(this).attr("data-desc");
    var usersteams = [];
    var TeamUsers1 = $("#selectusers").val();


    var x = document.getElementById("selectusers");
    var xx = document.getElementById("selectusers").options.length;
    for (let i = 0; i < xx; i++) {

        if (x.options[i].selected) {

            usersteams[usersteams.length] = x.options[i].id;
        }
        console.log(x.options[i].id);


        $('#Teamid').val(teamid);
        $('#teamname').val(teamname);
        $('#teamdesc').val(description);

    }



}