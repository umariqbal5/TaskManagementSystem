package Dao;

import Config.Mysql;
import Model.Task;

import java.sql.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

public class TaskDao {
    public void saveTask(Task task) throws ClassNotFoundException, SQLException {
        String query = "INSERT INTO TASK"
                + "(TASKID, NAME, CATEGORY, PRIORITY, DUEDATE, STATUS, ASSIGNTO, ASSIGNTEAM) VALUES"
                + "(?,?,?,?,?,?,?,?)";


        try (Connection connection = Mysql.getMysqlConnection()) {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, 0);
            ps.setString(2, task.getName());
            ps.setString(3, task.getCategory());
            ps.setString(4, task.getPriority());
            ps.setString(5, task.getDueDate());
            ps.setString(6, task.getStatus());
            ps.setString(7, task.getAssignedTo());
            ps.setString(8, task.getAssignedToTeam());
           int res = ps.executeUpdate();

            ps.close();
        } catch (SQLException e) {
            System.out.println("Exception thrown in save Task " + task.getName());
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e.getMessage());
        }
    }

    public List<Task> getTasks(String assignTo, String assignTeam) {
        String query = "";
        if(!assignTo.equals("")){
            query = "SELECT * from TASK where ASSIGNTO = '" + assignTo + "'";
        }else if(!assignTeam.equals("")){
            query = "SELECT * from TASK where ASSIGNTEAM = '" + assignTeam + "'";
        }else{
            query = "SELECT * from TASK";
        }


        List<Task> tasksList = new ArrayList<Task>();
        try (Connection con = Mysql.getMysqlConnection(); Statement stmt = con.createStatement()) {
            System.out.println("the query: " + query);
            ResultSet rs = stmt.executeQuery(query);
            while (rs.next()) {

                String taskId = rs.getString("TASKID");
                String name = rs.getString("NAME");
                String category = rs.getString("CATEGORY");
                String priority = rs.getString("PRIORITY");
                String dueDate = rs.getString("DUEDATE");
                String status = rs.getString("STATUS");
                String assignedTo = rs.getString("ASSIGNTO");
                String assignToTeam = rs.getString("ASSIGNTEAM");

                tasksList.add(new Task(taskId, name, category, priority, dueDate, status, assignedTo, assignToTeam)) ;
            }
            stmt.close();
        } catch (SQLException s) {
            System.out.println("Exception thrown in retrieveUser ....");
            s.printStackTrace();
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e.getMessage());
        }
        return tasksList;
    }
    
    public void updateTask(Task task) throws ClassNotFoundException, SQLException {
        String query = "INSERT INTO TASK"
                + "(TASKID, NAME, CATEGORY, PRIORITY, DUEDATE, STATUS, ASSIGNTO, ASSIGNTEAM) VALUES"
                + "(?,?,?,?,?,?,?,?)";


        try (Connection connection = Mysql.getMysqlConnection()) {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, 0);
            ps.setString(2, task.getName());
            ps.setString(3, task.getCategory());
            ps.setString(4, task.getPriority());
            ps.setString(5, task.getDueDate());
            ps.setString(6, task.getStatus());
            ps.setString(7, task.getAssignedTo());
            ps.setString(8, task.getAssignedToTeam());
           int res = ps.executeUpdate();

            ps.close();
        } catch (SQLException e) {
            System.out.println("Exception thrown in save Task " + task.getName());
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e.getMessage());
        }
    }
}
