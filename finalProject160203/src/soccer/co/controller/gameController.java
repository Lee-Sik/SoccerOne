package soccer.co.controller;

import java.io.File;
import java.io.FileReader;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import au.com.bytecode.opencsv.CSVReader;
import jdk.nashorn.internal.ir.RuntimeNode.Request;
import sist.co.help.CSVWrite;
import soccer.co.DTO.MATCHINGParam;
import soccer.co.DTO.RANKParam;
import soccer.co.DTO.foot_community_DTO;
import soccer.co.DTO.foot_game_DTO;
import soccer.co.DTO.foot_game_record;
import soccer.co.DTO.foot_user_DTO;
import soccer.co.Service.foot_gameService;
import soccer.co.Service.foot_teamService;

@Controller
public class gameController {
	@Autowired
	foot_gameService fgameservice;

	@Autowired
	foot_teamService clubservice;

	private static final Logger logger = LoggerFactory.getLogger(gameController.class);

	@RequestMapping(value = "kickoff.do", method = {RequestMethod.GET,RequestMethod.POST })
	public String kickoff(Model model, HttpServletRequest request) throws Exception {
		logger.info("Welcome gameController kickoff! " + new Date());
		foot_user_DTO jyfudto = (foot_user_DTO) request.getSession().getAttribute("login");

		if (jyfudto == null) {
			return "redirect:loginpopup1.do";
		} else {

			List<foot_game_DTO> freegamelist = fgameservice.getfreegameList();
			model.addAttribute("freegamelist", freegamelist);

			List<foot_game_DTO> publicgamelist = fgameservice.getpublicgameList();
			model.addAttribute("publicgamelist", publicgamelist);

			///////// 읽기///////////////
			List<String[]> dataAll = new ArrayList<String[]>();
			
			//String path = request.getRealPath("/");
			//File file = new File(path + "data/test3.csv");
			//System.out.println("req path == "+path);
			File file = new File("C:/springstudy/finalProject160203/WebContent/data/test3.csv");

			CSVReader reader = new CSVReader(new FileReader(file));
			// UTF-8
			// CSVReader reader = new CSVReader(new InputStreamReader(new
			// FileInputStream(filename), "UTF-8"), ",", '"', 1);
			String[] str;
			while ((str = reader.readNext()) != null) {
				dataAll.add(str);
				//System.out.println(str[3]);
			}
			///////// 읽기///////////////

			List<RANKParam> rank = clubservice.getAllTeamLeague();// 모든 팀 리그
			// 종로구/중구/용산구/성동구/광진구/동대문구/중랑구/성북구/강북구/도봉구/노원구/은평구/서대문구/마포구
			// 양천구/강서구/구로구/금천구/영등포구/동작구/관악구/서초구/강남구/송파구/강동구

			int[] guPopulation = new int[25];// 구별로 전체 인구수 저장 할 배열
			int[] highRankPopulation = new int[25];// 구별로 상위리그 인구수 저장 할 배열
			int[] midRankPopulation = new int[25];// 구별로 중위리그 인구수 저장 할 배열
			int[] lowRankPopulation = new int[25];// 구별로 하위리그 인구수 저장 할 배열
			// 구별로 등수를 저장할 배열
			int[] rankPopulation = { 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 };
			// System.out.println("rank"+rank.size());
			List<RANKParam> highRank = rank.subList(0, (int) ((rank.size() - 1) * 0.1));// 상위
																						// 10%

			for (RANKParam tmp : highRank) {
				if (tmp.getTeam_location().equals("종로구")) {
					highRankPopulation[0]++;
				}
				if (tmp.getTeam_location().equals("중구")) {
					highRankPopulation[1]++;
				}
				if (tmp.getTeam_location().equals("용산구")) {
					highRankPopulation[2]++;
				}
				if (tmp.getTeam_location().equals("성동구")) {
					highRankPopulation[3]++;
				}
				if (tmp.getTeam_location().equals("광진구")) {
					highRankPopulation[4]++;
				}
				if (tmp.getTeam_location().equals("동대문구")) {
					highRankPopulation[5]++;
				}
				if (tmp.getTeam_location().equals("중랑구")) {
					highRankPopulation[6]++;
				}
				if (tmp.getTeam_location().equals("성북구")) {
					highRankPopulation[7]++;
				}
				if (tmp.getTeam_location().equals("강북구")) {
					highRankPopulation[8]++;
				}
				if (tmp.getTeam_location().equals("도봉구")) {
					highRankPopulation[9]++;
				}
				if (tmp.getTeam_location().equals("노원구")) {
					highRankPopulation[10]++;
				}
				if (tmp.getTeam_location().equals("은평구")) {
					highRankPopulation[11]++;
				}
				if (tmp.getTeam_location().equals("서대문구")) {
					highRankPopulation[12]++;
				}
				if (tmp.getTeam_location().equals("마포구")) {
					highRankPopulation[13]++;
				}
				if (tmp.getTeam_location().equals("양천구")) {
					highRankPopulation[14]++;
				}
				if (tmp.getTeam_location().equals("강서구")) {
					highRankPopulation[15]++;
				}
				if (tmp.getTeam_location().equals("구로구")) {
					highRankPopulation[16]++;
				}
				if (tmp.getTeam_location().equals("금천구")) {
					highRankPopulation[17]++;
				}
				if (tmp.getTeam_location().equals("영등포구")) {
					highRankPopulation[18]++;
				}
				if (tmp.getTeam_location().equals("동작구")) {
					highRankPopulation[19]++;
				}
				if (tmp.getTeam_location().equals("관악구")) {
					highRankPopulation[20]++;
				}
				if (tmp.getTeam_location().equals("서초구")) {
					highRankPopulation[21]++;
				}
				if (tmp.getTeam_location().equals("강남구")) {
					highRankPopulation[22]++;
				}
				if (tmp.getTeam_location().equals("송파구")) {
					highRankPopulation[23]++;
				}
				if (tmp.getTeam_location().equals("강동구")) {
					highRankPopulation[24]++;
				}
			}

			List<RANKParam> midRank = rank.subList(highRank.size(), highRank.size() + (int) ((rank.size() - 1) * 0.3));// 10~40%

			for (RANKParam tmp : midRank) {
				if (tmp.getTeam_location().equals("종로구")) {
					midRankPopulation[0]++;
				}
				if (tmp.getTeam_location().equals("중구")) {
					midRankPopulation[1]++;
				}
				if (tmp.getTeam_location().equals("용산구")) {
					midRankPopulation[2]++;
				}
				if (tmp.getTeam_location().equals("성동구")) {
					midRankPopulation[3]++;
				}
				if (tmp.getTeam_location().equals("광진구")) {
					midRankPopulation[4]++;
				}
				if (tmp.getTeam_location().equals("동대문구")) {
					midRankPopulation[5]++;
				}
				if (tmp.getTeam_location().equals("중랑구")) {
					midRankPopulation[6]++;
				}
				if (tmp.getTeam_location().equals("성북구")) {
					midRankPopulation[7]++;
				}
				if (tmp.getTeam_location().equals("강북구")) {
					midRankPopulation[8]++;
				}
				if (tmp.getTeam_location().equals("도봉구")) {
					midRankPopulation[9]++;
				}
				if (tmp.getTeam_location().equals("노원구")) {
					midRankPopulation[10]++;
				}
				if (tmp.getTeam_location().equals("은평구")) {
					midRankPopulation[11]++;
				}
				if (tmp.getTeam_location().equals("서대문구")) {
					midRankPopulation[12]++;
				}
				if (tmp.getTeam_location().equals("마포구")) {
					midRankPopulation[13]++;
				}
				if (tmp.getTeam_location().equals("양천구")) {
					midRankPopulation[14]++;
				}
				if (tmp.getTeam_location().equals("강서구")) {
					midRankPopulation[15]++;
				}
				if (tmp.getTeam_location().equals("구로구")) {
					midRankPopulation[16]++;
				}
				if (tmp.getTeam_location().equals("금천구")) {
					midRankPopulation[17]++;
				}
				if (tmp.getTeam_location().equals("영등포구")) {
					midRankPopulation[18]++;
				}
				if (tmp.getTeam_location().equals("동작구")) {
					midRankPopulation[19]++;
				}
				if (tmp.getTeam_location().equals("관악구")) {
					midRankPopulation[20]++;
				}
				if (tmp.getTeam_location().equals("서초구")) {
					midRankPopulation[21]++;
				}
				if (tmp.getTeam_location().equals("강남구")) {
					midRankPopulation[22]++;
				}
				if (tmp.getTeam_location().equals("송파구")) {
					midRankPopulation[23]++;
				}
				if (tmp.getTeam_location().equals("강동구")) {
					midRankPopulation[24]++;
				}
			}
			// System.out.println("midRank"+midRank.size());
			List<RANKParam> lowRank = rank.subList(highRank.size() + midRank.size() - 1, rank.size() - 1);// 나머지

			for (RANKParam tmp : lowRank) {
				if (tmp.getTeam_location().equals("종로구")) {
					lowRankPopulation[0]++;
				}
				if (tmp.getTeam_location().equals("중구")) {
					lowRankPopulation[1]++;
				}
				if (tmp.getTeam_location().equals("용산구")) {
					lowRankPopulation[2]++;
				}
				if (tmp.getTeam_location().equals("성동구")) {
					lowRankPopulation[3]++;
				}
				if (tmp.getTeam_location().equals("광진구")) {
					lowRankPopulation[4]++;
				}
				if (tmp.getTeam_location().equals("동대문구")) {
					lowRankPopulation[5]++;
				}
				if (tmp.getTeam_location().equals("중랑구")) {
					lowRankPopulation[6]++;
				}
				if (tmp.getTeam_location().equals("성북구")) {
					lowRankPopulation[7]++;
				}
				if (tmp.getTeam_location().equals("강북구")) {
					lowRankPopulation[8]++;
				}
				if (tmp.getTeam_location().equals("도봉구")) {
					lowRankPopulation[9]++;
				}
				if (tmp.getTeam_location().equals("노원구")) {
					lowRankPopulation[10]++;
				}
				if (tmp.getTeam_location().equals("은평구")) {
					lowRankPopulation[11]++;
				}
				if (tmp.getTeam_location().equals("서대문구")) {
					lowRankPopulation[12]++;
				}
				if (tmp.getTeam_location().equals("마포구")) {
					lowRankPopulation[13]++;
				}
				if (tmp.getTeam_location().equals("양천구")) {
					lowRankPopulation[14]++;
				}
				if (tmp.getTeam_location().equals("강서구")) {
					lowRankPopulation[15]++;
				}
				if (tmp.getTeam_location().equals("구로구")) {
					lowRankPopulation[16]++;
				}
				if (tmp.getTeam_location().equals("금천구")) {
					lowRankPopulation[17]++;
				}
				if (tmp.getTeam_location().equals("영등포구")) {
					lowRankPopulation[18]++;
				}
				if (tmp.getTeam_location().equals("동작구")) {
					lowRankPopulation[19]++;
				}
				if (tmp.getTeam_location().equals("관악구")) {
					lowRankPopulation[20]++;
				}
				if (tmp.getTeam_location().equals("서초구")) {
					lowRankPopulation[21]++;
				}
				if (tmp.getTeam_location().equals("강남구")) {
					lowRankPopulation[22]++;
				}
				if (tmp.getTeam_location().equals("송파구")) {
					lowRankPopulation[23]++;
				}
				if (tmp.getTeam_location().equals("강동구")) {
					lowRankPopulation[24]++;
				}
			}
			for (int i = 0; i < 25; i++) {// 구별 상위+중위+하위 팀 수
				guPopulation[i] = highRankPopulation[i] + midRankPopulation[i] + lowRankPopulation[i];
			}

			for (int i = 0; i < guPopulation.length; i++) {// 랭킹 계산
				rankPopulation[i] = 1;
				for (int j = 0; j < guPopulation.length; j++) {
					// rankPopulation[i]++;
					if (guPopulation[i] < guPopulation[j]) {
						rankPopulation[i]++;
					}
				}
			}

			// int[] guPopulation = new int[25];// 구별로 전체 인구수 저장 할 배열
			// int[] highRankPopulation = new int[25];// 구별로 상위리그 인구수 저장 할 배열
			// int[] midRankPopulation = new int[25];// 구별로 중위리그 인구수 저장 할 배열
			// int[] lowRankPopulation = new int[25];// 구별로 하위리그 인구수 저장 할 배열
			// // 구별로 등수를 저장할 배열
			// int[] rankPopulation = { 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
			// 1, 1,
			CSVWrite cw = new CSVWrite();

			cw.insertGuPopulation(dataAll, guPopulation);// 구별로 전체 인구수 저장 할 배열
			cw.insertEachData(dataAll, highRankPopulation, midRankPopulation, lowRankPopulation);
			cw.insertRank(dataAll, rankPopulation);

			cw.writeCsv(dataAll);

			model.addAttribute("title", "kickoff");
			model.addAttribute("menuNum", 0);
			
			return "kickoff.tiles";

		}

	}

