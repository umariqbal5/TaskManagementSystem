
package Model;

public class Task {
    private String TaskID ;
    private String Name ;
    private String Category ;
    private String Priority ;
    private String DueDate ;
    private String Status ;
    private String AssignedTo ;
    private String AssignedToTeam ;
    public Task() {
    }

    public Task(String name, String category, String priority, String dueDate, String status, String assignedTo, String assignedToTeam) {
        Name = name;
        Category = category;
        Priority = priority;
        DueDate = dueDate;
        Status = status;
        AssignedTo = assignedTo;
        AssignedToTeam = assignedToTeam;
    }
    public Task(String Id,String name, String category, String priority, String dueDate, String status, String assignedTo, String assignedToTeam) {
        TaskID = Id;
        Name = name;
        Category = category;
        Priority = priority;
        DueDate = dueDate;
        Status = status;
        AssignedTo = assignedTo;
        AssignedToTeam = assignedToTeam;
    }

    public String getTaskID() {
        return TaskID;
    }

    public void setTaskID(String taskID) {
        TaskID = taskID;
    }

    public String getName() {
        return Name;
    }

    public void setName(String name) {
        Name = name;
    }

    public String getCategory() {
        return Category;
    }

    public void setCategory(String category) {
        Category = category;
    }

    public String getPriority() {
        return Priority;
    }

    public void setPriority(String priority) {
        Priority = priority;
    }

    public String getDueDate() {
        return DueDate;
    }

    public void setDueDate(String dueDate) {
        DueDate = dueDate;
    }

    public String getStatus() {
        return Status;
    }

    public void setStatus(String status) {
        Status = status;
    }

    public String getAssignedTo() {
        return AssignedTo;
    }

    public void setAssignedTo(String assignedTo) {
        AssignedTo = assignedTo;
    }

    public String getAssignedToTeam() {
        return AssignedToTeam;
    }

    public void setAssignedToTeam(String assignedToTeam) {
        AssignedToTeam = assignedToTeam;
    }
}
