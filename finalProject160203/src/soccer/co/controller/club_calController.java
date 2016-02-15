package soccer.co.controller;

import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import soccer.co.DTO.foot_cal_DTO;
import soccer.co.DTO.foot_teamcal_DTO;
import soccer.co.DTO.foot_game_record;
import soccer.co.DTO.foot_team_DTO;
import soccer.co.DTO.foot_user_DTO;
import soccer.co.Service.foot_teamCalendarService;
import soccer.co.Service.foot_teamService;
import soccer.co.Service.foot_userService;

@Controller
public class club_calController {

	@Autowired
	foot_teamCalendarService cs; 
	
	private static final Logger logger = LoggerFactory.getLogger(club_calController.class);
	
	@RequestMapping(value="writecal.do",method={RequestMethod.POST,RequestMethod.GET})
	public String writecal(foot_cal_DTO cdto,HttpServletRequest request,Model model) throws Exception{
		logger.info("Welcome HelloMemberController writecal! "+ new Date());
		
		foot_cal_DTO cdtoclick = cs.writecal(cdto);
		request.getSession().setAttribute("cdtoclick", cdtoclick);
		return "writecal.tiles";
	}
	
	
	@RequestMapping(value="writecal1.do",method={RequestMethod.POST,RequestMethod.GET})
	public String writecal1(foot_teamcal_DTO mcdto,HttpServletRequest request,Model model) throws Exception{
		logger.info("Welcome HelloMemberController writecal1! "+ new Date());
		
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
		
		return "exit1.tiles";
	}
	
	
	@RequestMapping(value="caldetail.do",method={RequestMethod.POST,RequestMethod.GET})
	public String caldetail(foot_teamcal_DTO mcdto,HttpServletRequest request,Model model) throws Exception{
		logger.info(mcdto.toString()+"Welcome HelloMemberController caldetail! "+ new Date());
		
		ArrayList<foot_teamcal_DTO> caldetail = cs.caldetail(mcdto);
		model.addAttribute("caldetail", caldetail);
		return "caldetail.tiles";
	}
	
	@RequestMapping(value="caldetail1.do",method={RequestMethod.POST,RequestMethod.GET})
	public String caldetail1(foot_teamcal_DTO mcdto1,HttpServletRequest request,Model model) throws Exception{
		logger.info("Welcome HelloMemberController caldetail1! "+ new Date());
		
		foot_teamcal_DTO mcdto = cs.caldetail1(mcdto1);
		model.addAttribute("caldetail1", mcdto);
		return "caldetail1.tiles";
	}
	
}
