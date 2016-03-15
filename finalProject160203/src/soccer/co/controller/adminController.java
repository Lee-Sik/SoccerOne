package soccer.co.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import soccer.co.DTO.foot_game_DTO;
import soccer.co.DTO.foot_game_record;
import soccer.co.DTO.foot_team_DTO;
import soccer.co.DTO.foot_user_DTO;
import soccer.co.Service.foot_gameService;
import soccer.co.Service.foot_teamService;

@Controller
public class adminController {
	
	@Autowired
	foot_teamService clubservice;
	@Autowired
	foot_gameService fgameservice;
	
	private static final Logger logger = LoggerFactory
			.getLogger(adminController.class);
	
	@RequestMapping(value = "adminmain.do", method = { RequestMethod.GET,RequestMethod.POST })
	public String adminMain(foot_game_DTO fgdto, HttpServletRequest request, Model model)throws Exception{
		
		String day = request.getParameter("day");

		if(day==null || day.equals(null)){
			fgdto.setGame_date("");
			List<foot_game_DTO> adminrecordlist = fgameservice.adminMainList(fgdto);
			model.addAttribute("adminrecordlist", adminrecordlist);
			
			model.addAttribute("title", "기록 입력 페이지");
		}
		return "adminmain.tiles";
}
	
	@RequestMapping(value = "notrecordcallist.do", method = { RequestMethod.GET,RequestMethod.POST })
	public String notrecordcallist(foot_game_DTO fgdto, HttpServletRequest request, Model model)throws Exception{
		
		String day = request.getParameter("day");
		
		if(!(day==null || day.equals(null))){
			
			String date = day.substring(6, 10) +'-'+ day.substring(0, 2) +'-'+ day.substring(3, 5);
			
			System.out.println("date = " + date);
			fgdto.setGame_date(date);
			List<foot_game_DTO> adminrecordlist = fgameservice.adminMainList(fgdto);
			
			model.addAttribute("adminrecordlist", adminrecordlist);	
			
		}
		model.addAttribute("title", "기록 입력 대기 ");
	
		return "adminmain.tiles";
}
	
	@RequestMapping(value = "recordinsert.do", method = { RequestMethod.GET,RequestMethod.POST })
	public String recordinsert(foot_game_record fgd, HttpServletRequest request, Model model) throws Exception{
				
		String game_no = request.getParameter("game_no");
		String teamName1 = request.getParameter("teamName1");
		String teamName2 = request.getParameter("teamName2");
		System.out.println(teamName1);
		System.out.println(teamName2);
		
		fgd.setGame_no(Integer.parseInt(game_no));
		
		foot_game_record fgr = fgameservice.getrecordInsert(fgd);
		//getTeamMember.do
		foot_team_DTO team1 = new foot_team_DTO();
		foot_team_DTO team2 = new foot_team_DTO();
		foot_team_DTO team3 = new foot_team_DTO();
		foot_team_DTO team4 = new foot_team_DTO();
		team1.setTeam_name(teamName1);
		team2.setTeam_name(teamName2);

		 team3 = clubservice.getTeam2(team1);
		 team4 = clubservice.getTeam2(team2);
		
		//System.out.println(team3.toString());
		//System.out.println(team4.toString());
		
		model.addAttribute("team1", team3);
		model.addAttribute("team2", team4);
		model.addAttribute("record", fgr);
		
		return "recordinsert.tiles";
	}
	
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
