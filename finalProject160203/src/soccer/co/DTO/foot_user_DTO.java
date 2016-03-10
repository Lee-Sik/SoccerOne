package soccer.co.DTO;
/*
drop table foot_user;

create table foot_user( --유저 테이블 
user_email varchar2(50) primary key, --유저 아이디
user_pw varchar2(50) not null,       --유저 비밀번호
user_name varchar2(50) not null,     --유저 이름
user_birth varchar2(50) not null,    --유저 생년월일
user_age number not null,            --유저 나이
user_phone varchar2(50) not null,    --유저 전화번호
user_high number not null,           --유저 키
user_weight number not null,         --유저 몸무게
user_foot number(2) not null,        --유저 주발 왼(0),오른(1), 양발(2)
user_position1 varchar2(50) not null,--유저 포지션1(주)
user_position2 varchar2(50) not null,--유저 포지션2
user_position3 varchar2(50) not null,--유저 포지션3
user_address varchar2(50),           --유저 주소
user_profile varchar2(50),           --유저 이미지 사진주소?사진이름       
user_team varchar2(50),              --유저 팀명
user_helper number(2) not null,      --유저 용병 유무 무(0),유(1)
user_enabled number(2) not null,     --유저 이용가능 무(0),유(1) ->이미 로그인중 확인

user_speed varchar2(50),             -- 개인 스피드
user_attendrate varchar2(50),        --개인 참석률
user_attendtime varchar2(50),        --개인 출장시간
user_goal varchar2(50)               -- 개인 골

);
 */
public class foot_user_DTO {
	
	private String user_email;
	private String user_pw;
	private String user_name;
	private String user_birth;
	private Integer user_age;
	private String user_phone;
	private Integer user_high;
	private Integer user_weight;
	private Integer user_foot;
	private String user_position1;
	private String user_position2;
	private String user_position3;
	private String user_address;
	private String user_profile;
	private String user_team;
	private int user_helper;
	private int user_enabled;
	
	
	private int user_speed;
	private String user_attendrate;
	private String user_attendtime;
	private String user_goal;
	
	int x;
	int y;
	
	int attack;
	int defender;
	int physic;
	int mind;
	int stamina;

	
	public foot_user_DTO(){}
	
	
	public foot_user_DTO(String user_email, String user_pw, String user_name, String user_birth, Integer user_age,
			String user_phone, Integer user_high, Integer user_weight, Integer user_foot, String user_position1,
			String user_position2, String user_position3, String user_address, String user_profile, String user_team,
			int user_helper, int user_enabled, int user_speed, String user_attendrate, String user_attendtime,
			String user_goal, int x, int y) {
		super();
		this.user_email = user_email;
		this.user_pw = user_pw;
		this.user_name = user_name;
		this.user_birth = user_birth;
		this.user_age = user_age;
		this.user_phone = user_phone;
		this.user_high = user_high;
		this.user_weight = user_weight;
		this.user_foot = user_foot;
		this.user_position1 = user_position1;
		this.user_position2 = user_position2;
		this.user_position3 = user_position3;
		this.user_address = user_address;
		this.user_profile = user_profile;
		this.user_team = user_team;
		this.user_helper = user_helper;
		this.user_enabled = user_enabled;
		this.user_speed = user_speed;
		this.user_attendrate = user_attendrate;
		this.user_attendtime = user_attendtime;
		this.user_goal = user_goal;
		this.x = x;
		this.y = y;
	}


	public foot_user_DTO(String user_email, String user_pw, String user_name, String user_birth, Integer user_age,
			String user_phone, Integer user_high, Integer user_weight, Integer user_foot, String user_position1,
			String user_position2, String user_position3, String user_address, String user_profile, String user_team,
			int user_helper, int user_enabled, int user_speed, String user_attendrate, String user_attendtime,
			String user_goal, int x, int y, int attack, int defender, int physic, int mind, int stamina) {
		super();
		this.user_email = user_email;
		this.user_pw = user_pw;
		this.user_name = user_name;
		this.user_birth = user_birth;
		this.user_age = user_age;
		this.user_phone = user_phone;
		this.user_high = user_high;
		this.user_weight = user_weight;
		this.user_foot = user_foot;
		this.user_position1 = user_position1;
		this.user_position2 = user_position2;
		this.user_position3 = user_position3;
		this.user_address = user_address;
		this.user_profile = user_profile;
		this.user_team = user_team;
		this.user_helper = user_helper;
		this.user_enabled = user_enabled;
		this.user_speed = user_speed;
		this.user_attendrate = user_attendrate;
		this.user_attendtime = user_attendtime;
		this.user_goal = user_goal;
		this.x = x;
		this.y = y;
		this.attack = attack;
		this.defender = defender;
		this.physic = physic;
		this.mind = mind;
		this.stamina = stamina;
	}


