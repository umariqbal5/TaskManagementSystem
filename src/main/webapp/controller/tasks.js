//Tasks Ajax Calls
$(function() {
	
    $("#save").click(addTask);
    $("#datatable-responsive2").on('click','.edit',onUpdate);
    

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

//        console.log(taskList);
        $("#datatable-responsive2").find('tbody').find("tr").remove();
        $.each(taskList, function(index, task){
        	let prior = task.Priority==1?"LOW":task.Priority==2?"MEDIUM":"HIGH";
        	$("#datatable-responsive2").find('tbody').append(
                ' <tr>\n' +
                '                      <td>'+task.Name+'</td>\n' +
                '                      <td>'+task.DueDate+'</td>\n' +
                '                      <td>'+task.Category+'</td>\n' +
                '                      <td>\n' +
                '                        <button type="button" class="btn btn-success btn-xs">'+task.Status+'</button>\n' +
                '                      </td>\n' +
                '                      <td><button type="button" class="btn btn-warning btn-xs">'+prior+'</button></td>\n' +
                '                      <td>'+task.AssignedTo+'</td>\n' +
                '                      <td>'+task.AssignedToTeam+'</td>\n' +
                '                      <td>\n' +
                '                        <button type="button" data-id="'+task.TaskID
                +'" data-name="'+task.Name
                +'" data-category="'+task.Category
                +'" data-priority="'+task.Priority 
                +'" class="edit btn btn-info btn-xs"><i class="fa fa-pencil"></i> Edit </button>\n' +
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

function onUpdate(evt){
//	alert($(this).attr("data-id"));
	let name = $(this).attr("data-name");
	let category = $(this).attr("data-category");
	let priority = $(this).attr("data-priority");
	
	$('#category').val(category);
	$('#priority').val(priority);
	$('#name').val(name).focus();
	
	
	
}