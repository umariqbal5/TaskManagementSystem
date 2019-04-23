package Model;

import java.util.ArrayList;
import java.util.List;

public class Team {

    Integer teamid;
    String teamname;
    String teamdescription;
    String[] teamuser;

    public Team()
    {

    }
    public Team(String teamname, String teamdescription)
    {

        this.teamname=teamname;
        this.teamdescription=teamdescription;
    }
    public Team(String teamname, String teamdescription,String[] teamusers )
    {

        this.teamname=teamname;
        this.teamdescription=teamdescription;
        this.teamuser=teamusers;

    }

    public Team(Integer teamid,String teamname, String teamdescription)
    {

        this.teamid=teamid;
        this.teamname=teamname;
        this.teamdescription=teamdescription;
    }





    public String[] getTeamUsers() {
        return teamuser;
    }

    public void setTeamUsers(String[] teamUsers) {
        this.teamuser = teamUsers;
    }

    public Integer getTeamId() {
        return teamid;
    }

    public void setTeamId(Integer teamId) {
        this.teamid = teamId;
    }

    public String getTeamName() {
        return teamname;
    }

    public void setTeamName(String teamName) {
        this.teamname = teamName;
    }

    public String getTeamDesc() {
        return teamdescription;
    }

    public void setTeamDesc(String teamDesc) {
        this.teamdescription = teamDesc;
    }
}
