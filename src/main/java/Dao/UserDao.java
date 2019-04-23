package Dao;

import Config.Mysql;
import Model.Role;
import Model.Team;
import Model.User;

import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;

public class UserDao {
    public void saveUser(User user) throws ClassNotFoundException, SQLException {
        String query = "INSERT INTO USER"
                + "(USERID, USERNAME, PASSWORD, FULLNAME, STATE, CITY, STREET, ZIPCODE, EMAIL, ROLE) VALUES"
                + "(?,?,?,?,?,?,?,?,?,?)";

        try (Connection connection = Mysql.getMysqlConnection()) {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, 0);
            ps.setString(2, user.getUserName());
            ps.setString(3, user.getPassWord());
            ps.setString(4, user.getFullName());
            ps.setString(5, user.getState());
            ps.setString(6, user.getCity());
            ps.setString(7, user.getStreet());
            ps.setInt(8, user.getZipCode() == null ? 0 : user.getZipCode());
            ps.setString(9, user.getEmail());
            ps.setString(10, user.getRole());
            ps.executeUpdate();

            ps.close();
        } catch (SQLException e) {
            System.out.println("Exception thrown in save User " + user.getUserName());
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e.getMessage());
        }
    }

    public void updateUser(User user) throws ClassNotFoundException, SQLException {
        String query = "UPDATE USER SET "
                + "USERNAME=?, PASSWORD=?, FULLNAME=?, STATE=?, CITY=?, STREET=?, ZIPCODE=?, EMAIL=?, ROLE=? where USERNAME=? ";

        try (Connection connection = Mysql.getMysqlConnection()) {
            PreparedStatement ps = connection.prepareStatement(query);

            ps.setString(1, user.getUserName());
            ps.setString(2, user.getPassWord());
            ps.setString(3, user.getFullName());
            ps.setString(4, user.getState());
            ps.setString(5, user.getCity());
            ps.setString(6, user.getStreet());
            ps.setInt(7, user.getZipCode() == null ? 0 : user.getZipCode());
            ps.setString(8, user.getEmail());
            ps.setString(9, user.getRole());

            ps.setString(10, user.getUserName());
            ps.executeUpdate();

            ps.close();
        } catch (SQLException e) {
            System.out.println("Exception thrown in save User " + user.getUserName());
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e.getMessage());
        }
    }

    public  ArrayList<User> getUsers() {
        String query = "SELECT * from USER ;";
            ArrayList<User> AllUsers=new ArrayList<>();
        User user = null;
        try (Connection con = Mysql.getMysqlConnection(); Statement stmt = con.createStatement()) {
            System.out.println("the query: " + query);
            ResultSet rs = stmt.executeQuery(query);
            while (rs.next()) {
                int userid=Integer.parseInt(rs.getString("USERID"));
                String userName = rs.getString("USERNAME");
                String password = rs.getString("PASSWORD");
                String fullName = rs.getString("FULLNAME");
                String gender = rs.getString("GENDER");
                String state = rs.getString("STATE");
                String city = rs.getString("CITY");
                String street = rs.getString("STREET");
                Integer zipcode = rs.getInt("ZIPCODE");
                Date birthDate = rs.getDate("BIRTHDATE");
                String email = rs.getString("EMAIL");
                String role = rs.getString("ROLE");
     //           System.out.println("the query: " + userid);
                user = new User(userid,userName, password, email, fullName, state, city, street, zipcode,birthDate,role,gender);
          //     user.setUserId(rs.getInt("USERID"));
                AllUsers.add(user);
            }
            stmt.close();
        } catch (SQLException s) {
            System.out.println("Exception thrown in retrieveUser ....");
            s.printStackTrace();
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e.getMessage());
        }
        return AllUsers;
    }
    public User getUser(String userName) {
        String query = "SELECT * from USER where username = '" + userName + "';";
        User user = null;
        try (Connection con = Mysql.getMysqlConnection(); Statement stmt = con.createStatement()) {
            System.out.println("the query: " + query);
            ResultSet rs = stmt.executeQuery(query);
            while (rs.next()) {
                userName = rs.getString("USERNAME");
                String password = rs.getString("PASSWORD");
                String fullName = rs.getString("FULLNAME");
                String gender = rs.getString("GENDER");
                String state = rs.getString("STATE");
                String city = rs.getString("CITY");
                String street = rs.getString("STREET");
                Integer zipcode = rs.getInt("ZIPCODE");
                Date birthDate = rs.getDate("BIRTHDATE");
                String email = rs.getString("EMAIL");
                String role = rs.getString("ROLE");

                user = new User(userName, password, email, fullName, role, state, city, street, zipcode);
                user.setUserId(rs.getInt("USERID"));
            }
            stmt.close();
        } catch (SQLException s) {
            System.out.println("Exception thrown in retrieveUser ....");
            s.printStackTrace();
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e.getMessage());
        }
        return user;
    }

    public  ArrayList<User> getUsersList() {
        String query = "SELECT USERID,USERNAME,FULLNAME,ROLE from USER WHERE ROLE='developer'";
        ArrayList<User> AllUsers=new ArrayList<>();
        User user = null;
        try (Connection con = Mysql.getMysqlConnection(); Statement stmt = con.createStatement()) {
            System.out.println("the query: " + query);
            ResultSet rs = stmt.executeQuery(query);
            while (rs.next()) {
                int userid=Integer.parseInt(rs.getString("USERID"));
                String userName = rs.getString("USERNAME");
                String fullName = rs.getString("FULLNAME");
                String role = rs.getString("ROLE");
                user = new User(userid,userName, "", "", fullName, "", "", "", 00000,null,role,"");
                AllUsers.add(user);
            }
            stmt.close();
        } catch (SQLException s) {
            System.out.println("Exception thrown in retrieve User List ....");
            s.printStackTrace();
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e.getMessage());
        }
        return AllUsers;
    }
    
    public  String getUserTeams(String userId) {
        String query = "SELECT TEAMS.TEAMNAME FROM TEAMUSER  JOIN TEAMS ON TEAMS.TEAMID= TEAMUSER.TEAMID WHERE USERID='"+userId+"'";
        String AllTeams="";
        try (Connection con = Mysql.getMysqlConnection(); Statement stmt = con.createStatement()) {
            System.out.println("the query: " + query);
            ResultSet rs = stmt.executeQuery(query);
            while (rs.next()) {
            	AllTeams += rs.getString("TEAMNAME")+",";
            }
            stmt.close();
        } catch (SQLException s) {
            System.out.println("Exception thrown in retrieve User List ....");
            s.printStackTrace();
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e.getMessage());
        }
        return AllTeams;
    }
    
    public  ArrayList<Team> getTeamsList() {
        String query = "SELECT * from TEAMS";
        ArrayList<Team> AllTeams=new ArrayList<>();
        Team team = null;
        try (Connection con = Mysql.getMysqlConnection(); Statement stmt = con.createStatement()) {
            System.out.println("the query: " + query);
            ResultSet rs = stmt.executeQuery(query);
            while (rs.next()) {
                int userid=Integer.parseInt(rs.getString("TEAMID"));
                String userName = rs.getString("TEAMNAME");
                
                team = new Team(userid,userName);
                AllTeams.add(team);
            }
            stmt.close();
        } catch (SQLException s) {
            System.out.println("Exception thrown in retrieve team List ....");
            s.printStackTrace();
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e.getMessage());
        }
        return AllTeams;
    }
}
