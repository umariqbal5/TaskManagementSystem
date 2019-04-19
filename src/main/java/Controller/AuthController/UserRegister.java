package Controller.AuthController;

import Dao.UserDao;
import Model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/createUser")
public class UserRegister extends HttpServlet {
    private UserDao userDao = new UserDao();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("Creating user... ");
        String userName = request.getParameter("userName");
        String password = request.getParameter("password");
        String fullName = request.getParameter("fullName");
        String email =  request.getParameter("email");
        String role =  request.getParameter("role");

        if (userDao.getUser(userName) != null) {
            request.setAttribute("errors", "Username is already existed");
            return;
        }
        User user  = new User(userName, password, email, fullName, role, null, null, null, null);
        try {
        userDao.saveUser(user);
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        System.out.println("Created user " + userName);
        request.getRequestDispatcher("home.html").forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