	public int getAttack() {
		return attack;
	}

	public void setAttack(int attack) {
		this.attack = attack;
	}

	public int getDefender() {
		return defender;
	}

	public void setDefender(int defender) {
		this.defender = defender;
	}

	public int getPhysic() {
		return physic;
	}

	public void setPhysic(int physic) {
		this.physic = physic;
	}

	public int getMind() {
		return mind;
	}

	public void setMind(int mind) {
		this.mind = mind;
	}

	public int getStamina() {
		return stamina;
	}

	public void setStamina(int stamina) {
		this.stamina = stamina;
	}

	

	public int getX() {
		return x;
	}

	public void setX(int x) {
		this.x = x;
	}

	public int getY() {
		return y;
	}

	public void setY(int y) {
		this.y = y;
	}

	public String getUser_email() {
		return user_email;
	}
	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
	public String getUser_pw() {
		return user_pw;
	}
	public void setUser_pw(String user_pw) {
		this.user_pw = user_pw;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_birth() {
		return user_birth;
	}
	public void setUser_birth(String user_birth) {
		this.user_birth = user_birth;
	}
	public Integer getUser_age() {
		return user_age;
	}
	public void setUser_age(Integer user_age) {
		this.user_age = user_age;
	}
	public String getUser_phone() {
		return user_phone;
	}
	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
	}
	public Integer getUser_high() {
		return user_high;
	}
	public void setUser_high(Integer user_high) {
		this.user_high = user_high;
	}
	public Integer getUser_weight() {
		return user_weight;
	}
	public void setUser_weight(Integer user_weight) {
		this.user_weight = user_weight;
	}
	public Integer getUser_foot() {
		return user_foot;
	}
	public void setUser_foot(Integer user_foot) {
		this.user_foot = user_foot;
	}
	public String getUser_position1() {
		return user_position1;
	}
	public void setUser_position1(String user_position1) {
		this.user_position1 = user_position1;
	}
	public String getUser_position2() {
		return user_position2;
	}
	public void setUser_position2(String user_position2) {
		this.user_position2 = user_position2;
	}
	public String getUser_position3() {
		return user_position3;
	}
	public void setUser_position3(String user_position3) {
		this.user_position3 = user_position3;
	}
	public String getUser_address() {
		return user_address;
	}
	public void setUser_address(String user_address) {
		this.user_address = user_address;
	}
	public String getUser_profile() {
		return user_profile;
	}
	public void setUser_profile(String user_profile) {
		this.user_profile = user_profile;
	}
	public String getUser_team() {
		return user_team;
	}
	public void setUser_team(String user_team) {
		this.user_team = user_team;
	}
	public int getUser_helper() {
		return user_helper;
	}
	public void setUser_helper(int user_helper) {
		this.user_helper = user_helper;
	}
	public int getUser_enabled() {
		return user_enabled;
	}
	public void setUser_enabled(int user_enabled) {
		this.user_enabled = user_enabled;
	}
	public int getUser_speed() {
		return user_speed;
	}
	public void setUser_speed(int user_speed) {
		this.user_speed = user_speed;
	}
	public String getUser_attendrate() {
		return user_attendrate;
	}
	public void setUser_attendrate(String user_attendrate) {
		this.user_attendrate = user_attendrate;
	}
	public String getUser_attendtime() {
		return user_attendtime;
	}
	public void setUser_attendtime(String user_attendtime) {
		this.user_attendtime = user_attendtime;
	}
	public String getUser_goal() {
		return user_goal;
	}
	public void setUser_goal(String user_goal) {
		this.user_goal = user_goal;
	}

	@Override
	public String toString() {
		return "foot_user_DTO [user_email=" + user_email + ", user_pw="
				+ user_pw + ", user_name=" + user_name + ", user_birth="
				+ user_birth + ", user_age=" + user_age + ", user_phone="
				+ user_phone + ", user_high=" + user_high + ", user_weight="
				+ user_weight + ", user_foot=" + user_foot
				+ ", user_position1=" + user_position1 + ", user_position2="
				+ user_position2 + ", user_position3=" + user_position3
				+ ", user_address=" + user_address + ", user_profile="
				+ user_profile + ", user_team=" + user_team + ", user_helper="
				+ user_helper + ", user_enabled=" + user_enabled
				+ ", user_speed=" + user_speed + ", user_attendrate="
				+ user_attendrate + ", user_attendtime=" + user_attendtime
				+ ", user_goal=" + user_goal + ", x=" + x + ", y=" + y
				+ ", attack=" + attack + ", defender=" + defender + ", physic="
				+ physic + ", mind=" + mind + ", stamina=" + stamina + "]";
	}

}
