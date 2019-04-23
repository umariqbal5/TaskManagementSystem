package Controller.teamsServlet;

import Dao.TaskDao;
import Dao.TeamDao;
import Dao.UserDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/deleteteam")
public class DeleteTeamServlet extends HttpServlet {
    private TaskDao taskDao = new TaskDao();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("Deleting Team... ");
        String teamId = request.getParameter("teamId");
System.out.println(teamId);
        if(!teamId.equals("")){
            int id = Integer.valueOf(teamId);
            try {
               TeamDao.deleteTeam(id);
            } catch (SQLException | ClassNotFoundException e) {
                e.printStackTrace();
            }
            System.out.println("Updated Team " + teamId);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}
