package soccer.co.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import soccer.co.DTO.foot_community_DTO;
import soccer.co.DTO.foot_message_DTO;
import soccer.co.DTO.foot_team_DTO;
import soccer.co.DTO.foot_user_DTO;
import soccer.co.Service.foot_communityService;
import soccer.co.Service.foot_messageService;
import soccer.co.Service.foot_userService;

@Controller
public class userController {
	@Autowired
	foot_userService fuservice;
	@Autowired
	foot_messageService messageservice;
	@Autowired
	private foot_communityService BBSService;//IoC

	private static final Logger logger = LoggerFactory.getLogger(userController.class);

	@RequestMapping(value = "first.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String first(Model model) {
		logger.info("Welcome HelloMemberController first! " + new Date());

		return "first.tiles";
	}

	@RequestMapping(value = "login.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String login(foot_user_DTO fudto,HttpServletRequest request, Model model) throws Exception {
		String login1 = "login.tiles";
		int loginfalse = 0;
		logger.info("Welcome HelloMemberController login! " + new Date());
		foot_user_DTO login = null;
		foot_team_DTO team = null;
		try {
			login = fuservice.login(fudto);
			ArrayList<foot_message_DTO> list = messageservice.messagecheck(login);
			ArrayList<foot_message_DTO> list1 = messageservice.messagecheck1(login);
			model.addAttribute("messagecheck", list);
			model.addAttribute("messagecheck1", list1);
			
			
			if(login.getUser_team()!=null){
				team = fuservice.loginteam(login);
			}
			
			// login.toString();
			request.getSession().setAttribute("loginfalse", loginfalse);
		} catch (Exception e) {
			e.printStackTrace();
			
			login1 = "notlogin.tiles";
		}
		List<foot_community_DTO> bbslist=BBSService.getBBSList();
		model.addAttribute("bbslist", bbslist);
		
		request.getSession().setAttribute("team", team);
		request.getSession().setAttribute("login", login);
		return login1;
	}

	@RequestMapping(value = "login1.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String login1(Model model) throws Exception{
		logger.info("Welcome HelloMemberController login1! " + new Date());
	
		return "login.tiles";
	}

	@RequestMapping(value = "join.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String join(foot_user_DTO fudto, HttpServletRequest request, Model model) throws Exception {
		logger.info("Welcome HelloMemberController join! " + new Date());

		return "join.tiles";
	}

	@RequestMapping(value = "join1.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String join1(@RequestParam("file") MultipartFile file, foot_user_DTO fudto, String user_email1,
			String user_email2, HttpServletRequest request, Model model) throws Exception {
		logger.info("Welcome HelloMemberController join1! " + new Date());
		String user_email = user_email1 + "@" + user_email2;
		fudto.setUser_email(user_email);
		
		String fileName = null;
		File upload = null;

		if (!file.isEmpty()) {
			try {

				fileName = file.getOriginalFilename();
				upload = new File("/Users/chojaeyong/Desktop/eclipse3/finalProject160203/WebContent/image/" + fileName);
				//upload = new File("C:/Users/RyuDung/Desktop/study_jsp/eclipse/finalProject160203/WebContent/image/" + fileName);
				byte[] bytes = file.getBytes();
				BufferedOutputStream buffStream = new BufferedOutputStream(new FileOutputStream(upload));

				buffStream.write(bytes);
				buffStream.close();
				fudto.setUser_profile(fileName);

				System.out.println("You have successfully uploaded " + fileName);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			fudto.setUser_profile("noimage.jpeg");
		}
		
		
		boolean join = fuservice.join(fudto);
		return "exit.tiles";
	}

	@RequestMapping(value = "logout.do", method = RequestMethod.GET)
	public String logout(HttpServletRequest request, Model model) throws Exception {
		logger.info("Welcome HelloMemberController logout! " + new Date());

		request.getSession().invalidate();
		return "first.tiles";
	}

	@RequestMapping(value = "myinform.do", method = RequestMethod.GET)
	public String myinform(HttpServletRequest request, Model model) throws Exception {
		logger.info("Welcome HelloMemberController myinform! " + new Date());

		return "myinform.tiles";
	}
	
	@RequestMapping(value = "modify.do", method = RequestMethod.GET)
	public String modify(HttpServletRequest request, Model model) throws Exception {
		logger.info("Welcome HelloMemberController modify! " + new Date());
		
		return "modify.tiles";
	}
	@RequestMapping(value = "modify1.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String modify1(foot_user_DTO fudto,HttpServletRequest request, Model model) throws Exception {
		logger.info("Welcome HelloMemberController modify1! " + new Date());
		String re=null;
		
		foot_user_DTO pw = (foot_user_DTO) request.getSession().getAttribute("login");
		
		if(pw.getUser_pw().equals(fudto.getUser_pw())){
			re = "modify1.tiles";
		}else{
			re = "modifyfail.tiles";
		}
		return re;
	}
	
	@RequestMapping(value = "modify2.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String modify2(@RequestParam("file") MultipartFile file, foot_user_DTO fudto,HttpServletRequest request, Model model) throws Exception {
		logger.info("Welcome HelloMemberController modify2! " + new Date());
		
		foot_user_DTO fudto1 = (foot_user_DTO) request.getSession().getAttribute("login");
		
		String fileName = null;
		File upload = null;

		if (!file.isEmpty()) {
			try {

				fileName = file.getOriginalFilename();
				upload = new File("/Users/chojaeyong/Desktop/eclipse3/finalProject160203/WebContent/image/" + fileName);
				//upload = new File("C:/Users/RyuDung/Desktop/study_jsp/eclipse/finalProject160203/WebContent/image/" + fileName);
				byte[] bytes = file.getBytes();
				BufferedOutputStream buffStream = new BufferedOutputStream(new FileOutputStream(upload));

				buffStream.write(bytes);
				buffStream.close();
				fudto.setUser_profile(fileName);

				System.out.println("You have successfully uploaded " + fileName);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			fudto.setUser_profile(fudto1.getUser_profile());
		}

		fudto1.setUser_pw(fudto.getUser_pw());
		fudto1.setUser_name(fudto.getUser_name());
		fudto1.setUser_birth(fudto.getUser_birth());
		fudto1.setUser_age(fudto.getUser_age());
		fudto1.setUser_phone(fudto.getUser_phone());
		fudto1.setUser_high(fudto.getUser_high());
		fudto1.setUser_weight(fudto.getUser_weight());
		fudto1.setUser_foot(fudto.getUser_foot());
		fudto1.setUser_position1(fudto.getUser_position1());
		fudto1.setUser_position2(fudto.getUser_position2());
		fudto1.setUser_position3(fudto.getUser_position3());
		fudto1.setUser_address(fudto.getUser_address());
		fudto1.setUser_profile(fudto.getUser_profile());
		fudto1.setUser_helper(fudto.getUser_helper());
		fudto1.setUser_enabled(fudto.getUser_enabled());
		
		fuservice.modify(fudto1);
		model.addAttribute("login", fudto1);
		
		return "redirect:myinform.do";
	}
}
