package soccer.co.controller;

import java.util.List;
import java.util.Random;

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

import soccer.co.DTO.FOOT_USER_RECORD;
import soccer.co.DTO.foot_game_DTO;
import soccer.co.DTO.foot_game_record;
import soccer.co.DTO.foot_team_DTO;
import soccer.co.DTO.foot_user_DTO;
import soccer.co.Service.foot_gameService;
import soccer.co.Service.foot_teamService;
import soccer.co.Service.foot_userService;

@Controller
public class adminController {
	@Autowired
	foot_userService fuservice;
	@Autowired
	foot_teamService clubservice;
	@Autowired
	foot_gameService fgameservice;
	
	private static final Logger logger = LoggerFactory
			.getLogger(adminController.class);
	
	@RequestMapping(value = "adminmain.do", method = { RequestMethod.GET,RequestMethod.POST })
	public String adminMain(foot_game_DTO fgdto, HttpServletRequest request, Model model)throws Exception{
		HttpSession hs=request.getSession();
		foot_user_DTO user = (foot_user_DTO) hs.getAttribute("login");
		if(user==null || !user.getUser_email().equals("admin")){
			System.out.println("no Admin");
			 return "redirect:/noAdmin.do";
		}
		String day = request.getParameter("day");

		if(day==null || day.equals(null)){
			fgdto.setGame_date("");
			List<foot_game_DTO> adminrecordlist = fgameservice.adminMainList(fgdto);
			model.addAttribute("adminrecordlist", adminrecordlist);
			
			model.addAttribute("title", "admin");
			model.addAttribute("menuNum", 0);
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
		model.addAttribute("title", "admin");
		model.addAttribute("menuNum", 0);
	
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
	
	@RequestMapping(value = "AdminGameRecord.do", method = { RequestMethod.GET,RequestMethod.POST })
	@ResponseBody
	public List<foot_team_DTO> AdminGameRecord(String game_no,String game_date,String team1_location1,
			String team1_logo,String team1_name,String team2_name, String team2_logo,String team2_location1,
			String team1_goal,String team2_goal,String score, HttpServletRequest req, Model model) {
		
		logger.info("AdminGameRecord do!");
	//	System.out.println(game_date);
	//	System.out.println(team2_goal);
		List<foot_user_DTO> team1MemberList = clubservice.getTeamMember(team1_name);
		System.out.println(team1MemberList.size());
		List<foot_user_DTO> team2MemberList = clubservice.getTeamMember(team2_name);
		
		foot_game_record rec = new foot_game_record();
		rec.setGame_no(Integer.parseInt(game_no));
		rec.setScore(score);
		String[] tmp =score.split(":");
		if(Integer.parseInt(tmp[0])>Integer.parseInt(tmp[1])){
			rec.setWin_team(team1_name);
			rec.setWin_team_logo(team1_logo);
			rec.setLose_team(team2_name);
			rec.setLose_team_logo(team2_logo);
			rec.setWin_goal_player(team1_goal);
			rec.setLose_goal_player(team2_goal);
			
		}else{
			rec.setLose_team(team1_name);
			rec.setLose_team_logo(team1_logo);
			rec.setWin_team(team2_name);
			rec.setWin_team_logo(team2_logo);
			rec.setWin_goal_player(team2_goal);
			rec.setLose_goal_player(team1_goal);
			
		}
		rec.setHome_local(team1_location1);
		rec.setAway_local(team2_location1);
		rec.setMatching_state(1);
		
		//clubservice.updateGameRecord(rec);
		//clubservice.updatePublicRecord(rec);
		
		//clubservice.updateMemberRecord(rec);필요 없음
		
		String[] tmp1 =team1_goal.split("-");
		int tmp3[] = new int[tmp1.length];
		for(int i=0;i<tmp1.length;i++){
			tmp3[i]=1;
		}
		String[] tmp2 =team2_goal.split("-");
		int tmp4[] = new int[tmp2.length];
		for(int i=0;i<tmp2.length;i++){
			tmp4[i]=1;
		}
		
		for(int i=0;i<tmp1.length;i++){
			for(int j=i+1;j<tmp1.length;j++){//for문 인자 문제
				if(tmp1[i]==tmp1[j]){ tmp3[i]++; tmp3[j]=0;}
			}
		}
		
		for(int i=0;i<tmp2.length;i++){
			for(int j=i+1;j<tmp2.length;j++){
				if(tmp2[i]==tmp2[j]){ tmp4[i]++; tmp3[j]=0;}
			}
		}
		
		//System.out.println(tmp3[0]+" "+tmp3[1]+" "+tmp3[2]);
		//System.out.println(tmp4[0]+" "+tmp4[1]+" "+tmp4[2]);
	
		for(int j=0;j<tmp3.length;j++){
			if(tmp3[j]!=0){
				foot_user_DTO a = new foot_user_DTO();
				a.setUser_name(tmp1[j]);
				a.setUser_team(team1_name);
				
				int longpass = (int)(Math.random()*100)+1;
				int shot = (int)(Math.random()*100)+1;
				int playTime = (int)(Math.random()*120)+1;
				
				foot_user_DTO b=clubservice.getUserByName(a);//이름과 팀명으로 찾는다. 같은 팀에 같은 이름 가지는 사람 안됨.
				FOOT_USER_RECORD ur = new FOOT_USER_RECORD(b.getUser_email(),longpass,shot,tmp3[j],playTime,game_date);
				//System.out.println(ur.toString());
				clubservice.insertUserRecord(ur);//유저 정보 삽입
				for(int i=0;i<team1MemberList.size();i++){
					if(team1MemberList.get(i).getUser_name().equals(tmp1[j])){
						team1MemberList.remove(i);
					}
				}
			}
		}
		for(int j=0;j<tmp4.length;j++){
			if(tmp4[j]!=0){
				foot_user_DTO a = new foot_user_DTO();
				//System.out.println(tmp2[j]+""+team2_name);
				a.setUser_name(tmp2[j]);
				a.setUser_team(team2_name);
				
				int longpass = (int)(Math.random()*100)+1;
				int shot = (int)(Math.random()*100)+1;
				int playTime = (int)(Math.random()*120)+1;
				
				foot_user_DTO b=clubservice.getUserByName(a);//이름과 팀명으로 찾는다. 같은 팀에 같은 이름 가지는 사람 안됨.
				
				FOOT_USER_RECORD ur = new FOOT_USER_RECORD(b.getUser_email(),longpass,shot,tmp4[j],playTime,game_date);
				//System.out.println(ur.toString());
				clubservice.insertUserRecord(ur);//유저 정보 삽입
				
				for(int i=0;i<team2MemberList.size();i++){
					if(team2MemberList.get(i).getUser_name().equals(tmp2[j])){
						team2MemberList.remove(i);
					}
				}
			}
		}
		////////////골 안넣은 팀원////////////////
		for(int i=0;i<team1MemberList.size();i++){
	
				foot_user_DTO a = new foot_user_DTO();
				a.setUser_name(team1MemberList.get(i).getUser_name());
				a.setUser_team(team1_name);
				
				int longpass = (int)(Math.random()*100)+1;
				int shot = (int)(Math.random()*100)+1;
				int playTime = (int)(Math.random()*120)+1;
				
				FOOT_USER_RECORD ur = new FOOT_USER_RECORD(team1MemberList.get(i).getUser_email(),longpass,shot,0,playTime,game_date);
				clubservice.insertUserRecord(ur);//유저 정보 삽입
			
		}
		for(int i=0;i<team2MemberList.size();i++){
			
			foot_user_DTO a = new foot_user_DTO();
			a.setUser_name(team2MemberList.get(i).getUser_name());
			a.setUser_team(team2_name);
			
			int longpass = (int)(Math.random()*100)+1;
			int shot = (int)(Math.random()*100)+1;
			int playTime = (int)(Math.random()*120)+1;
			
			FOOT_USER_RECORD ur = new FOOT_USER_RECORD(team2MemberList.get(i).getUser_email(),longpass,shot,0,playTime,game_date);
			clubservice.insertUserRecord(ur);//유저 정보 삽입
		
	}
		
		return null;
	}
}
