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
		
		model.addAttribute("title", "KickOff");

		return "kickoff.tiles";
	}
	
	@RequestMapping(value = "matching.do", method = {RequestMethod.GET,RequestMethod.POST})	
	public String matching(Model model) throws Exception {	
		logger.info("Welcome gameController matching! "+ new Date());
		
		model.addAttribute("title", "매칭등록");
		return "matching.tiles";
	}
	
	@RequestMapping(value = "matchingsearch.do", method = {RequestMethod.GET,RequestMethod.POST})	
	public String matchingsearch(Model model) throws Exception {	
		logger.info("Welcome gameController matchingsearch! "+ new Date());
		
		model.addAttribute("title", "매칭검색");
		return "matchingsearch.tiles";
	}
	
	@RequestMapping(value = "matchingsearchAf.do", method = {RequestMethod.GET,RequestMethod.POST})	
	public String matchingsearchAf(foot_game_DTO fgdto,Model model) throws Exception {	
		logger.info("Welcome gameController matchingsearch! "+ new Date());
		
		List<foot_game_DTO> matchingsearchlist=fgameservice.getmatchingsearchList(fgdto);
		
		String game_location = fgdto.getGame_location();
		String game_date = fgdto.getGame_date();
		String ground = fgdto.getGround();
		String pay = fgdto.getPay();

		System.out.println(game_location);
		System.out.println(game_date);
		System.out.println(ground);
		System.out.println(pay);
		
		fgameservice.getmatchingsearchList(fgdto);
		
		model.addAttribute("matchingsearchlist", matchingsearchlist);
		
		model.addAttribute("title", "매칭 검색 결과");
		return "matchingsearch.tiles";
	}
	
	@RequestMapping(value = "publicgame.do", method = {RequestMethod.GET,RequestMethod.POST})	
	public String publicgame(Model model) throws Exception {	
		logger.info("Welcome gameController publicgame! "+ new Date());
		
		model.addAttribute("title", "랭킹전 등록");
		return "publicgame.tiles";
	}
	
	@RequestMapping(value = "publicgameAf.do", method = {RequestMethod.GET,RequestMethod.POST})	
	public String publicgameAf(foot_game_DTO fgdto,Model model) throws Exception {	
		logger.info("Welcome gameController publicgameAf! "+ new Date());
		
		fgameservice.publicgame(fgdto);
		
		return "redirect:/kickoff.do";
	}
	
	@RequestMapping(value = "freegame.do", method = {RequestMethod.GET,RequestMethod.POST})	
	public String freegame(Model model) throws Exception {	
		logger.info("Welcome gameController freegame! "+ new Date());
		
		model.addAttribute("title", "친선경기 등록");
		return "freegame.tiles";
	}
	
	@RequestMapping(value = "freegameAf.do", method = {RequestMethod.GET,RequestMethod.POST})	
	public String freegameAf(foot_game_DTO fgdto,Model model) throws Exception {	
		logger.info("Welcome gameController freegameAf! "+ new Date());
		
		fgameservice.freegame(fgdto);
		
		return "redirect:/kickoff.do";
	}
	
}
