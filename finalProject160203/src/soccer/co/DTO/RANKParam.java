package soccer.co.DTO;

import java.io.Serializable;

public class RANKParam implements Serializable{
	
	private int ranking;
	private String team_location;
	private String team_name;
	private int team_point;
	private int team_win;
	private int team_lose;
	private int team_league_season;
	
	public RANKParam() {}

	public RANKParam(String team_location, String team_name, int team_point, int team_win, int team_lose,
			int team_league_season) {
		super();
		this.team_location = team_location;
		this.team_name = team_name;
		this.team_point = team_point;
		this.team_win = team_win;
		this.team_lose = team_lose;
		this.team_league_season = team_league_season;
	}

	public RANKParam(int ranking, String team_location, String team_name, int team_point, int team_win, int team_lose,
			int team_league_season) {
		super();
		this.ranking = ranking;
		this.team_location = team_location;
		this.team_name = team_name;
		this.team_point = team_point;
		this.team_win = team_win;
		this.team_lose = team_lose;
		this.team_league_season = team_league_season;
	}

	public int getRanking() {
		return ranking;
	}

	public void setRanking(int ranking) {
		this.ranking = ranking;
	}

	public String getTeam_location() {
		return team_location;
	}

	public void setTeam_location(String team_location) {
		this.team_location = team_location;
	}

	public String getTeam_name() {
		return team_name;
	}

	public void setTeam_name(String team_name) {
		this.team_name = team_name;
	}

	public int getTeam_point() {
		return team_point;
	}

	public void setTeam_point(int team_point) {
		this.team_point = team_point;
	}

	public int getTeam_win() {
		return team_win;
	}

	public void setTeam_win(int team_win) {
		this.team_win = team_win;
	}

	public int getTeam_lose() {
		return team_lose;
	}

	public void setTeam_lose(int team_lose) {
		this.team_lose = team_lose;
	}

	public int getTeam_league_season() {
		return team_league_season;
	}

	public void setTeam_league_season(int team_league_season) {
		this.team_league_season = team_league_season;
	}

	@Override
	public String toString() {
		return "RANKParam [ranking=" + ranking + ", team_location="
				+ team_location + ", team_name=" + team_name + ", team_point="
				+ team_point + ", team_win=" + team_win + ", team_lose="
				+ team_lose + ", team_league_season=" + team_league_season
				+ "]";
	}

}
