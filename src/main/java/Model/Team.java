package Model;

import java.util.Date;

public class Team {
    private Integer teamId;
    private String teamName;

    public Team() {
    }

	public Team(Integer teamId, String teamName) {
		super();
		this.teamId = teamId;
		this.teamName = teamName;
	}

	public Integer getTeamId() {
		return teamId;
	}

	public void setTeamId(Integer teamId) {
		this.teamId = teamId;
	}

	public String getTeamName() {
		return teamName;
	}

	public void setTeamName(String teamName) {
		this.teamName = teamName;
	}

   
}
