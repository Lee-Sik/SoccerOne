package soccer.co.DTO;

import java.io.Serializable;

/*
create table foot_bbs_comment(                    --친선경기 게시판 
   comment_no number primary key, --게시글 시퀀스
   parent_bbs_no number not null, --게시글 시퀀스
   user_email varchar2(50) not null,    --작성자
   content varchar2(4000) not null,		--글내용
   wdate date not null,					--작성일
   del number(8) not null,
   CONSTRAINT FK_bbs_parent_bbs_no FOREIGN KEY(parent_bbs_no) REFERENCES foot_bbs(bbs_no)      
);

create sequence foot_comment_seq
start with 1 increment by 1;


---------------����---------------------
DROP TABLE foot_bbs CASCADE CONSTRAINT;

DROP SEQUENCE foot_bbs_seq;

*/
public class foot_comment_DTO implements Serializable{
	private int comment_no;
	private int parent_bbs_no;
	private String user_email;
	private String content;
	private String wdate; //to_date 2015-07-23	
	private int del;
	private String user_profile;

	public foot_comment_DTO() {
		
	}

	public foot_comment_DTO(int comment_no, int parent_bbs_no, String user_email, String content, String wdate,
			int del) {
		super();
		this.comment_no = comment_no;
		this.parent_bbs_no = parent_bbs_no;
		this.user_email = user_email;
		this.content = content;
		this.wdate = wdate;
		this.del = del;
	}
	
	public foot_comment_DTO(int comment_no, int parent_bbs_no, String user_email, String content, String wdate,
			int del, String user_profile) {
		super();
		this.comment_no = comment_no;
		this.parent_bbs_no = parent_bbs_no;
		this.user_email = user_email;
		this.content = content;
		this.wdate = wdate;
		this.del = del;
		this.user_profile = user_profile;
	}

	public int getComment_no() {
		return comment_no;
	}

	public void setComment_no(int comment_no) {
		this.comment_no = comment_no;
	}

	public int getParent_bbs_no() {
		return parent_bbs_no;
	}

	public void setParent_bbs_no(int parent_bbs_no) {
		this.parent_bbs_no = parent_bbs_no;
	}

	public String getUser_email() {
		return user_email;
	}

	public void setUser_email(String user_email) {
		this.user_email = user_email;
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

	public int getDel() {
		return del;
	}

	public void setDel(int del) {
		this.del = del;
	}

	public String getUser_profile() {
		return user_profile;
	}

	public void setUser_profile(String user_profile) {
		this.user_profile = user_profile;
	}

	
	
}