	@RequestMapping(value = "matching.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String matching(Model model, HttpServletRequest request) throws Exception {
		logger.info("Welcome gameController matching! " + new Date());
		foot_user_DTO jyfudto = (foot_user_DTO) request.getSession().getAttribute("login");

		if (jyfudto == null) {
			return "redirect:loginpopup1.do";
		} else {

			model.addAttribute("title", "매칭등록");
			return "matching.tiles";

		}

	}

	@RequestMapping(value = "publicms.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String pmatchingsearch(Model model, HttpServletRequest request) throws Exception {
		logger.info("Welcome gameController pmatchingsearch! " + new Date());
		foot_user_DTO jyfudto = (foot_user_DTO) request.getSession().getAttribute("login");
		String mode = request.getParameter("mode");
		
		if (jyfudto == null) {
			return "redirect:loginpopup1.do";
		} else {

			model.addAttribute("title", "publicmatchsearch");
			model.addAttribute("menuNum", 5);
			model.addAttribute("mode", mode);
			
			return "pmatchingsearch.tiles";

		}

	}

	@RequestMapping(value = "pmatchingsearchAf.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String pmatchingsearchAf(MATCHINGParam param, Model model, HttpServletRequest request) throws Exception {
		logger.info("Welcome gameController pmatchingsearchAf! " + new Date());
		foot_user_DTO jyfudto = (foot_user_DTO) request.getSession().getAttribute("login");

		if (jyfudto == null) {
			return "redirect:loginpopup1.do";
		} else {

			List<foot_game_DTO> pmatchingsearchlist = fgameservice.getpmatchingsearchList(param);

			for (foot_game_DTO dto : pmatchingsearchlist) {
				System.out.println(dto.toString());
			}

			model.addAttribute("pmatchingsearchlist", pmatchingsearchlist);

			model.addAttribute("title", "publicmatchsearch");
			model.addAttribute("menuNum", 5);
			return "pmatchingsearch.tiles";

		}

	}

