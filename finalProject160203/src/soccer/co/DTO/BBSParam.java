package soccer.co.DTO;

import java.io.Serializable;

/*
CREATE TABLE BBS(
SEQ NUMBER(8) PRIMARY KEY,
ID VARCHAR2(50) NOT NULL,
REF NUMBER(8) NOT NULL,
STEP NUMBER(8) NOT NULL,
DEPTH NUMBER(8) NOT NULL,
TITLE VARCHAR2(200) NOT NULL,
CONTENT VARCHAR2(4000) NOT NULL,
WDATE DATE NOT NULL,
PARENT NUMBER(8) NOT NULL,
DEL NUMBER(1) NOT NULL,     
READCOUNT NUMBER(8) NOT NULL
);
--DEL-> 0:������, 1:����

CREATE SEQUENCE SEQ_BBS
START WITH 1 INCREMENT BY 1;

ALTER TABLE BBS
ADD CONSTRAINT FK_BBS_ID FOREIGN KEY(ID)
REFERENCES MEMBER(ID);

SELECT * FROM BBS;

------------------------------------
DROP TABLE BBS CASCADE CONSTRAINT;

DROP SEQUENCE SEQ_BBS;

*/
public class BBSParam implements Serializable{
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
	
	
	//------------paging & searching
	private String s_category;	// ����
	private String s_keyword;	// �˻��� �ܾ�
	
	private int recordCountPerPage=10;	// ����Per������
	private int pageNumber=0;
	
	private int start=1;
	private int end=10;
	
	public int getStart() {
		return start;
	}

	public void setStart(int start) {
		this.start = start;
	}

	public int getEnd() {
		return end;
	}

	public void setEnd(int end) {
		this.end = end;
	}

	public String getS_category() {
		return s_category;
	}

	public void setS_category(String s_category) {
		this.s_category = s_category;
	}

	public String getS_keyword() {
		return s_keyword;
	}

	public void setS_keyword(String s_keyword) {
		this.s_keyword = s_keyword;
	}

	public int getRecordCountPerPage() {
		return recordCountPerPage;
	}

	public void setRecordCountPerPage(int recordCountPerPage) {
		this.recordCountPerPage = recordCountPerPage;
	}

	public int getPageNumber() {
		return pageNumber;
	}

	public void setPageNumber(int pageNumber) {
		this.pageNumber = pageNumber;
	}


	public BBSParam() {
		
	}

	public BBSParam(int bbs_no, String user_email, String title, String content, String wdate) {
		super();
		this.bbs_no = bbs_no;
		this.user_email = user_email;
		this.title = title;
		this.content = content;
		this.wdate = wdate;
	}
	
	public BBSParam(int bbs_no, String topic, String user_email, String title, String content, String wdate, int good,
			int readcount, String imageurl, int del) {
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

	public BBSParam(int bbs_no, String user_email, String title, String content, String wdate, int del,
			int readcount) {
		super();
		this.bbs_no = bbs_no;
		this.user_email = user_email;
		this.title = title;
		this.content = content;
		this.wdate = wdate;
		this.del = del;
		this.readcount = readcount;
	}
	
	public BBSParam(String user_email, String title, String content) {
		super();
		this.user_email = user_email;
		this.title = title;
		this.content = content;
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
