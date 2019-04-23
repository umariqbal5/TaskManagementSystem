package Controller.UserController;

import Dao.TaskDao;
import Dao.UserDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/deleteuser")
public class DeleteUserServlet extends HttpServlet {
    private TaskDao taskDao = new TaskDao();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("Deleting User... ");
        String passinginteger="Hello";
        String userId = request.getParameter("userId");
        String sessionuser= request.getSession().getAttribute("userId").toString();
   if(userId.equals(sessionuser))
    {

            Integer.parseInt(passinginteger);

       }
        if(!userId.equals("")){
            int id = Integer.valueOf(userId);
            try {
                UserDao.deleteUser(id);
            } catch (SQLException | ClassNotFoundException e) {
                e.printStackTrace();
            }
            System.out.println("Updated User " + userId);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}
