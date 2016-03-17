package soccer.co.controller;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import au.com.bytecode.opencsv.CSVReader;
import au.com.bytecode.opencsv.CSVWriter;
import sist.co.help.CSVWrite;
import soccer.co.DTO.FOOT_USER_RECORD;
import soccer.co.DTO.RANKParam;
import soccer.co.DTO.foot_cal_DTO;
import soccer.co.DTO.foot_game_record;
import soccer.co.DTO.foot_message_DTO;
import soccer.co.DTO.foot_team_DTO;
import soccer.co.DTO.foot_teamcal_DTO;
import soccer.co.DTO.foot_user_DTO;
import soccer.co.Service.foot_messageService;
import soccer.co.Service.foot_teamCalendarService;
import soccer.co.Service.foot_teamService;
import soccer.co.Service.foot_userService;

@Controller
public class clubController {
	@Autowired
	foot_teamCalendarService cs;
	@Autowired
	foot_teamService clubservice;
	@Autowired
	foot_userService userservice;
	@Autowired
	foot_messageService messageservice;
	private static final Logger logger = LoggerFactory.getLogger(clubController.class);

	@RequestMapping(value = "team_create.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String join(foot_user_DTO fudto, HttpServletRequest request, Model model) throws Exception {
		logger.info("clubController join!");

		foot_user_DTO jyfudto = (foot_user_DTO) request.getSession().getAttribute("login");
		if (jyfudto == null) {
			return "redirect:loginpopup1.do";
		} else {
	
			model.addAttribute("list", clubservice.getGu());
			request.getSession().setAttribute("login", userservice.login1(fudto));
			model.addAttribute("title", "clubmake");
			model.addAttribute("menuNum", 2);
			return "team_create.tiles";
		}
	}

	@RequestMapping(value = "savePosition.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public int savePosition(@RequestBody List<Map<String, Object>> list) {
		logger.info("savePosition do!");

		for (Map<String, Object> m : list) {
			foot_user_DTO tmpUserDTO = new foot_user_DTO(m.get("user_email").toString(), m.get("user_pw").toString(),
					m.get("user_name").toString(), m.get("user_birth").toString(), (Integer) m.get("user_age"),
					m.get("user_phone").toString(), (Integer) m.get("user_high"), (Integer) m.get("user_weight"),
					(Integer) m.get("user_foot"), m.get("user_position1").toString(),
					m.get("user_position2").toString(), m.get("user_position3").toString(),
					m.get("user_address").toString(), m.get("user_profile").toString(), m.get("user_team").toString(),
					(int) m.get("user_helper"), (int) m.get("user_enabled"), (int) m.get("user_speed"),
					m.get("user_attendrate").toString(), m.get("user_attendtime").toString(),
					m.get("user_goal").toString(), (int) m.get("x"), (int) m.get("y"));
			// System.out.println(tmpUserDTO.toString());
			// userList.add(menu);
			clubservice.userUpdate(tmpUserDTO);
		}

		return 1;
	}
	
	@RequestMapping(value = "getTeamMember.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public List<foot_user_DTO> getTeamMember(HttpServletRequest req, Model model) {
		logger.info("getTeamMember do!");

		HttpSession session = req.getSession();
		foot_team_DTO team = (foot_team_DTO) session.getAttribute("team");
		List<foot_user_DTO> teamMemberList = clubservice.getTeamMember(team.getTeam_name());
		
		return teamMemberList;
	}
	
	@RequestMapping(value = "getTeamMember2.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public HashMap<Integer,List<foot_user_DTO>> getTeamMember2(@RequestParam("team1")String team1,
			@RequestParam("team2")String team2,HttpServletRequest req, Model model) {
		logger.info("getTeamMember do!");
		
		List<foot_user_DTO> teamMemberList1 = clubservice.getTeamMember(team1);
		List<foot_user_DTO> teamMemberList2 = clubservice.getTeamMember(team2);
		HashMap<Integer,List<foot_user_DTO>> map = new HashMap<Integer,List<foot_user_DTO>>();
		map.put(0, teamMemberList1);
		map.put(1, teamMemberList2);
		
		return map;
	}

