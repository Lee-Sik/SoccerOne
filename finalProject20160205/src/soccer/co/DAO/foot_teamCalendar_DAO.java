package soccer.co.DAO;

import java.util.ArrayList;
import java.util.Calendar;

import javax.websocket.Session;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMapping;

import soccer.co.DTO.foot_cal_DTO;
import soccer.co.DTO.foot_teamcal_DTO;

@Repository
public class foot_teamCalendar_DAO {
	
	@Autowired
	SqlSession sqlse;
	
	String ns = "cal.";
	
	public boolean nvl(String msg){
		return msg==null ||msg.trim().equals("")?true:false;
	}
	
	public foot_cal_DTO makecal1(){
		Calendar cal = Calendar.getInstance();
		cal.set(Calendar.DATE, 1);
		
		foot_cal_DTO cdto = new foot_cal_DTO();

		
		int year = cal.get(Calendar.YEAR);
		int month = cal.get(Calendar.MONTH)+1;
		
		if(month<1){
			month=12;
			year--;
		}
		if(month>12){
			month=1;
			year++;
		}

		cal.set(year, month-1,1);

		int dayOfWeek = cal.get(Calendar.DAY_OF_WEEK);//1~7사이의 숫자가 넘어온다.
		int lastday = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
		cdto.setYear(year);
		cdto.setDayOfWeek(dayOfWeek);
		cdto.setLastday(lastday);
		cdto.setMonth(month);
		
		String sf = String.format("%d년 %d월", year, month);
		String sleft = String.format("calendar.jsp?year=%d&month=%d", year, month-1);
		String sright = String.format("calendar.jsp?year=%d&month=%d", year, month+1);
		String month2 = "";
		if(month<10){
			 month2 = "0"+month;
		}
		else{
			 month2 = month+"";
		}
		return cdto;
	}
	
	public foot_cal_DTO makecal(foot_cal_DTO cdto1){
		Calendar cal = Calendar.getInstance();
		cal.set(Calendar.DATE, 1);
		
		foot_cal_DTO cdto = new foot_cal_DTO();

		String syear = ""+cdto1.getYear();
		String smonth = ""+cdto1.getMonth();

		int year = cal.get(Calendar.YEAR);
		if(!nvl(syear)){
			year = Integer.parseInt(syear);
		}
		int month = cal.get(Calendar.MONTH)+1;
		if(!nvl(smonth)){
			month = Integer.parseInt(smonth);
		}
		if(month<1){
			month=12;
			year--;
		}
		if(month>12){
			month=1;
			year++;
		}

		cal.set(year, month-1,1);

		int dayOfWeek = cal.get(Calendar.DAY_OF_WEEK);//1~7사이의 숫자가 넘어온다.
		int lastday = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
		cdto.setYear(year);
		cdto.setDayOfWeek(dayOfWeek);
		cdto.setLastday(lastday);
		cdto.setMonth(month);
		
		String sf = String.format("%d년 %d월", year, month);
		String sleft = String.format("calendar.jsp?year=%d&month=%d", year, month-1);
		String sright = String.format("calendar.jsp?year=%d&month=%d", year, month+1);
		String month2 = "";
		if(month<10){
			 month2 = "0"+month;
		}
		else{
			 month2 = month+"";
		}
		return cdto;
	}
	
	public foot_cal_DTO sleft(foot_cal_DTO cdto){
		cdto.setYear(cdto.getYear());
		cdto.setMonth(cdto.getMonth()-1);
		return cdto;
	}
	
	public foot_cal_DTO sright(foot_cal_DTO cdto){
		cdto.setYear(cdto.getYear());
		cdto.setMonth(cdto.getMonth()+1);
		return cdto;
	}
	
	
		
	
	public ArrayList<foot_teamcal_DTO> getmycal(foot_cal_DTO cdto) throws Exception{
		ArrayList<foot_teamcal_DTO> getmycal = (ArrayList<foot_teamcal_DTO>) sqlse.selectList("getcal", cdto);
		return getmycal;
		// TODO Auto-generated method stub
		
	}

	public foot_cal_DTO writecal(foot_cal_DTO cdto) {
		// TODO Auto-generated method stub
		String year = cdto.getYear()+""; 
		int month2 = cdto.getMonth();
		int day2 = cdto.getDay();
		String month="";
		String day="";
		if(month2<10){
			 month = "0"+month2;
		}
		else{
			 month = month2+"";
		}
		if(day2<10){
			 day = "0"+day2;
		}
		else{
			 day = day2+"";
		}	
		foot_cal_DTO cdto1 = new foot_cal_DTO();
		cdto1.setDay(Integer.parseInt(day));
		cdto1.setMonth(Integer.parseInt(month));
		cdto1.setYear(Integer.parseInt(year));
		return cdto1;
	}

	public boolean writecal1(foot_teamcal_DTO mcdto) {
		// TODO Auto-generated method stub
		sqlse.insert(ns+"writecal",mcdto);
		
		return true;
	}
	
	public ArrayList<foot_teamcal_DTO> caldetail(foot_teamcal_DTO mcdto) {
		// TODO Auto-generated method stub
		ArrayList<foot_teamcal_DTO> caldetaillst = (ArrayList<foot_teamcal_DTO>)sqlse.selectList(ns+"caldetail",mcdto);
		
		return caldetaillst;
	}

	public foot_teamcal_DTO caldetail1(foot_teamcal_DTO mcdto) {
		// TODO Auto-generated method stub
		
		return (foot_teamcal_DTO) sqlse.selectOne(ns+"caldetail1", mcdto);
	}
}
