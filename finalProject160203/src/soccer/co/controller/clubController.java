package soccer.co.controller;

import java.util.List;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import soccer.co.DTO.foot_team_DTO;
import soccer.co.DTO.foot_user_DTO;
import soccer.co.Service.foot_teamService;
import soccer.co.Service.foot_userService;


@Controller
public class clubController {
	
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
	public String club(foot_user_DTO fudto,Model model) throws Exception {	
		logger.info("clubController club!");
		if(fudto.getUser_team().equals("") || fudto.getUser_team()==null){
			List<foot_team_DTO> notteamlist = clubservice.notteamGu(fudto.getUser_address());
			model.addAttribute("notteamlist", notteamlist);
		}
		
		
		model.addAttribute("title", "마이 클럽");
		return "team_club.tiles";
	}
	
	@RequestMapping(value ="createTeamAf.do", method = RequestMethod.POST)	
	public String joinAf(@RequestParam("file") MultipartFile file,foot_team_DTO team,String team_h,String team_o,String team_j, Model model) throws Exception {	
		logger.info("clubController joinAf!");
		String fileName = null;
		File upload = null;
		
		if (!file.isEmpty()) {
			try {
				fileName = file.getOriginalFilename();
				
				//upload = new File("/Users/chojaeyong/Desktop/eclipse3/finalProject160203/WebContent/image/" + fileName);
				//upload = new File("C:/Users/RyuDung/Desktop/study_jsp/eclipse/finalProject160203/WebContent/image/" + fileName);
				upload = new File("C:/springstudy/finalProject160203/WebContent/image/" + fileName);
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
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return "team_createAf.tiles";
	}
	
	
}
