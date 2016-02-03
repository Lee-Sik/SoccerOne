package soccer.co.controller;

import java.util.Date;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import soccer.co.DTO.foot_game_DTO;
import soccer.co.Service.foot_gameService;

@Controller
public class gameController {
	@Autowired
	foot_gameService fgameservice;
	
private static final Logger logger = LoggerFactory.getLogger(gameController.class);
	
	@RequestMapping(value = "kickoff.do", method = {RequestMethod.GET,RequestMethod.POST})	
	public String kickoff(Model model) throws Exception {	
		logger.info("Welcome gameController kickoff! "+ new Date());
		
		List<foot_game_DTO> freegamelist=fgameservice.getfreegameList();
		model.addAttribute("freegamelist", freegamelist);
		
		List<foot_game_DTO> publicgamelist=fgameservice.getpublicgameList();
		model.addAttribute("publicgamelist", publicgamelist);

		return "kickoff.tiles";
	}
	@RequestMapping(value = "matching.do", method = {RequestMethod.GET,RequestMethod.POST})	
	public String matching(Model model) throws Exception {	
		logger.info("Welcome gameController login! "+ new Date());
		
		return "matching.tiles";
	}
	
	@RequestMapping(value = "publicgame.do", method = {RequestMethod.GET,RequestMethod.POST})	
	public String publicgame(Model model) throws Exception {	
		logger.info("Welcome gameController login! "+ new Date());
		
		return "publicgame.tiles";
	}
	
	@RequestMapping(value = "publicgameAf.do", method = {RequestMethod.GET,RequestMethod.POST})	
	public String publicgameAf(foot_game_DTO fgdto,Model model) throws Exception {	
		logger.info("Welcome gameController login! "+ new Date());
		
		fgameservice.publicgame(fgdto);
		
		return "redirect:/kickoff.do";
	}
	
	@RequestMapping(value = "freegame.do", method = {RequestMethod.GET,RequestMethod.POST})	
	public String freegame(Model model) throws Exception {	
		logger.info("Welcome gameController login! "+ new Date());
		
		return "freegame.tiles";
	}
	
	@RequestMapping(value = "freegameAf.do", method = {RequestMethod.GET,RequestMethod.POST})	
	public String freegameAf(foot_game_DTO fgdto,Model model) throws Exception {	
		logger.info("Welcome gameController login! "+ new Date());
		
		fgameservice.freegame(fgdto);
		
		return "redirect:/kickoff.do";
	}
	
}
