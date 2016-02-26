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

import jdk.nashorn.internal.ir.RuntimeNode.Request;
import soccer.co.DTO.MATCHINGParam;
import soccer.co.DTO.RANKParam;
import soccer.co.DTO.foot_community_DTO;
import soccer.co.DTO.foot_game_DTO;
import soccer.co.DTO.foot_game_record;
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
	
	@RequestMapping(value = "publicms.do", method = {RequestMethod.GET,RequestMethod.POST})	
	public String pmatchingsearch(Model model) throws Exception {	
		logger.info("Welcome gameController pmatchingsearch! "+ new Date());
		
		model.addAttribute("title", "랭킹전 검색");
		return "pmatchingsearch.tiles";
	}
	
	@RequestMapping(value = "pmatchingsearchAf.do", method = {RequestMethod.GET,RequestMethod.POST})	
	public String pmatchingsearchAf(MATCHINGParam param,Model model) throws Exception {	
		logger.info("Welcome gameController pmatchingsearchAf! "+ new Date());
		
		List<foot_game_DTO> pmatchingsearchlist = fgameservice.getpmatchingsearchList(param);
		for(foot_game_DTO dto: pmatchingsearchlist){
			System.out.println(dto.toString());
		}
		model.addAttribute("pmatchingsearchlist", pmatchingsearchlist);
		
		model.addAttribute("title", "랭킹전 검색 결과");
		return "pmatchingsearch.tiles";
	}
	
	@RequestMapping(value = "freems.do", method = {RequestMethod.GET,RequestMethod.POST})	
	public String fmatchingsearch(Model model) throws Exception {	
		logger.info("Welcome gameController fmatchingsearch! "+ new Date());
		
		model.addAttribute("title", "친선경기 검색");
		return "fmatchingsearch.tiles";
	}
	
	@RequestMapping(value = "fmatchingsearchAf.do", method = {RequestMethod.GET,RequestMethod.POST})	
	public String fmatchingsearchAf(MATCHINGParam param,Model model) throws Exception {	
		logger.info("Welcome gameController fmatchingsearchAf! "+ new Date());
		
		List<foot_game_DTO> fmatchingsearchlist = fgameservice.getfmatchingsearchList(param);
		for(foot_game_DTO dto: fmatchingsearchlist){
			System.out.println(dto.toString());
		}
		model.addAttribute("fmatchingsearchlist", fmatchingsearchlist);
		
		model.addAttribute("title", "친선경기 검색 결과");
		return "fmatchingsearch.tiles";
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
		
		foot_game_DTO fgd = null;
		
		fgd = fgameservice.publicgame(fgdto);
		
		foot_game_record fgr = new foot_game_record();
		
		fgr.setGame_no(fgd.getGame_no());
		fgr.setGame_date(fgd.getGame_date());
		
		fgameservice.publicgamerecord(fgr);
			
		return "redirect:/kickoff.do";
	}
	
	@RequestMapping(value = "pmatchingdetail.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String pmatchingdetail(foot_game_DTO fgdto,Model model) throws Exception {
		logger.info("Welcome MemberController pmatchingdetail! "+ new Date());
		
		foot_game_DTO fgd = fgameservice.getPublicgamedetail(fgdto);

		model.addAttribute("pmd",fgd);
		model.addAttribute("title", "랭킹전 상세보기");
		
		return "pmatchingdetail.tiles";
	}
	
//	@RequestMapping(value = "publicgamerecordAf.do", method = {RequestMethod.GET,RequestMethod.POST})	
//	public String publicgamerecordAf(foot_game_DTO fgdto,Model model) throws Exception {	
//		logger.info("Welcome gameController publicgamerecordAf! "+ new Date());
//		
//		
//		return "redirect:/kickoff.do";
//	}
//	
	
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
	
	@RequestMapping(value = "fmatchingdetail.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String fmatchingdetail(foot_game_DTO fgdto,Model model) throws Exception {
		logger.info("Welcome MemberController fmatchingdetail! "+ new Date());
		
		foot_game_DTO fgd = fgameservice.getFreegamedetail(fgdto);
				
		model.addAttribute("fmd",fgd);
		model.addAttribute("title", "친선경기 상세보기");
		
		return "fmatchingdetail.tiles";
	}
	
	// Ranking Main
	@RequestMapping(value = "ranking.do", method = {RequestMethod.GET,RequestMethod.POST})	
	public String ranking( Model model) throws Exception {	
		logger.info("Welcome gameController ranking! "+ new Date());

		model.addAttribute("title", "랭킹");

		return "ranking.tiles";
	}
	
	
	@RequestMapping(value = "rankingAf.do", method = {RequestMethod.GET,RequestMethod.POST})	
	public String rankingAf(String team_location, RANKParam rank, Model model) throws Exception {	
		logger.info("Welcome gameController rankingAf! "+ new Date());
		
		System.out.println("team_location = " + team_location);
		
		rank.setTeam_location(team_location);
		
		List<RANKParam> rankinglist=fgameservice.getrankingList(rank);
		model.addAttribute("rankinglist", rankinglist);
		
		model.addAttribute("location", team_location);
		model.addAttribute("title", "순위표");

		return "rankingaf.tiles";
	}
	@RequestMapping(value = "rankapply.do", method = {RequestMethod.GET,RequestMethod.POST})	
	public String rankapply(foot_game_DTO fgdto, Model model) throws Exception {	
		logger.info("Welcome gameController rankapply! "+ new Date());
		
		foot_game_DTO fgd = fgameservice.getPublicgamedetail(fgdto);

		model.addAttribute("pmd",fgd);
		model.addAttribute("title", "랭킹전 상세보기");
		
		return "rankapply.tiles";
	}
	
}
