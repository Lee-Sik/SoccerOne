package soccer.co.DTO;

import java.io.Serializable;

public class MATCHINGParam implements Serializable{
	
	private String game_location;
	private String game_date;
	private String suBground;
	private int game_state;
	private int pay1;
	private int pay2;
	public String getGame_location() {
		return game_location;
	}
	public void setGame_location(String game_location) {
		this.game_location = game_location;
	}
	public String getGame_date() {
		return game_date;
	}
	public void setGame_date(String game_date) {
		this.game_date = game_date;
	}
	public String getSuBground() {
		return suBground;
	}
	public void setSuBground(String suBground) {
		this.suBground = suBground;
	}
	public int getGame_state() {
		return game_state;
	}
	public void setGame_state(int game_state) {
		this.game_state = game_state;
	}
	public int getPay1() {
		return pay1;
	}
	public void setPay1(int pay1) {
		this.pay1 = pay1;
	}
	public int getPay2() {
		return pay2;
	}
	public void setPay2(int pay2) {
		this.pay2 = pay2;
	}
	

	
	
	
	
	

}
