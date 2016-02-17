package soccer.co.DTO;

import java.io.Serializable;

/*
create table foot_bbs(                    --친선경기 게시판 
   bbs_no number primary key, --게시글 시퀀스
   topic varchar2(50) not null,         --글유형
   user_email varchar2(50) not null,    --작성자
   title varchar2(200) not null,		--굴제목
   content varchar2(4000) not null,		--글내용
   wdate date not null,					--작성일
   good number(8) not null,						--좋아요
   readcount number(8) not null,					--조회수
   imageurl varchar2(50) not null,  				--그림주소
   del number(8) not null,
   BBS_NO, TOPIC, USER_EMAIL, TITLE, CONTENT, WDATE, GOOD, READCOUNT, IMAGEURL, DEL
   CONSTRAINT FK_bbs FOREIGN KEY(user_email) REFERENCES foot_user(user_email)      
);

create sequence foot_bbs_seq
start with 1 increment by 1;


---------------����---------------------
DROP TABLE foot_bbs CASCADE CONSTRAINT;

DROP SEQUENCE foot_bbs_seq;

*/
public class foot_comunity_DTO implements Serializable{
	private int bbs_no;
	private String topic;
	private String user_email;
	private String title;
	private String content;
	private String wdate; //to_date 2015-07-23	
	private int good;
	private int readcount;
	private String imageurl;
	private int del;

	public foot_comunity_DTO() {
		
	}
	
	public foot_comunity_DTO(int bbs_no, String topic, String user_email, String title, String content, String wdate,
			int good, int readcount, String imageurl, int del) {
		super();
		this.bbs_no = bbs_no;
		this.topic = topic;
		this.user_email = user_email;
		this.title = title;
		this.content = content;
		this.wdate = wdate;
		this.good = good;
		this.readcount = readcount;
		this.imageurl = imageurl;
		this.del = del;
	}

	public int getBbs_no() {
		return bbs_no;
	}

	public void setBbs_no(int bbs_no) {
		this.bbs_no = bbs_no;
	}

	public String getTopic() {
		return topic;
	}

	public void setTopic(String topic) {
		this.topic = topic;
	}

	public String getUser_email() {
		return user_email;
	}

	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getWdate() {
		return wdate;
	}

	public void setWdate(String wdate) {
		this.wdate = wdate;
	}

	public int getGood() {
		return good;
	}

	public void setGood(int good) {
		this.good = good;
	}

	public int getReadcount() {
		return readcount;
	}

	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}

	public String getImageurl() {
		return imageurl;
	}

	public void setImageurl(String imageurl) {
		this.imageurl = imageurl;
	}

	public int getDel() {
		return del;
	}

	public void setDel(int del) {
		this.del = del;
	}
	

	

}
