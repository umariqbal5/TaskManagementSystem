package Dao;

import Config.Mysql;
import Model.Team;
import Model.User;

import java.sql.*;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class TeamDao {
    public void saveTeam(Team team) throws ClassNotFoundException, SQLException {
        String query = "INSERT INTO TEAMS"
                + "(TEAMID, TEAMNAME, DESCRIPTION) VALUES"
                + "(?,?,?)";


        try (Connection connection = Mysql.getMysqlConnection()) {
            PreparedStatement ps = connection.prepareStatement(query);

            System.out.println(query);


            ps.setInt(1, 0);
            ps.setString(2, team.getTeamName());
            ps.setString(3, team.getTeamDesc());
            ps.executeUpdate();
            ps.close();


           // System.out.println(team.getTeamUsers());

         String allusersTeams[] = team.getTeamUsers();

         for(int i=0;i<allusersTeams.length;i++)
{
    Team newteam=getTeam(team.getTeamName());
    System.out.println(getTeam(team.getTeamName())+"hello");

    String query2 = "INSERT INTO TEAMUSER"
            + "(TEAMID, USERID) VALUES"
            + "(?,?)";
    System.out.println(allusersTeams[i]);
    PreparedStatement ps2 = connection.prepareStatement(query2);
    ps2.setInt(1, newteam.getTeamId());
    ps2.setString(2,allusersTeams[i]);
    System.out.println(query2);
    ps2.executeUpdate();
    ps2.close();

}


        } catch (SQLException e) {
            System.out.println("Exception thrown in save User " + team.getTeamName());
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e.getMessage());
        }
    }

    public void updateUser(Team team) throws ClassNotFoundException, SQLException {
        String query = "UPDATE TEAMS SET "
                + "TEAMNAME=?, DESCRIPTION=? where TEAMID=? ";

        try (Connection connection = Mysql.getMysqlConnection()) {
            PreparedStatement ps = connection.prepareStatement(query);

            ps.setString(1, team.getTeamName());
            ps.setString(2, team.getTeamDesc());
            ps.setInt(3, team.getTeamId());

            ps.executeUpdate();

            ps.close();

            String query3 = "DELETE FROM TEAMUSER WHERE TASKID=?";

            PreparedStatement ps3 = connection.prepareStatement(query3);

                ps3.setInt(1, team.getTeamId());

                ps3.execute();

                ps3.close();



            String allusersTeams[] = team.getTeamUsers();

            for(int i=0;i<allusersTeams.length;i++)
            {
                Team newteam=getTeam(team.getTeamName());
                System.out.println(getTeam(team.getTeamName())+"hello");

                String query2 = "INSERT INTO TEAMUSER"
                        + "(TEAMID, USERID) VALUES"
                        + "(?,?)";
                System.out.println(allusersTeams[i]);
                PreparedStatement ps2 = connection.prepareStatement(query2);
                ps2.setInt(1, newteam.getTeamId());
                ps2.setString(2,allusersTeams[i]);
                System.out.println(query2);
                ps2.executeUpdate();
                ps2.close();

            }



        } catch (SQLException e) {
            System.out.println("Exception thrown in save User " + team.getTeamName());
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e.getMessage());
        }
    }

    public  ArrayList<Team> getTeam() {
        String query = "SELECT * from TEAMS ;";
            ArrayList<Team> AllTeam=new ArrayList<>();
        Team team = null;
        try (Connection con = Mysql.getMysqlConnection(); Statement stmt = con.createStatement()) {
            System.out.println("the query: " + query);
            ResultSet rs = stmt.executeQuery(query);
            while (rs.next()) {
                int teamId=Integer.parseInt(rs.getString("TEAMID"));
                String teamName = rs.getString("TEAMNAME");
                String teamdescrption = rs.getString("DESCRIPTION");

     //           System.out.println("the query: " + userid);
                team = new Team(teamId,teamName, teamdescrption);
          //     user.setUserId(rs.getInt("USERID"));
                AllTeam.add(team);
            }
            stmt.close();
        } catch (SQLException s) {
            System.out.println("Exception thrown in retrieveUser ....");
            s.printStackTrace();
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e.getMessage());
        }
        return AllTeam;
    }

    public Team getTeam(String teamName) {
        String query = "SELECT * from TEAMS where TEAMNAME = '" + teamName + "';";
        Team team = null;
        try (Connection con = Mysql.getMysqlConnection(); Statement stmt = con.createStatement()) {
            System.out.println("the query: " + query);
            ResultSet rs = stmt.executeQuery(query);
            while (rs.next()) {
               String teamId = rs.getString("TEAMID");
                String description = rs.getString("DESCRIPTION");

                team = new Team(Integer.parseInt(teamId) ,teamName,description);
                team.setTeamId(rs.getInt("TEAMID"));
            }
            stmt.close();
        } catch (SQLException s) {
            System.out.println("Exception thrown in retrieveUser ....");
            s.printStackTrace();
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e.getMessage());
        }
        return team;
    }

    public static void deleteTeam(int TeamId) throws ClassNotFoundException, SQLException {
        String query = "DELETE FROM TEAMS WHERE TEAMID=?";
        String query2 = "DELETE FROM TEAMUSER WHERE TEAMID=?";
        System.out.println("team"+TeamId);

        try (Connection connection = Mysql.getMysqlConnection()) {
            PreparedStatement ps = connection.prepareStatement(query);

            ps.setInt(1, TeamId);

            ps.execute();

            ps.close();
            PreparedStatement ps2 = connection.prepareStatement(query2);

            ps2.setInt(1, TeamId);

            ps2.execute();

            ps2.close();
        } catch (SQLException e) {
            System.out.println("Exception thrown in delete Task " + TeamId);
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e.getMessage());
        }
    }
}
