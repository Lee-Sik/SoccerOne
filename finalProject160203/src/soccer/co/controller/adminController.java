package soccer.co.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.omg.PortableInterceptor.USER_EXCEPTION;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import soccer.co.DTO.foot_team_DTO;
import soccer.co.DTO.foot_user_DTO;
import soccer.co.Service.foot_teamCalendarService;
import soccer.co.Service.foot_teamService;

@Controller
public class adminController {
	
	@Autowired
	foot_teamService clubservice;
	
	private static final Logger logger = LoggerFactory
			.getLogger(adminController.class);
	
	@RequestMapping(value = "adminInsertGame.do", method = { RequestMethod.GET,RequestMethod.POST })
	public String adminInsertGame(foot_team_DTO winTeam,foot_team_DTO loseTeam,HttpServletRequest request, Model model){

		HttpSession hs=request.getSession();
		foot_user_DTO user = (foot_user_DTO) hs.getAttribute("login");
		if(user==null || !user.getUser_email().equals("admin")){
			System.out.println("no Admin");
			 return "redirect:/noAdmin.do";
		}
		if(winTeam != null){
			System.out.println(winTeam.toString());
			model.addAttribute("winTeam");
		}
		if(loseTeam != null){
			System.out.println(loseTeam.toString());
		}
		
		
		
		return "adminInsertGame.tiles";
		
	}
	
	@RequestMapping(value = "noAdmin.do", method = { RequestMethod.GET,RequestMethod.POST })
	public String noAdmin(HttpServletRequest request, Model model){
		
		return "noAdmin.tiles";
	}
	
	@RequestMapping(value = "adminSearch.do", method = { RequestMethod.GET,RequestMethod.POST })
	public String adminSearch(HttpServletRequest request, Model model){
		
		return "adminSearch.tiles";
	}
	
	@RequestMapping(value = "adminInsertGameAf.do", method = { RequestMethod.GET,RequestMethod.POST })
	public String adminInsertGameSearch(HttpServletRequest request, Model model){
		//최종으로 기록을 insert 할 do
		
		return "adminInsertGameAf.tiles";
	}
	
	@RequestMapping(value = "searchTeam.do", method = { RequestMethod.GET,
			RequestMethod.POST })
	@ResponseBody
	public List<foot_team_DTO> searchTeam(@RequestParam("query") String query,HttpServletRequest req, Model model) {
		logger.info("searchTeam do!");
		
		
		List<foot_team_DTO> teamList = clubservice.searchTeam(query);
		
		return teamList;
	}
}
