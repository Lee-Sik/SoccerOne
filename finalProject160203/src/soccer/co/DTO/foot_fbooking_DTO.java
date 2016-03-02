package soccer.co.DTO;

/*create table foot_free_booking(		
	free_b_seq number primary key,          --게시판 번호
	user_email varchar2(50) not null,	      --양수인/양도인 user_email과 forgin
  user_name varchar2(30) not null,
	free_b_addr varchar(100) not null,	      --장소
	free_b_sendrecieve varchar2(30) not null,  --양도or양수 말머리
	free_b_location varchar2(50) not null,	  --지역
	free_b_title varchar2(100) not null,
	free_b_content clob not null,         --내용
	free_b_date	varchar2(50) not null,		  --날짜
  free_b_hit number,
  free_b_manager number,
	constraint fk_free_booking foreign key(user_email) references foot_user(user_email)
);*/

public class foot_fbooking_DTO {
	
	private int free_b_seq;
	private String user_email;
	private String user_name;
	private String free_b_addr;
	private String free_b_sendrecieve;
	private String free_b_location;
	private String free_b_title;
	private String free_b_content;
	private String free_b_date;
	private int free_b_hit;
	private int free_b_manager;
	
	private String searchKey;
	private String searchValue;
	
	
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public int getFree_b_hit() {
		return free_b_hit;
	}
	public void setFree_b_hit(int free_b_hit) {
		this.free_b_hit = free_b_hit;
	}
	public int getFree_b_seq() {
		return free_b_seq;
	}
	public void setFree_b_seq(int free_b_seq) {
		this.free_b_seq = free_b_seq;
	}
	public String getUser_email() {
		return user_email;
	}
	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
	public String getFree_b_addr() {
		return free_b_addr;
	}
	public void setFree_b_addr(String free_b_addr) {
		this.free_b_addr = free_b_addr;
	}
	public String getFree_b_sendrecieve() {
		return free_b_sendrecieve;
	}
	public void setFree_b_sendrecieve(String free_b_sendrecieve) {
		this.free_b_sendrecieve = free_b_sendrecieve;
	}
	public String getFree_b_location() {
		return free_b_location;
	}
	public void setFree_b_location(String free_b_location) {
		this.free_b_location = free_b_location;
	}
	public String getFree_b_title() {
		return free_b_title;
	}
	public void setFree_b_title(String free_b_title) {
		this.free_b_title = free_b_title;
	}
	public String getFree_b_content() {
		return free_b_content;
	}
	public void setFree_b_content(String free_b_content) {
		this.free_b_content = free_b_content;
	}
	public String getFree_b_date() {
		return free_b_date;
	}
	public void setFree_b_date(String free_b_date) {
		this.free_b_date = free_b_date;
	}
	public int getFree_b_manager() {
		return free_b_manager;
	}
	public void setFree_b_manager(int free_b_manager) {
		this.free_b_manager = free_b_manager;
	}
	public String getSearchKey() {
		return searchKey;
	}
	public void setSearchKey(String searchKey) {
		this.searchKey = searchKey;
	}
	public String getSearchValue() {
		return searchValue;
	}
	public void setSearchValue(String searchValue) {
		this.searchValue = searchValue;
	}
	
	
}
