package soccer.co.DTO;

/*
 * create table foot_game_record(//공식 경기만 기록하는 테이블
 game_no varchar2(20) ;     //경기 시퀀스 번호 publicgame의 game_no와 forgin
 game_date varchar2(20) ; 	   //경기 날짜
 score varchar2(50) ;   	     // 1,2  왼이 이긴팀 점수, 오른쪽이 진팀점수  
 win_team varchar2(20) ;		   //승리팀
 lose_team varchar2(20) ;		   //패팀
 matching_state number ;		     //성사여부 최근 경기를 보여줄때 성사 여부에 따라 보여준다. '
 win_goal_player varchar2(50),	       //승리팀 골잡이 user_id,
 lose_goal_player varchar2(50),	       //패팀 골잡이   user_id, 
 home_local varchar2(50) ;		 //홈팀 지역
 away_local varchar2(50) ;		 //어웨이지역 
 win_team_logo varchar2(200) not null,       --이긴 팀 로고
 lose_team_logo varchar2(200) not null,	--진팀 로고

 CONSTRAINT FK_game_record FOREIGN KEY(game_no) REFERENCES foot_publicgame(game_no)       
 );
 */
public class foot_game_record {
	
	int rnum;
	int game_no; // 경기 시퀀스 번호 publicgame의 game_no와 forgin
	String game_date; // 경기 날짜
	String score; // 1,2 왼이 이긴팀 점수, 오른쪽이 진팀점수
	String win_team; // 승리팀
	String lose_team; // 패팀
	int matching_state; // 성사여부 최근 경기를 보여줄때 성사 여부에 따라 보여준다. 1==성사 , 0은 no 성사'
	String win_goal_player; // 승리팀 골잡이 user_id,
	String lose_goal_player; // 패팀 골잡이 user_id,
	String home_local; // 홈팀 지역
	String away_local; // 어웨이지역
	String win_team_logo; // 어웨이지역
	String lose_team_logo; // 어웨이지역

	public foot_game_record() {
		super();
	}

	
	public foot_game_record(int game_no, String game_date, String score,
			String win_team, String lose_team, int matching_state,
			String win_goal_player, String lose_goal_player, String home_local,
			String away_local, String win_team_logo, String lose_team_logo) {
		super();
		this.game_no = game_no;
		this.game_date = game_date;
		this.score = score;
		this.win_team = win_team;
		this.lose_team = lose_team;
		this.matching_state = matching_state;
		this.win_goal_player = win_goal_player;
		this.lose_goal_player = lose_goal_player;
		this.home_local = home_local;
		this.away_local = away_local;
		this.win_team_logo = win_team_logo;
		this.lose_team_logo = lose_team_logo;
	}

	public foot_game_record(int rnum, int game_no, String game_date, String score, String win_team, String lose_team,
			int matching_state, String win_goal_player, String lose_goal_player, String home_local, String away_local,
			String win_team_logo, String lose_team_logo) {
		super();
		this.rnum = rnum;
		this.game_no = game_no;
		this.game_date = game_date;
		this.score = score;
		this.win_team = win_team;
		this.lose_team = lose_team;
		this.matching_state = matching_state;
		this.win_goal_player = win_goal_player;
		this.lose_goal_player = lose_goal_player;
		this.home_local = home_local;
		this.away_local = away_local;
		this.win_team_logo = win_team_logo;
		this.lose_team_logo = lose_team_logo;
	}


	public int getRnum() {
		return rnum;
	}


	public void setRnum(int rnum) {
		this.rnum = rnum;
	}


	public String getWin_team_logo() {
		return win_team_logo;
	}


	public void setWin_team_logo(String win_team_logo) {
		this.win_team_logo = win_team_logo;
	}


	public String getLose_team_logo() {
		return lose_team_logo;
	}


	public void setLose_team_logo(String lose_team_logo) {
		this.lose_team_logo = lose_team_logo;
	}


	public int getGame_no() {
		return game_no;
	}

	public void setGame_no(int game_no) {
		this.game_no = game_no;
	}

	public String getGame_date() {
		return game_date;
	}

	public void setGame_date(String game_date) {
		this.game_date = game_date;
	}

	public String getScore() {
		return score;
	}

	public void setScore(String score) {
		this.score = score;
	}

	public String getWin_team() {
		return win_team;
	}

	public void setWin_team(String win_team) {
		this.win_team = win_team;
	}

	public String getLose_team() {
		return lose_team;
	}

	public void setLose_team(String lose_team) {
		this.lose_team = lose_team;
	}

	public int getMatching_state() {
		return matching_state;
	}

	public void setMatching_state(int matching_state) {
		this.matching_state = matching_state;
	}

	public String getWin_goal_player() {
		return win_goal_player;
	}

	public void setWin_goal_player(String win_goal_player) {
		this.win_goal_player = win_goal_player;
	}

	public String getLose_goal_player() {
		return lose_goal_player;
	}

	public void setLose_goal_player(String lose_goal_player) {
		this.lose_goal_player = lose_goal_player;
	}

	public String getHome_local() {
		return home_local;
	}

	public void setHome_local(String home_local) {
		this.home_local = home_local;
	}

	public String getAway_local() {
		return away_local;
	}

	public void setAway_local(String away_local) {
		this.away_local = away_local;
	}

	@Override
	public String toString() {
		return "foot_game_record [game_no=" + game_no + ", game_date="
				+ game_date + ", score=" + score + ", win_team=" + win_team
				+ ", lose_team=" + lose_team + ", matching_state="
				+ matching_state + ", win_goal_player=" + win_goal_player
				+ ", lose_goal_player=" + lose_goal_player + ", home_local="
				+ home_local + ", away_local=" + away_local + "]";
	}

}
