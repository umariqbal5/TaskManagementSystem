//Tasks Ajax Calls
$(function() {
	
    $("#save").click(addTask);
    

    getTasks();
});

function addTask(){
    var name = $("#name").val();
    var category = $("#category").val();
    var priority = $("#priority").val();
    var user = $("#user").val();
    var team = $("#team").val();
    var dueDate = $("#duedate").val();
    
    $('#ajax-loader').show();

    $.ajax("tasks", {
        "type": "post",
        "data": {
            "Name": name,
            "Category": category,
            "Priority":priority,
            "DueDate": dueDate,
            "AssignTo": user!=null?user:"",
            "AssignTeam": team!=null?team:""
        }
    }).done(function (response){

        getTasks();
//        new PNotify({
//            title: 'Added Successsfully',
//            text: 'Task Added!',
//            type: 'success',
//            styling: 'bootstrap3'
//        });
        alert("Added");
    }).always(function() {
    	$('#ajax-loader').hide();
    });

}

function getTasks(){
	$('#ajax-loader').show();
    $.get("tasks").done(function(response){
        var taskList = response;

        console.log(taskList);
        $("#datatable-responsive2").find('tbody').find("tr").remove();
        $.each(taskList, function(index, task){
        	$("#datatable-responsive2").find('tbody').append(
                ' <tr>\n' +
                '                      <td>'+task.Name+'</td>\n' +
                '                      <td>'+task.DueDate+'</td>\n' +
                '                      <td>'+task.Category+'</td>\n' +
                '                      <td>\n' +
                '                        <button type="button" class="btn btn-success btn-xs">'+task.Status+'</button>\n' +
                '                      </td>\n' +
                '                      <td>'+task.Priority+'</td>\n' +
                '                      <td>'+task.AssignedTo+'</td>\n' +
                '                      <td>'+task.AssignedToTeam+'</td>\n' +
                '                      <td>\n' +
                '                        <a href="#" data-id="'+task.TaskID+'" class="btn btn-info btn-xs"><i class="fa fa-pencil"></i> Edit </a>\n' +
                '                        <a href="#" class="btn btn-danger btn-xs"><i class="fa fa-trash-o"></i> Delete </a>\n' +
                '                      </td>\n' +
                '                    </tr>'
            )
        });
        $("#datatable-responsive2").DataTable();
        
    }).always(function() {
    	$('#ajax-loader').hide();
    });
}

function getAllUsers() {
    $.get("users").done();

}

function getAllTeams() {
    $.get("teams").done();

}