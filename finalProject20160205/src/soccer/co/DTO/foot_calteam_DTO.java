package soccer.co.DTO;

import java.io.Serializable;
import java.sql.Date;
import java.util.Calendar;

/*
drop table foot_calteam
cascade CONSTRAINTS;
drop SEQUENCE no_calteam;

create table foot_calteam(
  no number(8) primary key,
  team_name varchar2(20) not null,
  textname varchar2(200) not null,
  location varchar(200) not null,
  text varchar2(4000) not null,
  wdate date not null,
  rdate varchar2(12) not null
);

create SEQUENCE no_calteam
start with 1 increment by 1;

alter table foot_calteam
add CONSTRAINT fk_calteam_id foreign key(team_name)
references foot_team(team_name);

select*from foot_calteam;
 */

public class foot_calteam_DTO implements Serializable{
	
	private int no;
	
	private String team_name;
	private String location;
	private String textname;
	private String text;
	private String rdate;
	private Date wdate;
	
	
	public foot_calteam_DTO(){}

	public foot_calteam_DTO(int no, String team_name, String location, String textname, String text, String rdate, Date wdate) {
		super();
		this.no = no;
		this.team_name = team_name;
		this.location = location;
		this.textname = textname;
		this.text = text;
		this.rdate = rdate;
		this.wdate = wdate;
	}

	public foot_calteam_DTO(String team_name, String location, String textname, String text, String rdate,Date wdate) {
		super();
		this.team_name = team_name;
		this.location = location;
		this.textname = textname;
		this.text = text;
		this.rdate = rdate;
		this.wdate = wdate;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getTeam_name() {
		return team_name;
	}

	public void setId(String team_name) {
		this.team_name = team_name;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getTextname() {
		return textname;
	}

	public void setTextname(String textname) {
		this.textname = textname;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public String getRdate() {
		return rdate;
	}

	public void setRdate(String rdate) {
		this.rdate = rdate;
	}

	public Date getWdate() {
		return wdate;
	}

	public void setWdate(Date wdate) {
		this.wdate = wdate;
	}

	@Override
	public String toString() {
		return "mycal_DTO [no=" + no + ", id=" + team_name + ", location=" + location + ", textname=" + textname + ", text="
				+ text + ", rdate=" + rdate + ", wdate=" + wdate + "]";
	}

	
	
	
	

}
