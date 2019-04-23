package Controller.teamsServlet;


import Dao.TeamDao;
import Dao.UserDao;
import Model.Team;
import Model.User;
import com.google.gson.Gson;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;

//import utilities.ApplicationParams;

@WebServlet("/teams")
public class teamsServlet extends HttpServlet {
    private TeamDao teamDao = new TeamDao();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        System.out.println("Adding team... ");

        String teamName = request.getParameter("teamName");
        String description = request.getParameter("description");
        String teamUsers = request.getParameter("teamusers");

        String[] tablearray = request.getParameterValues("teamusers[]");

        for (int i = 0; i < tablearray.length; i++) {
            System.out.println(tablearray[i]);
        }



        Team team  = new Team(teamName, description,tablearray);

        if (teamDao.getTeam(teamName) != null) {
            try {
                teamDao.updateUser(team);
            } catch (SQLException | ClassNotFoundException e) {
                e.printStackTrace();
            }
        }
        else {
            try {
                teamDao.saveTeam(team);
            } catch (SQLException | ClassNotFoundException e) {
                e.printStackTrace();
            }
            System.out.println("Created user " + teamName);
//            request.getRequestDispatcher("home.jsp").forward(request, response);


        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Gson gson = new Gson();
        ArrayList<Team> allteam = new ArrayList<Team>();
        allteam=teamDao.getTeam();
        PrintWriter out = response.getWriter();
        out.print(gson.toJson(allteam));

        out.flush();
        out.close();
    }
}
