package soccer.co.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import soccer.co.DTO.foot_team_DTO;
import soccer.co.Service.foot_clubService;


@Controller
public class clubController {
	
	@Autowired
    foot_clubService clubservice;
	
	private static final Logger logger = LoggerFactory.getLogger(clubController.class);
	
	@RequestMapping(value = "team_create.do", method = {RequestMethod.GET,RequestMethod.POST})	
	public String join(Model model) throws Exception {	
		logger.info("clubController join!");
		model.addAttribute("list",clubservice.getGu());

		model.addAttribute("title", "클럽 생성");
		return "team_create.tiles";
	}
	
	@RequestMapping(value = "club.do", method = {RequestMethod.GET,RequestMethod.POST})	
	public String club(Model model) throws Exception {	
		logger.info("clubController join!");
		
		model.addAttribute("title", "마이 클럽");
		return "team_club.tiles";
	}
	
	@RequestMapping(value = "createTeamAf.do", method = {RequestMethod.GET,RequestMethod.POST})	
	public String joinAf(foot_team_DTO team, Model model) throws Exception {	
		logger.info("clubController join!");
		clubservice.join(team);//팀생성 실패시 어떻게 할까?
		return "team_createAf.tiles";
	}
	
}