	@RequestMapping(value = "freems.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String fmatchingsearch(Model model, HttpServletRequest request) throws Exception {
		logger.info("Welcome gameController fmatchingsearch! " + new Date());
		foot_user_DTO jyfudto = (foot_user_DTO) request.getSession().getAttribute("login");
		String mode = request.getParameter("mode");
				
		
		if (jyfudto == null) {
			return "redirect:loginpopup1.do";
		} else {

			model.addAttribute("title", "freematchsearch");
			model.addAttribute("menuNum", 6);
			model.addAttribute("mode", mode);
			return "fmatchingsearch.tiles";

		}

	}

	@RequestMapping(value = "fmatchingsearchAf.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String fmatchingsearchAf(MATCHINGParam param, Model model, HttpServletRequest request) throws Exception {
		logger.info("Welcome gameController fmatchingsearchAf! " + new Date());
		foot_user_DTO jyfudto = (foot_user_DTO) request.getSession().getAttribute("login");

		if (jyfudto == null) {
			return "redirect:loginpopup1.do";
		} else {

			List<foot_game_DTO> fmatchingsearchlist = fgameservice.getfmatchingsearchList(param);
			for (foot_game_DTO dto : fmatchingsearchlist) {
				System.out.println(dto.toString());
			}
			model.addAttribute("fmatchingsearchlist", fmatchingsearchlist);

			model.addAttribute("title", "freematchsearch");
			model.addAttribute("menuNum", 6);
			return "fmatchingsearch.tiles";

		}

	}

