package soccer.co.DTO;
/*
drop table team;

create table team(  //순수 팀에 대한 정보 
team_managerid varchar2(50) not null,   //팀장 아이디 foreign key
team_name varchar2(50) PRIMARY KEY,        //팀이름
team_intro varchar2(500) not null,      //팀소개
team_menbernum number(2) not null,      //팀맴버 수
team_location1 varchar2(50) not null,   //팀지역 주활동1
team_location2 varchar2(50) not null,   //팀지역 주활동2
team_location3 varchar2(50) not null,   //팀지역 주활동3
team_message number(10) default 0,    	//팀 메시지 수
team_join number(2) not null,		        //팀원 모집 유(1)무(0)
team_open number(2) not null,           //공개비공개 유무
team_home varchar(50),                  //팀홈구장 유무 예)null, 수원시 팔달구 우만초등학교 운동장
team_logo varchar2(50)                  //로고 이미지 위치
);
*/

public class foot_team_DTO {
	String team_managerid;  //팀장 아이디 foreign key
	String team_name;       //팀이름
	String team_intro;      //팀소개
	int team_menbernum;     //팀맴버 수
	String team_location1;  //팀지역 주활동1
	String team_location2;  //팀지역 주활동2
	String team_location3;  //팀지역 주활동3
	int team_message;  		//팀 메시지 수
	int team_join;          //팀원 모집 유(1)무(0)
	int team_open;          //공개비공개 유무
	String team_home ;      //팀홈구장 유무 예)null, 수원시 팔달구 우만초등학교 운동장
	String team_logo;       //로고 이미지 위치
	
	@Override
	public String toString() {
		return "foot_team_DTO [team_managerid=" + team_managerid
				+ ", team_name=" + team_name + ", team_intro=" + team_intro
				+ ", team_menbernum=" + team_menbernum + ", team_location1="
				+ team_location1 + ", team_location2=" + team_location2
				+ ", team_location3=" + team_location3 + ", team_message="
				+ team_message + ", team_join=" + team_join + ", team_open="
				+ team_open + ", team_home=" + team_home + ", team_logo="
				+ team_logo + "]";
	}

	public foot_team_DTO() {
		super();
	}
	
	public foot_team_DTO(String team_managerid, String team_name,
			String team_intro, int team_menbernum, String team_location1,
			String team_location2, String team_location3, int team_message,
			int team_join, int team_open, String team_home, String team_logo) {
		super();
		this.team_managerid = team_managerid;
		this.team_name = team_name;
		this.team_intro = team_intro;
		this.team_menbernum = team_menbernum;
		this.team_location1 = team_location1;
		this.team_location2 = team_location2;
		this.team_location3 = team_location3;
		this.team_message = team_message;
		this.team_join = team_join;
		this.team_open = team_open;
		this.team_home = team_home;
		this.team_logo = team_logo;
	}
	public String getTeam_managerid() {
		return team_managerid;
	}
	public void setTeam_managerid(String team_managerid) {
		this.team_managerid = team_managerid;
	}
	public String getTeam_name() {
		return team_name;
	}
	public void setTeam_name(String team_name) {
		this.team_name = team_name;
	}
	public String getTeam_intro() {
		return team_intro;
	}
	public void setTeam_intro(String team_intro) {
		this.team_intro = team_intro;
	}
	public int getTeam_menbernum() {
		return team_menbernum;
	}
	public void setTeam_menbernum(int team_menbernum) {
		this.team_menbernum = team_menbernum;
	}
	public String getTeam_location1() {
		return team_location1;
	}
	public void setTeam_location1(String team_location1) {
		this.team_location1 = team_location1;
	}
	public String getTeam_location2() {
		return team_location2;
	}
	public void setTeam_location2(String team_location2) {
		this.team_location2 = team_location2;
	}
	public String getTeam_location3() {
		return team_location3;
	}
	public void setTeam_location3(String team_location3) {
		this.team_location3 = team_location3;
	}
	public int getTeam_message() {
		return team_message;
	}
	public void setTeam_message(int team_message) {
		this.team_message = team_message;
	}
	public int getTeam_join() {
		return team_join;
	}
	public void setTeam_join(int team_join) {
		this.team_join = team_join;
	}
	public int getTeam_open() {
		return team_open;
	}
	public void setTeam_open(int team_open) {
		this.team_open = team_open;
	}
	public String getTeam_home() {
		return team_home;
	}
	public void setTeam_home(String team_home) {
		this.team_home = team_home;
	}
	public String getTeam_logo() {
		return team_logo;
	}
	public void setTeam_logo(String team_logo) {
		this.team_logo = team_logo;
	}
	
	
	
}
