package soccer.co.controller;

import java.util.List;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.Date;

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
import org.springframework.web.multipart.MultipartFile;

import soccer.co.DTO.foot_cal_DTO;
import soccer.co.DTO.foot_teamcal_DTO;
import soccer.co.DTO.foot_game_record;
import soccer.co.DTO.foot_team_DTO;
import soccer.co.DTO.foot_user_DTO;
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
	
	private static final Logger logger = LoggerFactory.getLogger(clubController.class);
	
	
	@RequestMapping(value = "team_create.do", method = {RequestMethod.GET,RequestMethod.POST})	
	public String join(foot_user_DTO fudto, HttpServletRequest request, Model model) throws Exception {	
		logger.info("clubController join!");
		
		model.addAttribute("list",clubservice.getGu());
		
		request.getSession().setAttribute("login",userservice.login1(fudto) );
		
		model.addAttribute("title", "클럽 생성");
		return "team_create.tiles";
	}
	
	@RequestMapping(value = "club.do", method = {RequestMethod.GET,RequestMethod.POST})	
	public String club(String cal,foot_cal_DTO cdto,foot_user_DTO fudto,Model model, HttpServletRequest req) throws Exception {	
		logger.info("clubController club!");
		if(fudto.getUser_team().equals("") || fudto.getUser_team()==null){
			List<foot_team_DTO> notteamlist = clubservice.notteamGu(fudto.getUser_address());
			model.addAttribute("notteamlist", notteamlist);
		}
		HttpSession session=req.getSession();
		/*	1.팀 로고, 팀 소개 (세션) ->뷰딴에서 꺼내기만 하면 됨
		 *  6.팀 주소 (세션)에서 꺼내기 ->뷰딴에서 꺼내기만 하면 됨
		 *  
		 *  2.캘린더- 이번달 스케줄 전부  -> 조재용
		 *  4.팀게시판 가져오기
		 *  5.팀_맴버 테이블 가져오기
		 * 
		 * */
		foot_team_DTO team=(foot_team_DTO)session.getAttribute("team");
		List<foot_game_record> gameRecList = clubservice.getGameRecord(team.getTeam_name()); 
		//3.최근경기-경기 기록 가져오기, 경기 기록에 있는 상대팀의  로고(.jpg)들 가져오기 
		
		
		//////////////////////////////////달력/////////////////////////////////////////////////////////////
		foot_cal_DTO cdto1=null;
		if(cal==null){
			cdto1 = cs.makecal1();
		}else if(cal.equals("sleft")){
			foot_cal_DTO cdto2 = cs.sleft(cdto);
			cdto1 = cs.makecal(cdto2);
		}else if(cal.equals("sright")){
			foot_cal_DTO cdto2 = cs.sright(cdto);
			cdto1 = cs.makecal(cdto2);
		}
		int month2 = cdto1.getMonth();
		String month="";
		if(month2<10){ month = "0"+month2;}
		else{month = month2+"";}
		String yyyydd = cdto1.getYear()+""+month+"";
		model.addAttribute("cdto", cdto1);
		foot_team_DTO ftdto = (foot_team_DTO) req.getSession().getAttribute("team");
		foot_cal_DTO caldto = new foot_cal_DTO();
		caldto.setId(ftdto.getTeam_name());
		caldto.setYyyydd(yyyydd);
		ArrayList<foot_teamcal_DTO> getmycal = cs.getmycal(caldto);
		model.addAttribute("getmycal", getmycal);
		////////////////////////////////////////////////////////////////////////////////////////////////
		
		
		
		model.addAttribute("gameRecList", gameRecList);
		model.addAttribute("title", "마이 클럽");
		return "team_club.tiles";
	}
	
	@RequestMapping(value ="createTeamAf.do", method = RequestMethod.POST)	
	public String joinAf(@RequestParam("file") MultipartFile file,
			HttpServletRequest req,foot_team_DTO team,String team_h,String team_o,String team_j, Model model) throws Exception {	
		logger.info("clubController joinAf!");
		String fileName = null;
		File upload = null;
		
		if (!file.isEmpty()) {
			try {
				fileName = file.getOriginalFilename();
				
				//upload = new File("/Users/chojaeyong/Desktop/eclipse3/finalProject160203/WebContent/image/" + fileName);
				//upload = new File("C:/Users/RyuDung/Desktop/study_jsp/eclipse/finalProject160203/WebContent/image/" + fileName);
				//upload = new File("C:/springstudy/finalProject160203/WebContent/image/" + fileName);
				upload = new File("D:/Spring/finalProject160203/WebContent/image/" + fileName);
				// 
				byte[] bytes = file.getBytes();
				BufferedOutputStream buffStream = new BufferedOutputStream(
						new FileOutputStream(upload));

				buffStream.write(bytes);
				buffStream.close();
				team.setTeam_logo(fileName);
				
				System.out.println("You have successfully uploaded " + fileName);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			System.out.println("empty!!!!!!!!");
			team.setTeam_logo("");
		}
		
		team.setTeam_home(team_h);
		team.setTeam_join(team_j == null ? 0:1);
		team.setTeam_open(team_o == null ? 0:1);
		System.out.println(team.toString());
		
		try{
			clubservice.join(team);//팀생성 실패시 어떻게 할까?
			req.getSession().setAttribute("team",team);
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return "team_createAf.tiles";
	}
	
	
}
