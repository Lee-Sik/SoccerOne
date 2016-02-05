package soccer.co.DTO;


public class foot_cal_DTO {
	private String team_name;
	private String yyyydd;
	private int year;
	private int month;
	private int dayOfWeek;
	private int lastday;
	private int day;
	
	public foot_cal_DTO(){}
	
	public foot_cal_DTO(int year, int month, int dayOfWeek, int lastday, int day) {
		super();
		this.year = year;
		this.month = month;
		this.dayOfWeek = dayOfWeek;
		this.lastday = lastday;
		this.day = day;
	}
	public String getTeam_name() {
		return team_name;
	}
	public void setId(String team_name) {
		this.team_name = team_name;
	}
	public String getYyyydd() {
		return yyyydd;
	}
	public void setYyyydd(String yyyydd) {
		this.yyyydd = yyyydd;
	}
	public int getYear() {
		return year;
	}
	public void setYear(int year) {
		this.year = year;
	}
	public int getMonth() {
		return month;
	}
	public void setMonth(int month) {
		this.month = month;
	}
	public int getDayOfWeek() {
		return dayOfWeek;
	}
	public void setDayOfWeek(int dayOfWeek) {
		this.dayOfWeek = dayOfWeek;
	}
	public int getLastday() {
		return lastday;
	}
	public void setLastday(int lastday) {
		this.lastday = lastday;
	}
	public int getDay() {
		return day;
	}
	public void setDay(int day) {
		this.day = day;
	}
	@Override
	public String toString() {
		return "cal_DTO [team_name=" + team_name + ", yyyydd=" + yyyydd + ", year=" + year + ", month=" + month + ", dayOfWeek="
				+ dayOfWeek + ", lastday=" + lastday + ", day=" + day + "]";
	}
	
	
}
