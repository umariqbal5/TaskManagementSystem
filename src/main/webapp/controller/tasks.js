//Tasks Ajax Calls
$(function() {
	
    $("#save").click(addTask);
    $("#cancel").click(onCancel);
    $("#datatable-responsive2").on('click','.edit',onUpdate);
    $("#datatable-responsive2").on('click','#changestatus',onChangeStatus);
    $("#datatable-responsive2").on('click','#btnDelete',deleteTask);
    
   
    getTasks();
});

function addTask(){
	var id = $("#id").val();
	
    var name = $("#name").val();
    var category = $("#category").children("option:selected").val();
    var priority = $("#priority").children("option:selected").val();
    var user = $("#user").children("option:selected").val();
    var team = $("#team").children("option:selected").val();
    var dueDate = $("#duedate").val();
    
    $('#ajax-loader').show();

    if(!id){
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
            new PNotify({
                title: 'Added Successsfully',
                text: 'Task Added!',
                type: 'success',
                styling: 'bootstrap3'
            });
            
        }).always(function() {
        	$('#ajax-loader').hide();
        });
    }else{
    	$.ajax("updatetask", {
            "type": "post",
            "data": {
            	"Id": id,
                "Name": name,
                "Category": category,
                "Priority":priority,
                "DueDate": dueDate,
                "AssignTo": user!=null?user:"",
                "AssignTeam": team!=null?team:""
            }
        }).done(function (response){
            getTasks();
            new PNotify({
                title: 'Updated Successsfully',
                text: 'Task Updated!',
                type: 'success',
                styling: 'bootstrap3'
            });
        }).always(function() {
        	$('#ajax-loader').hide();
        });
    }


}

function getTasks(){	
	var role = $("#role").val();
	
	$('#ajax-loader').show();
    $.get("tasks").done(function(response){
        var taskList = response;

//        console.log(taskList);
        $("#datatable-responsive2").find('tbody').find("tr").remove();
        	let show = $('#role').val()=="developer"?"hidden":"";
        $.each(taskList, function(index, task){
            //OverDue Warning
            let diff = onOverDue(task.DueDate,task.Status);
            let status = diff == true ? "" : "hidden";

            //Show hide Mark As Done Button
        	let sameUser = checkUser(task.AssignedTo, task.AssignedToTeam, task.Status);
        	
        	let prior = task.Priority==1?"LOW":task.Priority==2?"MEDIUM":"HIGH";
        	$("#datatable-responsive2").find('tbody').append(
                ' <tr>\n' +
                '                      <td>'+task.Name+'</td>\n' +
                '                      <td>'+task.DueDate+'</td>\n' +
                '                      <td>'+task.Category+'</td>\n' +
                '                      <td>\n' +
                '                      <button type="button" data-id="status" id="status" class="btn btn-success btn-xs">' + task.Status + '</button>' +
                '                      <span class="label label-danger '+status+'"><i class="fa fa-warning"></i> OVERDUE</span>' +
                '                      </td>\n' +
                '                      <td><button type="button" class="btn btn-warning btn-xs">'+prior+'</button></td>\n' +
                '                      <td>'+task.AssignedTo+'</td>\n' +
                '                      <td>'+task.AssignedToTeam+'</td>\n' +
                '                      <td>\n' +
                '                        <button type="button" data-id="'+task.TaskID
                +'" data-name="'+task.Name
                +'" data-category="'+task.Category
                +'" data-priority="'+task.Priority 
                +'" data-duedate="'+task.DueDate 
                +'" data-assignto="'+task.AssignedTo 
                +'" data-assigntoteam="'+task.AssignedToTeam 
                +'" class=" '+show+' edit btn btn-info btn-xs"><i class="fa fa-pencil"></i> Edit </button>\n' +
                '                        <button type="button" data-id="'+task.TaskID+'" id="btnDelete" class="'+show+' btn btn-danger btn-xs"><i class="fa fa-trash-o"></i> Delete </button>\n' +
                '                        <button type="button" data-id="'+task.TaskID+'" id="changestatus" class=" '+sameUser+' btn btn-warning btn-xs"><i class="fa fa-trash-o"></i> Mark as Done </button>\n' +
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

function onUpdate(){
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

function onCancel(){
	$('#id').val("");
	$('#category').val("");
	$('#priority').val("");
	$('#user').val("");
	$('#team').val("");
	$('#duedate').val("");
	$('#name').val("");
}
function onChangeStatus(){
	let id = $(this).attr("data-id");
	alert("onChangeStatus Called "+id);
}

function deleteTask(){
	let id = $(this).attr("data-id");
	if(id){
		if (confirm("Are you sure to delete?")) {
	        // your deletion code
			$('#ajax-loader').show();
			$.ajax("deletetask", {
	            "type": "post",
	            "data": {
	                "Id":id
	            }
	        }).done(function (response){
	            getTasks();
	            new PNotify({
	                title: 'Deleted Successsfully',
	                text: 'Task Delted!',
	                type: 'warning',
	                styling: 'bootstrap3'
	            });
	        }).fail(function(err){
	        	console.log(err);
	        }).always(function() {
	        	$('#ajax-loader').hide();
	        });
	    }
	    return false;		
	}
}

function checkUser(AssignedTo, AssignedToTeam, status){
    if(status=="COMPLETED" || status=="completed" ) return "hidden";

	let role = $('#role').val();
	let loggedUserId = $('#loggedUserId').val();
	
	if(role!="developer") return "hidden";
	
	if(loggedUserId == AssignedTo){
		return "";
	}else{
		return "hidden";
	}
	
		
		
}

function onOverDue(due,status) {

    if(status=="COMPLETED" || status=="completed" ) return false;
    let q = new Date();
    let m = q.getMonth() + 1;
    let d = q.getDay();
    let y = q.getFullYear();
    let today = new Date(y, m, d);
    let dueDate = new Date(due);
    if (today > dueDate)
        return true;
    return false;


}
