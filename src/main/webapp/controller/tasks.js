//Tasks Ajax Calls
$(function () {

    $("#save").click(addTask);
    $("#cancel").click(onCancel);
    $("#datatable-responsive2").on('click', '.edit', onUpdate);
    $("#datatable-responsive2").on('click', '#changestatus', onChangeStatus);

    $("#datatable-responsive2").on('click', '.completed', onMarkDone);
    getTasks();
});

function addTask() {
    var id = $("#id").val();

    var name = $("#name").val();
    var category = $("#category").val();
    var priority = $("#priority").val();
    var user = $("#user").val();
    var team = $("#team").val();
    var dueDate = $("#duedate").val();

    $('#ajax-loader').show();

    if (id) {
        $.ajax("tasks", {
            "type": "post",
            "data": {
                "Name": name,
                "Category": category,
                "Priority": priority,
                "DueDate": dueDate,
                "AssignTo": user != null ? user : "",
                "AssignTeam": team != null ? team : ""
            }
        }).done(function (response) {

            getTasks();
//            new PNotify({
//                title: 'Added Successsfully',
//                text: 'Task Added!',
//                type: 'success',
//                styling: 'bootstrap3'
//            });
            alert("Added");
        }).always(function () {
            $('#ajax-loader').hide();
        });
    } else {
        $.ajax("updatetask", {
            "type": "post",
            "data": {
                "Id": id,
                "Name": name,
                "Category": category,
                "Priority": priority,
                "DueDate": dueDate,
                "AssignTo": user != null ? user : "",
                "AssignTeam": team != null ? team : ""
            }
        }).done(function (response) {
            getTasks();
            alert("Updated");
        }).always(function () {
            $('#ajax-loader').hide();
        });
    }


}

function getTasks() {
    $('#ajax-loader').show();
    $.get("tasks").done(function (response) {
        var taskList = response;
        $("#datatable-responsive2").find('tbody').find("tr").remove();
        $.each(taskList, function (index, task) {
            let diff = onOverDue(task.DueDate);
            let status = diff == true ? "" : "hidden";
            let prior = task.Priority == 1 ? "LOW" : task.Priority == 2 ? "MEDIUM" : "HIGH";
            $("#datatable-responsive2").find('tbody').append(
                ' <tr>\n' +
                '                      <td>' + task.Name + '</td>\n' +
                '                      <td>' + task.DueDate + '</td>\n' +
                '                      <td>' + task.Category + '</td>\n' +
                '                      <td>\n' +
                '                        <button type="button" data-id="status" id="status" class="btn btn-success btn-xs">' + task.Status + '</button>\n' +
                '                        <button type="button" id="complete" class="'+status+' btn btn-warning btn-xs">OVERDUE</button> \n' +
                '                      </td>\n' +
                '                      <td><button type="button" class="btn btn-warning btn-xs">' + prior + '</button></td>\n' +
                '                      <td>' + task.AssignedTo + '</td>\n' +
                '                      <td>' + task.AssignedToTeam + '</td>\n' +
                '                      <td>\n' +
                '                        <button type="button" data-id="' + task.TaskID
                + '" data-name="' + task.Name
                + '" data-category="' + task.Category
                + '" data-priority="' + task.Priority
                + '" data-duedate="' + task.DueDate
                + '" data-assignto="' + task.AssignedTo
                + '" data-assigntoteam="' + task.AssignedToTeam
                + '" class="edit btn btn-info btn-xs"><i class="fa fa-pencil"></i> Edit </button>\n' +
                '                        <button type="button" data-id="' + task.TaskID + '" class="btn btn-danger btn-xs"><i class="fa fa-trash-o"></i> Delete </button>\n' +
                '                        <button type="button" data-id="' + task.TaskID + '" id="changestatus" class="btn btn-warning btn-xs"><i class="fa fa-trash-o"></i> Mark as Done </button>\n' +
                '                      </td>\n' +
                '                    </tr>'
            )
        });
        $("#datatable-responsive2").DataTable();

    }).always(function () {
        $('#ajax-loader').hide();
    });
}

function getAllUsers() {
    $.get("users").done();

}

function getAllTeams() {
    $.get("teams").done();

}

function onUpdate(evt) {
    let id = $(this).attr("data-id");
    let name = $(this).attr("data-name");
    let category = $(this).attr("data-category");
    let priority = $(this).attr("data-priority");
    let duedate = $(this).attr("data-duedate");
    let assignto = $(this).attr("data-assignto");
    let assigntoteam = $(this).attr("data-assigntoteam");

    $('#id').val(id);
    $('#category').val(category);
    $('#priority').val(priority);
    $('#user').val(assignto);
    $('#team').val(assigntoteam);
    $('#duedate').val(duedate);
    $('#name').val(name).focus();


}

function onCancel() {
    $('#id').val("");
    $('#category').val("");
    $('#priority').val("");
    $('#user').val("");
    $('#team').val("");
    $('#duedate').val("");
    $('#name').val("");
}

function onChangeStatus() {
    let id = $(this).attr("data-id");
    // alert("onChangeStatus Called " + id);

}

function onOverDue(due) {

    let q = new Date();
    let m = q.getMonth() + 1;
    let d = q.getDay();
    let y = q.getFullYear();
    let today = new Date(y, m, d);
    // let  mydate=new Date('2011-04-11');


    let dueDate = new Date(due);
    if (today > dueDate)
        return true;
    return false;


}

function onMarkDone() {
    $('#status').val("COMPLETED");

    let hidden = true;

    hidden = !hidden;
    if (hidden) {
        $('#complete').style.display = 'inline';
        // $('#status').style.display('inline');
    } else {
        $('#complete').style.display = 'none';
    }

    //send to database ??


}

