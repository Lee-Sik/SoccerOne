package soccer.co.DTO;

import java.sql.Date;

public class FOOT_USER_RECORD {
	String user_email;
	int longpass;
	int shotpass;
	int goal;
	int play_time;
	
	String game_record_day;
	
	public FOOT_USER_RECORD() {
		super();
	}

	public FOOT_USER_RECORD(String user_email, int longpass, int shotpass,
			int goal, int play_time, String game_record_day) {
		super();
		this.user_email = user_email;
		this.longpass = longpass;
		this.shotpass = shotpass;
		this.goal = goal;
		this.play_time = play_time;
		this.game_record_day = game_record_day;
	}

	public String getUser_email() {
		return user_email;
	}

	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}

	public int getLongpass() {
		return longpass;
	}

	public void setLongpass(int longpass) {
		this.longpass = longpass;
	}

	public int getShotpass() {
		return shotpass;
	}

	public void setShotpass(int shotpass) {
		this.shotpass = shotpass;
	}

	public int getGoal() {
		return goal;
	}

	public void setGoal(int goal) {
		this.goal = goal;
	}

	

	public int getPlay_time() {
		return play_time;
	}

	public void setPlay_time(int play_time) {
		this.play_time = play_time;
	}

	public String getGame_record_day() {
		return game_record_day;
	}

	public void setGame_record_day(String game_record_day) {
		this.game_record_day = game_record_day;
	}

	@Override
	public String toString() {
		return "FOOT_USER_RECORD [user_email=" + user_email + ", longpass="
				+ longpass + ", shotpass=" + shotpass + ", goal=" + goal
				+ ", play_time=" + play_time + ", game_record_day="
				+ game_record_day + "]";
	}

	
}