	@RequestMapping(value = "getMyRecord.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public List<FOOT_USER_RECORD> getMyRecord(HttpServletRequest req, Model model) {
		logger.info("getMyRecord do!");

		HttpSession session = req.getSession();
		foot_user_DTO user = (foot_user_DTO) session.getAttribute("login");
		List<FOOT_USER_RECORD> userRecordList = clubservice.getMyRecord(user);

		return userRecordList;
	}

	@RequestMapping(value = "getMyMessage.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public List getMyMessage(HttpServletRequest req, Model model) {
		logger.info("getMyMessage do!");

		HttpSession session = req.getSession();
		foot_user_DTO login = (foot_user_DTO) req.getSession().getAttribute("login");
		ArrayList<foot_message_DTO> list = messageservice.messagecheck(login);
		ArrayList<foot_message_DTO> list1 = messageservice.messagecheck1(login);

		ArrayList MyMessage = new ArrayList();
		MyMessage.add(list.size());
		MyMessage.add(list1.size());

		return MyMessage;
	}

	@RequestMapping(value = "club.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String club(String cal, foot_cal_DTO cdto, foot_user_DTO fudto, Model model, HttpServletRequest req)
			throws Exception {
		logger.info("clubController club!");

		foot_user_DTO jyfudto = (foot_user_DTO) req.getSession().getAttribute("login");
		if (jyfudto == null) {
			return "redirect:loginpopup1.do";
		} else {
			HttpSession session = req.getSession();
			/*
			 * 1.팀 로고, 팀 소개 (세션) ->뷰딴에서 꺼내기만 하면 됨 6.팀 주소 (세션)에서 꺼내기 ->뷰딴에서 꺼내기만
			 * 하면 됨
			 * 
			 * 2.캘린더- 이번달 스케줄 전부 -> 조재용 4.팀게시판 가져오기 5.팀_맴버 테이블 가져오기
			 */

			foot_user_DTO login = (foot_user_DTO) req.getSession().getAttribute("login");
			foot_team_DTO team = (foot_team_DTO) session.getAttribute("team");

			if (team != null) {
				List<foot_game_record> gameRecList = clubservice.getGameRecord(team.getTeam_name());
				List<foot_user_DTO> teamMemberList = clubservice.getTeamMember(team.getTeam_name());
				// 3.최근경기-경기 기록 가져오기, 경기 기록에 있는 상대팀의 로고(.jpg)들 가져오기

				// ////////////////////////////////달력/////////////////////////////////////////////////////////////
				foot_cal_DTO cdto1 = null;
				if (cal == null) {
					cdto1 = cs.makecal1();
				} else if (cal.equals("sleft")) {
					foot_cal_DTO cdto2 = cs.sleft(cdto);
					cdto1 = cs.makecal(cdto2);
				} else if (cal.equals("sright")) {
					foot_cal_DTO cdto2 = cs.sright(cdto);
					cdto1 = cs.makecal(cdto2);
				}
				int month2 = cdto1.getMonth();
				String month = "";
				if (month2 < 10) {
					month = "0" + month2;
				} else {
					month = month2 + "";
				}
				String yyyydd = cdto1.getYear() + "" + month + "";
				model.addAttribute("cdto", cdto1);
				foot_team_DTO ftdto = (foot_team_DTO) req.getSession().getAttribute("team");
				foot_cal_DTO caldto = new foot_cal_DTO();
				caldto.setId(ftdto.getTeam_name());
				caldto.setYyyydd(yyyydd);
				ArrayList<foot_teamcal_DTO> getmycal = cs.getmycal(caldto);
				model.addAttribute("getmycal", getmycal);
				// //////////////////////////////이번달
				// 달력불러오기////////////////////////////////////////////////

				// //////////////////////////////////////////////////////////////////////////////////////////////
				model.addAttribute("teamMemberList", teamMemberList);
				model.addAttribute("gameRecList", gameRecList);
				model.addAttribute("title", "club");
				model.addAttribute("menuNum", 0);
				return "team_club.tiles";
			} else {
				List<foot_team_DTO> notteamlist = clubservice.notteamGu(fudto.getUser_address());
				model.addAttribute("notteamlist", notteamlist);
				model.addAttribute("title", "club");
				model.addAttribute("menuNum", 0);
				return "no_team_club.tiles";
			}
		}

	}

	@RequestMapping(value = "teamView.do", method = RequestMethod.GET)
	public String teamView(foot_team_DTO team, HttpServletRequest req, Model model) {// 팀정보를
																						// 가져올
		logger.info("teamView !!!!");
			System.out.println(team.getTeam_name());
	
			foot_team_DTO dto = clubservice.getTeam(team);

			model.addAttribute("teamViewDTO", dto);
			return "teamView.tiles";

	}

	@RequestMapping(value = "createTeamAf.do", method = RequestMethod.POST)
	public String joinAf(@RequestParam("file") MultipartFile file, HttpServletRequest req, foot_team_DTO team,
			String team_h, String team_o, String team_j, Model model) throws Exception {
		logger.info("clubController joinAf!");

		foot_user_DTO jyfudto = (foot_user_DTO) req.getSession().getAttribute("login");

		if (jyfudto == null) {
			return "redirect:loginpopup1.do";
		} else {
			String fileName = null;
			File upload = null;

			if (!file.isEmpty()) {
				try {
					fileName = file.getOriginalFilename();

					// upload = new
					// File("/Users/chojaeyong/Desktop/eclipse3/finalProject160203/WebContent/image/"
					// + fileName);
					// upload = new
					// File("C:/Users/RyuDung/Desktop/study_jsp/eclipse/finalProject160203/WebContent/image/"
					// + fileName);
					// upload = new
					// File("C:/springstudy/finalProject160203/WebContent/image/"
					// +
					// fileName);
					upload = new File("D:/Spring/finalProject160203/WebContent/image/" + fileName);
					//
					byte[] bytes = file.getBytes();
					BufferedOutputStream buffStream = new BufferedOutputStream(new FileOutputStream(upload));

					buffStream.write(bytes);
					buffStream.close();
					team.setTeam_logo(fileName);

					System.out.println("You have successfully uploaded " + fileName);
				} catch (Exception e) {
					e.printStackTrace();
				}
			} else {

				team.setTeam_logo("noimage.jpeg");
			}

			team.setTeam_home(team_h);
			team.setTeam_join(team_j == null ? 0 : 1);
			team.setTeam_open(team_o == null ? 0 : 1);
			System.out.println(team.toString());

			try {
				clubservice.join(team);// 팀생성 실패시 어떻게 할까?
				req.getSession().setAttribute("team", team);
			} catch (Exception e) {
				e.printStackTrace();
			}

			return "team_createAf.tiles";

		}

	}

	@RequestMapping(value = "clubmyinform.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String clubmyinform(foot_user_DTO fudto, HttpServletRequest request, Model model) throws Exception {
		logger.info("clubmyinform ");
		
		foot_user_DTO jyfudto = (foot_user_DTO) request.getSession().getAttribute("login");

		if (jyfudto == null) {
			return "redirect:loginpopup1.do";
		} else {
			
			model.addAttribute("title", "clubmyinfo");
			model.addAttribute("menuNum", 2);
			return "clubmyinform.tiles";

		}

	}

	@RequestMapping(value = "teamsetting.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String teamsetting(foot_user_DTO fudto, HttpServletRequest request, Model model) throws Exception {
		logger.info("clubmyinform teamsetting!");

		foot_user_DTO jyfudto = (foot_user_DTO) request.getSession().getAttribute("login");

		if (jyfudto == null) {
			return "redirect:loginpopup1.do";
		} else {

			HttpSession session = request.getSession();
			foot_team_DTO team = (foot_team_DTO) session.getAttribute("team");
			List<foot_user_DTO> teamMemberList = clubservice.getTeamMember(team.getTeam_name());
			model.addAttribute("getteammember", teamMemberList);
			model.addAttribute("title", "clubsetting");
			model.addAttribute("menuNum", 3);
			return "teamsetting.tiles";

		}

	}

	@RequestMapping(value = "teamsetting1.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String teamsetting1(@RequestParam("file") MultipartFile file, HttpServletRequest req, foot_team_DTO team,
			String team_h, String team_o, String team_j, Model model) throws Exception {
		logger.info("clubmyinform teamsetting1!");

		foot_user_DTO jyfudto = (foot_user_DTO) req.getSession().getAttribute("login");

		if (jyfudto == null) {
			return "redirect:loginpopup1.do";
		} else {

			String fileName = null;
			File upload = null;
			foot_team_DTO team1 = (foot_team_DTO) req.getSession().getAttribute("team");

			if (!file.isEmpty()) {
				try {
					fileName = file.getOriginalFilename();

					// upload = new
					// File("/Users/chojaeyong/Desktop/eclipse3/finalProject160203/WebContent/image/"
					// + fileName);
					// upload = new
					// File("C:/Users/RyuDung/Desktop/study_jsp/eclipse/finalProject160203/WebContent/image/"
					// + fileName);
					// upload = new
					// File("C:/springstudy/finalProject160203/WebContent/image/"
					// +
					// fileName);
					upload = new File("D:/Spring/finalProject160203/WebContent/image/" + fileName);
					//
					byte[] bytes = file.getBytes();
					BufferedOutputStream buffStream = new BufferedOutputStream(new FileOutputStream(upload));

					buffStream.write(bytes);
					buffStream.close();
					team.setTeam_logo(fileName);

					System.out.println("You have successfully uploaded " + fileName);
				} catch (Exception e) {
					e.printStackTrace();
				}
			} else {

				team.setTeam_logo(team1.getTeam_logo());
			}
			String originteamname = team1.getTeam_name();
			team1.setTeam_managerid(team.getTeam_managerid());
			team1.setTeam_name(team.getTeam_name());
			team1.setTeam_intro(team.getTeam_intro());
			team1.setTeam_location1(team.getTeam_location1());
			team1.setTeam_location2(team.getTeam_location2());
			team1.setTeam_location3(team.getTeam_location3());
			team1.setTeam_join(team.getTeam_join());
			team1.setTeam_open(team.getTeam_open());
			team1.setTeam_home(team.getTeam_home());
			team1.setTeam_logo(team.getTeam_logo());
			model.addAttribute("team", team1);
			foot_user_DTO fudto = (foot_user_DTO) req.getSession().getAttribute("login");
			fudto.setUser_team(team1.getTeam_name());
			model.addAttribute("login", fudto);
			fudto.setUser_name(originteamname);
			System.out.println(team1.toString());
			clubservice.modifyteam(team1, fudto, originteamname);

			return "redirect:club.do";

		}

	}

	@RequestMapping(value = "clubsearch_yes.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String clubsearch_yes(foot_user_DTO fudto, HttpServletRequest request, Model model) throws Exception {
		logger.info("clubmyinform clubsearch_yes!");

		foot_user_DTO jyfudto = (foot_user_DTO) request.getSession().getAttribute("login");

		if (jyfudto == null) {
			return "redirect:loginpopup1.do";
		} else {

			model.addAttribute("list", clubservice.getGu());
			List<foot_team_DTO> allteam = clubservice.allteam();
			model.addAttribute("allteam", allteam);
			model.addAttribute("title", "club");
			model.addAttribute("menuNum", 1);
			return "clubsearch_yes.tiles";
		}

	}

	@RequestMapping(value = "clubsearch_no.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String clubsearch_no(foot_user_DTO fudto, HttpServletRequest request, Model model) throws Exception {
		logger.info("clubmyinform clubsearch_no!");
		model.addAttribute("list", clubservice.getGu());
		List<foot_team_DTO> allteam = clubservice.allteam();
		List<foot_team_DTO> recruitteam = clubservice.recruitteam();
		model.addAttribute("allteam", allteam);
		model.addAttribute("recruitteam", recruitteam);
		model.addAttribute("title", "club");
		model.addAttribute("menuNum", 1);
		return "clubsearch_no.tiles";
	}

	@RequestMapping(value = "teamdetail.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String teamdetail(foot_team_DTO fudto, HttpServletRequest request, Model model) throws Exception {
		logger.info("teamdetail clubsearch_yes!");

		foot_user_DTO jyfudto = (foot_user_DTO) request.getSession().getAttribute("login");

		if (jyfudto == null) {
			return "redirect:loginpopup1.do";
		} else {
			model.addAttribute("list", clubservice.getGu());
			List<foot_team_DTO> allteam = clubservice.allteam();
			List<foot_team_DTO> recruitteam = clubservice.recruitteam();
			model.addAttribute("allteam", allteam);
			model.addAttribute("recruitteam", recruitteam);
			model.addAttribute("teamdetail", fudto.getTeam_name());
			return "teamdetail.tiles";

		}

	}

	@RequestMapping(value = "clubsearch_no1.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String clubsearch_no1(foot_team_DTO fudto, HttpServletRequest request, Model model) throws Exception {
		logger.info("clubsearch_no1 clubsearch_yes!");

		foot_user_DTO jyfudto = (foot_user_DTO) request.getSession().getAttribute("login");

		if (jyfudto == null) {
			return "redirect:loginpopup1.do";
		} else {
			if (fudto.getTeam_name() == null || fudto.getTeam_name().equals("")) {
				fudto.setTeam_name("noname");
			}

			model.addAttribute("list", clubservice.getGu());
			List<foot_team_DTO> allteam = clubservice.allteam();
			List<foot_team_DTO> recruitteam = clubservice.recruitteam();
			model.addAttribute("allteam", allteam);
			model.addAttribute("searchteam", fudto);
			model.addAttribute("recruitteam", recruitteam);
			model.addAttribute("teamdetail", fudto.getTeam_name());
			return "clubsearch_no1.tiles";

		}

	}
	
	
	@RequestMapping(value = "clubsearch_yes1.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String clubsearch_yes1(foot_team_DTO fudto, HttpServletRequest request, Model model) throws Exception {
		logger.info("clubsearch_yes1 clubsearch_yes!");

		foot_user_DTO jyfudto = (foot_user_DTO) request.getSession().getAttribute("login");

		if (jyfudto == null) {
			return "redirect:loginpopup1.do";
		} else {
			
			if (fudto.getTeam_name() == null || fudto.getTeam_name().equals("")) {
				fudto.setTeam_name("noname");
			}

			model.addAttribute("list", clubservice.getGu());
			List<foot_team_DTO> allteam = clubservice.allteam();
			List<foot_team_DTO> recruitteam = clubservice.recruitteam();
			model.addAttribute("allteam", allteam);
			model.addAttribute("searchteam", fudto);
			model.addAttribute("recruitteam", recruitteam);
			model.addAttribute("teamdetail", fudto.getTeam_name());
			return "clubsearch_yes1.tiles";

		}

	}
	
	
	

	@RequestMapping(value = "teamapply.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String teamapply(foot_team_DTO fudto, HttpServletRequest request, Model model) throws Exception {
		logger.info("teamapply clubsearch_yes!");

		foot_user_DTO jyfudto = (foot_user_DTO) request.getSession().getAttribute("login");

		if (jyfudto == null) {
			return "redirect:loginpopup1.do";
		} else {

			String re = null;
			model.addAttribute("teamapply", fudto);
			foot_team_DTO team = (foot_team_DTO) request.getSession().getAttribute("team");
			if (team == null) {
				re = "teamapply.tiles";
			} else {
				re = "teamapplyno.tiles";
			}
			return re;

		}

	}

	@RequestMapping(value = "teamapply1.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String teamapply1(foot_team_DTO fudto, String intromyself, HttpServletRequest request, Model model)
			throws Exception {
		logger.info("teamapply1 clubsearch_yes!");
		foot_user_DTO jyfudto = (foot_user_DTO) request.getSession().getAttribute("login");

		if (jyfudto == null) {
			return "redirect:loginpopup1.do";
		} else {

			model.addAttribute("intromyself", intromyself);

			return "exit1.tiles";

		}

	}
}
