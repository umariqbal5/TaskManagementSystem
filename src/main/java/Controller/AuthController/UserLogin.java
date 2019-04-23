package Controller.AuthController;

import Dao.UserDao;
import Model.User;
import com.google.gson.Gson;
import com.mysql.jdbc.StringUtils;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@WebServlet("/login")
public class UserLogin extends HttpServlet {
    private UserDao userDao = new UserDao();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("Check login...");
        String userName = request.getParameter("userName");
        String password = request.getParameter("password");
        String rememberMe = request.getParameter("rememberMe");
        User user = userDao.getUser(userName);
        if (user == null) {
            System.out.println("User not existed");
            request.setAttribute("errors", "Username is not existed");
            request.getRequestDispatcher("login.jsp").forward(request, response);
            return;
        }
        String Teams = userDao.getUserTeams(user.getUserId().toString());
        if (user.getPassWord().equals(password)) {
            System.out.println("Login Success");
            //get the old session and invalidate
            HttpSession oldSession = request.getSession(false);
            if (oldSession != null) {
                oldSession.invalidate();
            }
            //generate a new session
            HttpSession newSession = request.getSession(true);

            //setting session to expiry in 5 mins
            newSession.setMaxInactiveInterval(60 * 60);
            newSession.setAttribute("userName", user.getUserName());
            newSession.setAttribute("userId", user.getUserId());
            newSession.setAttribute("userRole", user.getRole());
            newSession.setAttribute("userTeams", Teams);

            if (!StringUtils.isNullOrEmpty(rememberMe)) {
                Cookie cookieRememberMe = new Cookie("rememberMe", "true");
                newSession.setAttribute("password", user.getPassWord());
                response.addCookie(cookieRememberMe);
            }
            Cookie cookieUser = new Cookie("loginUser", userName);
            response.addCookie(cookieUser);
//            request.getRequestDispatcher("home.jsp").forward(request, response);
            response.sendRedirect(request.getContextPath() + "/home.jsp");
        } else {
            System.out.println("Password not match");
            request.setAttribute("errors", "Password is not match");
            request.setAttribute("userName", userName);
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        doPost(request,response);
        request.getRequestDispatcher(request.getContextPath() + "login.jsp").forward(request, response);
    }
}