	@RequestMapping(value = "publicgame.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String publicgame(Model model, HttpServletRequest request) throws Exception {
		logger.info("Welcome gameController publicgame! " + new Date());
		foot_user_DTO jyfudto = (foot_user_DTO) request.getSession().getAttribute("login");
		
		String mode = request.getParameter("mode");
		
		if (jyfudto == null) {
			return "redirect:loginpopup1.do";
		} else {

			model.addAttribute("title", "publicmatchadd");
			model.addAttribute("menuNum", 2);
			model.addAttribute("mode", mode);
			return "publicgame.tiles";

		}

	}

	@RequestMapping(value = "publicgameAf.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String publicgameAf(foot_game_DTO fgdto, Model model, HttpServletRequest request) throws Exception {
		logger.info("Welcome gameController publicgameAf! " + new Date());
		foot_user_DTO jyfudto = (foot_user_DTO) request.getSession().getAttribute("login");

		if (jyfudto == null) {
			return "redirect:loginpopup1.do";
		} else {

			foot_game_DTO fgd = null;

			fgd = fgameservice.publicgame(fgdto);

			foot_game_record fgr = new foot_game_record();

			fgr.setGame_no(fgd.getGame_no());
			fgr.setGame_date(fgd.getGame_date());

			fgameservice.publicgamerecord(fgr);

			return "redirect:/kickoff.do";
		}

	}

