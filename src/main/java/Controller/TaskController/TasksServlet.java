package Controller.TaskController;

import Dao.TaskDao;
import Model.Task;
import com.google.gson.Gson;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
import java.util.UUID;

@WebServlet("/tasks")
public class TasksServlet extends HttpServlet {
    private TaskDao taskDao = new TaskDao();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("Addng Task... ");
        String Name = request.getParameter("Name");
        String Category = request.getParameter("Category");
        String Priority = request.getParameter("Priority");
        String DueDate =  request.getParameter("DueDate");
        String AssignTo =  request.getParameter("AssignTo");
        String AssignTeam =  request.getParameter("AssignTeam");
        if(!Name.equals("")){
            Task task=new Task(Name,Category,Priority,DueDate,"NEW",AssignTo,AssignTeam);
            try {
                taskDao.saveTask(task);
            } catch (SQLException | ClassNotFoundException e) {
                e.printStackTrace();
            }
            System.out.println("Added Task " + Name);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        /* get  input */
    	
        PrintWriter out = response.getWriter();
        
        List<Task> tasks = taskDao.getTasks("","");

        String JSONdata;
        JSONdata = new Gson().toJson(tasks);

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        out.write(JSONdata);
    }
}
