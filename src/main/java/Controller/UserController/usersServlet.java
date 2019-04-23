package Controller.UserController;


import Dao.UserDao;
import Model.User;
import com.google.gson.Gson;
//import utilities.ApplicationParams;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.Writer;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/users")
public class usersServlet extends HttpServlet {
    private UserDao userDao = new UserDao();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        System.out.println("Adding user... ");
        String userName = request.getParameter("userName");
        String password = request.getParameter("password");
        String fullName = request.getParameter("fullName");
        String gender = request.getParameter("gender");
        String country = request.getParameter("country");
        String state = request.getParameter("state");
        String city = request.getParameter("city");
        String role =  request.getParameter("role");
        System.out.println(gender);
        User user  = new User(userName, password, "", fullName, role, state, city, "", 00000,gender);

        if (userDao.getUser(userName) != null) {
            try {
                System.out.println("update function");
                userDao.updateUser(user);
            } catch (SQLException | ClassNotFoundException e) {
                e.printStackTrace();
            }
        }
        else {
            try {
                userDao.saveUser(user);
            } catch (SQLException | ClassNotFoundException e) {
                e.printStackTrace();
            }
            System.out.println("Created user " + userName);
//            request.getRequestDispatcher("home.jsp").forward(request, response);


        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Gson gson = new Gson();
        ArrayList<User> allusers = new ArrayList<User>();
        allusers=userDao.getUsers();
        PrintWriter out = response.getWriter();
        out.print(gson.toJson(allusers));

        out.flush();
        out.close();
    }
}
