package Controller.UserController;

import Dao.UserDao;
import Model.Task;
import Model.User;
import com.google.gson.Gson;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/getdevelopers")
public class UserListServlet extends HttpServlet {
    private UserDao userDao = new UserDao();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        PrintWriter out = response.getWriter();
        ArrayList<User> allusers = new ArrayList<User>();
        allusers=userDao.getUsersList();
        String JSONdata;
        JSONdata = new Gson().toJson(allusers);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        out.write(JSONdata);
    }
}
