package soccer.co.DTO;
/*

 */
public class foot_game_DTO {
	
	private String team_managerid;
	private int game_no;
	private String team_name;
	private String team_name1;
	private String game_location;
	private String game_content;
	private String game_date;
	private String ground;
	private int pay;
	private int game_state;
	
	public foot_game_DTO(){}

	public foot_game_DTO(String team_managerid, int game_no, String team_id, String game_location, String game_date, String ground,
			int pay, int game_state) { //공식 경기
		super();
		this.team_managerid = team_managerid;
		this.game_no = game_no;
		this.team_name = team_id;
		this.game_location = game_location;
		this.game_date = game_date;
		this.ground = ground;
		this.pay = pay;
		this.game_state = game_state;
	}
	
	public foot_game_DTO(int game_no, String team_id, String game_location, String game_date, String ground,
			int pay, int game_state) { //공식 경기
		super();
		this.game_no = game_no;
		this.team_name = team_id;
		this.game_location = game_location;
		this.game_date = game_date;
		this.ground = ground;
		this.pay = pay;
		this.game_state = game_state;
	}
	

	public foot_game_DTO(int game_no, String team_id, String game_content, String game_date, String ground,
			int pay) {		// 친선 경기
		super();
		this.game_no = game_no;
		this.team_name = team_id;
		this.game_content = game_content;
		this.game_date = game_date;
		this.ground = ground;
		this.pay = pay;
	}
	
	public foot_game_DTO(String team_managerid, int game_no, String team_id, String game_content, String game_date, String ground,
			int pay) {		// 친선 경기
		super();
		this.team_managerid = team_managerid;
		this.game_no = game_no;
		this.team_name = team_id;
		this.game_content = game_content;
		this.game_date = game_date;
		this.ground = ground;
		this.pay = pay;
	}
	

	public String getTeam_managerid() {
		return team_managerid;
	}

	public void setTeam_managerid(String team_managerid) {
		this.team_managerid = team_managerid;
	}

	public int getGame_no() {
		return game_no;
	}

	public void setGame_no(int game_no) {
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

	public int getPay() {
		return pay;
	}

	public void setPay(int pay) {
		this.pay = pay;
	}

	public int getGame_state() {
		return game_state;
	}

	public void setGame_state(int game_state) {
		this.game_state = game_state;
	}

	public String getTeam_name1() {
		return team_name1;
	}

	public void setTeam_name1(String team_name1) {
		this.team_name1 = team_name1;
	}

	@Override
	public String toString() {
		return "foot_game_DTO [team_managerid=" + team_managerid + ", game_no=" + game_no + ", team_name=" + team_name
				+ ", team_name1=" + team_name1 + ", game_location=" + game_location + ", game_content=" + game_content
				+ ", game_date=" + game_date + ", ground=" + ground + ", pay=" + pay + ", game_state=" + game_state
				+ "]";
	}

	public foot_game_DTO(String team_managerid, int game_no, String team_name, String team_name1, String game_location,
			String game_content, String game_date, String ground, int pay, int game_state) {
		super();
		this.team_managerid = team_managerid;
		this.game_no = game_no;
		this.team_name = team_name;
		this.team_name1 = team_name1;
		this.game_location = game_location;
		this.game_content = game_content;
		this.game_date = game_date;
		this.ground = ground;
		this.pay = pay;
		this.game_state = game_state;
	}


	
	

	
}
