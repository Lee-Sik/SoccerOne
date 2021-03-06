package soccer.co.DTO;
/*

 */
public class foot_game_DTO {
	
	private String game_no;
	private String team_name;
	private String game_location;
	private String game_content;
	private String game_date;
	private String ground;
	private String pay;
	private String game_state;
	
	public foot_game_DTO(){}

	public foot_game_DTO(String game_no, String team_id, String game_location, String game_date, String ground,
			String pay, String game_state) { //공식 경기
		super();
		this.game_no = game_no;
		this.team_name = team_id;
		this.game_location = game_location;
		this.game_date = game_date;
		this.ground = ground;
		this.pay = pay;
		this.game_state = game_state;
	}



	public foot_game_DTO(String game_no, String team_id, String game_content, String game_date, String ground,
			String pay) {		// 친선 경기
		super();
		this.game_no = game_no;
		this.team_name = team_id;
		this.game_content = game_content;
		this.game_date = game_date;
		this.ground = ground;
		this.pay = pay;
	}

	public String getGame_no() {
		return game_no;
	}

	public void setGame_no(String game_no) {
		this.game_no = game_no;
	}

	public String getTeam_name() {
		return team_name;
	}

	public void setTeam_name(String team_name) {
		this.team_name = team_name;
	}

	public String getGame_location() {
		return game_location;
	}

	public void setGame_location(String game_location) {
		this.game_location = game_location;
	}

	public String getGame_content() {
		return game_content;
	}

	public void setGame_content(String game_content) {
		this.game_content = game_content;
	}

	public String getGame_date() {
		return game_date;
	}

	public void setGame_date(String game_date) {
		this.game_date = game_date;
	}

	public String getGround() {
		return ground;
	}

	public void setGround(String ground) {
		this.ground = ground;
	}

	public String getPay() {
		return pay;
	}

	public void setPay(String pay) {
		this.pay = pay;
	}

	public String getGame_state() {
		return game_state;
	}

	public void setGame_state(String game_state) {
		this.game_state = game_state;
	}

	@Override
	public String toString() {
		return "foot_game_DTO [game_no=" + game_no + ", team_name=" + team_name + ", game_location=" + game_location
				+ ", game_content=" + game_content + ", game_date=" + game_date + ", ground=" + ground + ", pay=" + pay
				+ ", game_state=" + game_state + "]";
	}
	
	
	

	
}
