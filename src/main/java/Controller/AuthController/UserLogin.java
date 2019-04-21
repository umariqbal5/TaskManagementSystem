package Controller.AuthController;

import Dao.UserDao;
import Model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/login")
public class UserLogin extends HttpServlet {
    private UserDao userDao = new UserDao();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("Check login...");
        String userName = request.getParameter("userName");
        String password = request.getParameter("password");
        User user = userDao.getUser(userName);
        if (user == null) {
            request.setAttribute("errors", "Username is not existed");
            return;
        }
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
            newSession.setMaxInactiveInterval(5*60);
            Cookie cookie = new Cookie("loginUser", userName);
            response.addCookie(cookie);
//            request.getRequestDispatcher("home.jsp").forward(request, response);
            response.sendRedirect(request.getContextPath() + "/home.jsp");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        doPost(request,response);
        request.getRequestDispatcher("home.jsp").forward(request, response);
    }
}