	@RequestMapping(value = "pmatchingdetail.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String pmatchingdetail(foot_game_DTO fgdto, Model model, HttpServletRequest request) throws Exception {
		logger.info("Welcome MemberController pmatchingdetail! " + new Date());
		foot_user_DTO jyfudto = (foot_user_DTO) request.getSession().getAttribute("login");

		if (jyfudto == null) {
			return "redirect:loginpopup1.do";
		} else {

			foot_game_DTO fgd = fgameservice.getPublicgamedetail(fgdto);

			model.addAttribute("pmd", fgd);
			model.addAttribute("title", "publicmatch");
			model.addAttribute("menuNum", 5);

			return "pmatchingdetail.tiles";

		}

	}

	// @RequestMapping(value = "publicgamerecordAf.do", method =
	// {RequestMethod.GET,RequestMethod.POST})
	// public String publicgamerecordAf(foot_game_DTO fgdto,Model model) throws
	// Exception {
	// logger.info("Welcome gameController publicgamerecordAf! "+ new Date());
	//
	//
	// return "redirect:/kickoff.do";
	// }
	//

	@RequestMapping(value = "freegame.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String freegame(Model model, HttpServletRequest request) throws Exception {
		logger.info("Welcome gameController freegame! " + new Date());
		foot_user_DTO jyfudto = (foot_user_DTO) request.getSession().getAttribute("login");
		
		String mode = request.getParameter("mode");
		
		if (jyfudto == null) {
			return "redirect:loginpopup1.do";
		} else {
			
			model.addAttribute("title", "freematchadd");
			model.addAttribute("menuNum", 3);
			model.addAttribute("mode", mode);
			return "freegame.tiles";

		}

	}

