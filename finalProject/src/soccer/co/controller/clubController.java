package soccer.co.controller;

import java.util.Date;

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
	public String join(foot_team_DTO team, HttpServletRequest request, Model model) throws Exception {	
		logger.info("clubController join!");
		//clubservice.join(team);
		return "team_create.tiles";
	}
	
}
