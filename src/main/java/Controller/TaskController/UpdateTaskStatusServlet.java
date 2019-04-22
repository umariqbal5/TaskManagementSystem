package Controller.TaskController;

import Dao.TaskDao;
import Model.Task;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/updatetaskstatus")
public class UpdateTaskStatusServlet extends HttpServlet {
    private TaskDao taskDao = new TaskDao();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        System.out.println("Updating Status... ");
        String Id = request.getParameter("Id");
        if(!(Id.equals("") )){
            try {
                taskDao.updateTaskStatus(Id);
            } catch (SQLException | ClassNotFoundException e) {
                e.printStackTrace();
            }
            System.out.println("Status updated");
        }


    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    this.doPost(request, response);
    }
}