	@RequestMapping(value = "freegameAf.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String freegameAf(foot_game_DTO fgdto, Model model, HttpServletRequest request) throws Exception {
		logger.info("Welcome gameController freegameAf! " + new Date());
		foot_user_DTO jyfudto = (foot_user_DTO) request.getSession().getAttribute("login");

		if (jyfudto == null) {
			return "redirect:loginpopup1.do";
		} else {

			fgameservice.freegame(fgdto);

			return "redirect:/kickoff.do";

		}

	}

	@RequestMapping(value = "fmatchingdetail.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String fmatchingdetail(foot_game_DTO fgdto, Model model, HttpServletRequest request) throws Exception {
		logger.info("Welcome MemberController fmatchingdetail! " + new Date());
		foot_user_DTO jyfudto = (foot_user_DTO) request.getSession().getAttribute("login");

		if (jyfudto == null) {
			return "redirect:loginpopup1.do";
		} else {

			foot_game_DTO fgd = fgameservice.getFreegamedetail(fgdto);

			model.addAttribute("fmd", fgd);
			model.addAttribute("title", "freematch");
			model.addAttribute("menuNum", 6);

			return "fmatchingdetail.tiles";

		}

	}

	// Ranking Main
	@RequestMapping(value = "ranking.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String ranking(Model model, HttpServletRequest request) throws Exception {
		logger.info("Welcome gameController ranking! " + new Date());

		model.addAttribute("title", "rank");
		model.addAttribute("menuNum", 7);

		return "ranking.tiles";
	}

	@RequestMapping(value = "rankingAf.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String rankingAf(String team_location, RANKParam rank, Model model, HttpServletRequest request)
			throws Exception {
		logger.info("Welcome gameController rankingAf! " + new Date());

		System.out.println("team_location = " + team_location);

		rank.setTeam_location(team_location);

		List<RANKParam> rankinglist = fgameservice.getrankingList(rank);
		model.addAttribute("rankinglist", rankinglist);

		model.addAttribute("location", team_location);
		model.addAttribute("title", "rank");
		model.addAttribute("menuNum", 7);

		return "rankingaf.tiles";
	}

	@RequestMapping(value = "rankapply.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String rankapply(foot_game_DTO fgdto, Model model, HttpServletRequest request) throws Exception {
		logger.info("Welcome gameController rankapply! " + new Date());
		foot_user_DTO jyfudto = (foot_user_DTO) request.getSession().getAttribute("login");

		if (jyfudto == null) {
			return "redirect:loginpopup1.do";
		} else {

			foot_game_DTO fgd = fgameservice.getPublicgamedetail(fgdto);

			model.addAttribute("pmd", fgd);
			model.addAttribute("title", "rank");
			model.addAttribute("menuNum", 7);

			return "rankapply.tiles";

		}

	}
	@RequestMapping(value = "publicgameDelete.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String publicgameDelete(foot_game_DTO fgdto, Model model, HttpServletRequest request) throws Exception {

		fgameservice.publicgameDelete(fgdto);
		
		return "redirect:/kickoff.do";
	}
	
	@RequestMapping(value = "freegameDelete.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String freegameDelete(foot_game_DTO fgdto, Model model, HttpServletRequest request) throws Exception {

		fgameservice.freegameDelete(fgdto);
		
		return "redirect:/kickoff.do";
	}

}
