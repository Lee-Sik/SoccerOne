package soccer.co.DTO;

public class foot_sbooking_DTO {
	
	private int booking_seq;
	private int stadium_seq;
	private String stadium_name;
	private String booking_day;
	private String booking_area;
	private String rentalsum;
	private String rentalaccount;
	private String game1;
	private String game2;
	private String game3;
	private String game4;
	private String game5;
	private String game6;
	private String game7;
	private String mode;
	
	private int recordCountPerPage=5;	// ����Per������
	private int pageNumber=0;
	
	private int start=1;
	private int end=5;
	
	public int getBooking_seq() {
		return booking_seq;
	}
	public void setBooking_seq(int booking_seq) {
		this.booking_seq = booking_seq;
	}
	public int getStadium_seq() {
		return stadium_seq;
	}
	public void setStadium_seq(int stadium_seq) {
		this.stadium_seq = stadium_seq;
	}
	public String getStadium_name() {
		return stadium_name;
	}
	public void setStadium_name(String stadium_name) {
		this.stadium_name = stadium_name;
	}
	public String getBooking_day() {
		return booking_day;
	}
	public void setBooking_day(String booking_day) {
		this.booking_day = booking_day;
	}
	public String getBooking_area() {
		return booking_area;
	}
	public void setBooking_area(String booking_area) {
		this.booking_area = booking_area;
	}
	public String getRentalsum() {
		return rentalsum;
	}
	public void setRentalsum(String rentalsum) {
		this.rentalsum = rentalsum;
	}
	public String getRentalaccount() {
		return rentalaccount;
	}
	public void setRentalaccount(String rentalaccount) {
		this.rentalaccount = rentalaccount;
	}
	public String getGame1() {
		return game1;
	}
	public void setGame1(String game1) {
		this.game1 = game1;
	}
	public String getGame2() {
		return game2;
	}
	public void setGame2(String game2) {
		this.game2 = game2;
	}
	public String getGame3() {
		return game3;
	}
	public void setGame3(String game3) {
		this.game3 = game3;
	}
	public String getGame4() {
		return game4;
	}
	public void setGame4(String game4) {
		this.game4 = game4;
	}
	public String getGame5() {
		return game5;
	}
	public void setGame5(String game5) {
		this.game5 = game5;
	}
	public String getGame6() {
		return game6;
	}
	public void setGame6(String game6) {
		this.game6 = game6;
	}
	public String getGame7() {
		return game7;
	}
	public void setGame7(String game7) {
		this.game7 = game7;
	}
	public String getMode() {
		return mode;
	}
	public void setMode(String mode) {
		this.mode = mode;
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
	
	
}
