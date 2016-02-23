package soccer.co.DTO;

import java.sql.Date;
/*
drop table foot_message
cascade CONSTRAINTS;
drop SEQUENCE no_message;

create table foot_message(
  no number(8) primary key,
  sender_user_email varchar2(20) not null,
  message_type varchar2(20) not null,
  receiver_user_email varchar(20) not null,
  message_read number(8) not null,
  wdate date not null,
  message varchar2(4000)
);

create SEQUENCE no_message
start with 1 increment by 1;

alter table foot_message
add CONSTRAINT fk_foot_message1_id foreign key(sender_user_email)
references foot_user(user_email);

alter table foot_message
add CONSTRAINT fk_foot_message2_id foreign key(receiver_user_email)
references foot_user(user_email);

select*from foot_message;
 */

public class foot_message_DTO {
	private int no;
	private String sender_user_email;
	private String message_type;
	private String receiver_user_email;
	private int message_read;
	private Date wdate;
	private String message;
	
	public foot_message_DTO(){}

	public foot_message_DTO(int no, String sender_user_email, String message_type, String receiver_user_email,
			int message_read, Date wdate, String message) {
		super();
		this.no = no;
		this.sender_user_email = sender_user_email;
		this.message_type = message_type;
		this.receiver_user_email = receiver_user_email;
		this.message_read = message_read;
		this.wdate = wdate;
		this.message = message;
	}

	@Override
	public String toString() {
		return "foot_message_DTO [no=" + no + ", sender_user_email=" + sender_user_email + ", message_type="
				+ message_type + ", receiver_user_email=" + receiver_user_email + ", message_read=" + message_read
				+ ", wdate=" + wdate + ", message=" + message + "]";
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getSender_user_email() {
		return sender_user_email;
	}

	public void setSender_user_email(String sender_user_email) {
		this.sender_user_email = sender_user_email;
	}

	public String getMessage_type() {
		return message_type;
	}

	public void setMessage_type(String message_type) {
		this.message_type = message_type;
	}

	public String getReceiver_user_email() {
		return receiver_user_email;
	}

	public void setReceiver_user_email(String receiver_user_email) {
		this.receiver_user_email = receiver_user_email;
	}

	public int getMessage_read() {
		return message_read;
	}

	public void setMessage_read(int message_read) {
		this.message_read = message_read;
	}

	public Date getWdate() {
		return wdate;
	}

	public void setWdate(Date wdate) {
		this.wdate = wdate;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}
	
	
	
	
	
	
}
