package soccer.co.controller;

import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import soccer.co.DTO.foot_cal_DTO;
import soccer.co.DTO.foot_calteam_DTO;
import soccer.co.DTO.foot_game_record;
import soccer.co.DTO.foot_team_DTO;
import soccer.co.DTO.foot_user_DTO;
import soccer.co.Service.foot_teamCalendarService;
import soccer.co.Service.foot_teamService;
import soccer.co.Service.foot_userService;

public class club_calController {

	@Autowired
	foot_teamCalendarService cs; 
	private static final Logger logger = LoggerFactory.getLogger(clubController.class);
	
	@RequestMapping(value="writecal.do",method={RequestMethod.POST,RequestMethod.GET})
	public String writecal(foot_cal_DTO cdto,HttpServletRequest request,Model model) throws Exception{
		logger.info("Welcome HelloMemberController writecal! "+ new Date());
		
		foot_cal_DTO cdtoclick = cs.writecal(cdto);
		request.getSession().setAttribute("cdtoclick", cdtoclick);
		return "writecal.tiles";
	}
	
	
	@RequestMapping(value="writecal1.do",method={RequestMethod.POST,RequestMethod.GET})
	public String writecal1(foot_calteam_DTO mcdto,HttpServletRequest request,Model model) throws Exception{
		logger.info("Welcome HelloMemberController writecal1! "+ new Date());
		System.out.println(mcdto.toString());
		foot_cal_DTO cdtoclick1= (foot_cal_DTO) request.getSession().getAttribute("cdtoclick");
		
		String year = cdtoclick1.getYear()+""; 
		int month2 = cdtoclick1.getMonth();
		int day2 = cdtoclick1.getDay();
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
		String yyyydd=year+month+day;
		
		String rdate = cdtoclick1.getYear()+""+month+""+day;
		mcdto.setRdate(rdate);
		
		cs.writecal1(mcdto);
		
		return "redirect:club.do";
	}
	
	
	@RequestMapping(value="caldetail.do",method={RequestMethod.POST,RequestMethod.GET})
	public String caldetail(foot_calteam_DTO mcdto,HttpServletRequest request,Model model) throws Exception{
		logger.info("Welcome HelloMemberController caldetail! "+ new Date());
		
		ArrayList<foot_calteam_DTO> caldetail = cs.caldetail(mcdto);
		System.out.println(caldetail.get(0).getRdate());
		model.addAttribute("caldetail", caldetail);
		
		
		
		return "caldetail.tiles";
	}
	
}
