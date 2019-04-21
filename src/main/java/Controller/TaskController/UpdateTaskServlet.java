package Controller.TaskController;

import Dao.TaskDao;
import Model.Task;
import com.google.gson.Gson;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
import java.util.UUID;

@WebServlet("/updatetask")
public class UpdateTaskServlet extends HttpServlet {
    private TaskDao taskDao = new TaskDao();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("Updating Task... ");
        String Id = request.getParameter("Id");
        String Name = request.getParameter("Name");
        String Category = request.getParameter("Category");
        String Priority = request.getParameter("Priority");
        String DueDate =  request.getParameter("DueDate");
        String AssignTo =  request.getParameter("AssignTo");
        String AssignTeam =  request.getParameter("AssignTeam");
        if(!(Id.equals("") && Name.equals(""))){
            Task task=new Task(Id,Name,Category,Priority,DueDate,"NEW",AssignTo,AssignTeam);
            try {
                taskDao.updateTask(task);
            } catch (SQLException | ClassNotFoundException e) {
                e.printStackTrace();
            }
            System.out.println("Updated Task " + Name);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}
