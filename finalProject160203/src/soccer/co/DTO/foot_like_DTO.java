package soccer.co.DTO;

import java.io.Serializable;

/*
create table foot_bbs_like(                    --친선경기 게시판 
   parent_bbs_no number not null, --게시글 시퀀스
   user_email varchar2(50) not null,    --작성자
   CONSTRAINT FK_parent_bbs_no FOREIGN KEY(parent_bbs_no) REFERENCES foot_bbs(bbs_no)      
);

*/
public class foot_like_DTO implements Serializable{
	private int parent_bbs_no;
	private int parent_gallery_no;
	private String user_email;

	public foot_like_DTO() {
		
	}

	public foot_like_DTO(int parent_bbs_no, int parent_gallery_no, String user_email) {
		super();
		this.parent_bbs_no = parent_bbs_no;
		this.parent_gallery_no = parent_gallery_no;
		this.user_email = user_email;
	}

	public int getParent_bbs_no() {
		return parent_bbs_no;
	}

	public void setParent_bbs_no(int parent_bbs_no) {
		this.parent_bbs_no = parent_bbs_no;
	}
	
	public int getParent_gallery_no() {
		return parent_gallery_no;
	}

	public void setParent_gallery_no(int parent_gallery_no) {
		this.parent_gallery_no = parent_gallery_no;
	}

	public String getUser_email() {
		return user_email;
	}

	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}

	@Override
	public String toString() {
		return "foot_like_DTO [parent_bbs_no=" + parent_bbs_no + ", user_email=" + user_email + "]";
	}

	
	
}
