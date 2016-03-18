package soccer.co.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import soccer.co.DTO.RANKParam;
import soccer.co.DTO.foot_community_DTO;
import soccer.co.DTO.foot_message_DTO;
import soccer.co.DTO.foot_sbooking_DTO;
import soccer.co.DTO.foot_team_DTO;
import soccer.co.DTO.foot_user_DTO;
import soccer.co.Service.foot_communityService;
import soccer.co.Service.foot_gameService;
import soccer.co.Service.foot_messageService;
import soccer.co.Service.foot_stadiumService;
import soccer.co.Service.foot_userService;

@Controller
public class userController {
	@Autowired
	foot_userService fuservice;
	@Autowired
	foot_messageService messageservice;
	@Autowired
	private foot_communityService BBSService;//IoC
	@Autowired
	private foot_stadiumService service;
	@Autowired
	foot_gameService fgameservice;
	
	private static final Logger logger = LoggerFactory.getLogger(userController.class);

	@RequestMapping(value = "first.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String first(Model model) {
		logger.info("Welcome HelloMemberController first! " + new Date());

		return "first.tiles";
	}

	@RequestMapping(value = "login.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String login(foot_user_DTO fudto,HttpServletRequest request, Model model,foot_sbooking_DTO dto) throws Exception {
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
				
				RANKParam rank= new RANKParam();
				rank.setTeam_location(team.getTeam_location1());//이걸 
		
				List<RANKParam> rankinglist = fgameservice.getrankingList(rank);
				model.addAttribute("rankinglist", rankinglist);
				model.addAttribute("location", team.getTeam_location1());
				
			}
			request.getSession().setAttribute("loginfalse", loginfalse);
		} catch (Exception e) {
			e.printStackTrace();
			
			return "login.tiles";
		}
		
		List<foot_community_DTO> bbslist=BBSService.getBBSList();
		List<foot_sbooking_DTO> blist = service.bookingList(dto);

		model.addAttribute("blist", blist);

		List<foot_user_DTO> fulist=fuservice.userList1();
		

		model.addAttribute("bbslist", bbslist);
		model.addAttribute("fulist", fulist);
		
		request.getSession().setAttribute("team", team);
		request.getSession().setAttribute("login", login);
		return login1;
	}

	@RequestMapping(value = "login1.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String login1(Model model,HttpServletRequest request,foot_sbooking_DTO dto) throws Exception{
		logger.info("Welcome HelloMemberController login1! " + new Date());
		List<foot_community_DTO> bbslist=BBSService.getBBSList();
		model.addAttribute("bbslist", bbslist);
		List<foot_user_DTO> fulist=fuservice.userList1();
		List<foot_sbooking_DTO> blist = service.bookingList(dto);
		model.addAttribute("blist", blist);
		model.addAttribute("fulist", fulist);
		foot_team_DTO team=(foot_team_DTO) request.getSession().getAttribute("team");
		RANKParam rank= new RANKParam();
		rank.setTeam_location(team.getTeam_location1());//이걸 

		List<RANKParam> rankinglist = fgameservice.getrankingList(rank);
		model.addAttribute("rankinglist", rankinglist);
		model.addAttribute("location", team.getTeam_location1());
		
		return "login.tiles";
	}
	
	
	@RequestMapping(value = "loginjy.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String loginjy(foot_user_DTO fudto,HttpServletRequest request, Model model) throws Exception {
		String login1 = "loginjyo.tiles";
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
			request.getSession().setAttribute("loginfalse", loginfalse);
		} catch (Exception e) {
			e.printStackTrace();
			
			login1 = "loginjyx.tiles";
		}
		List<foot_community_DTO> bbslist=BBSService.getBBSList();
		
		model.addAttribute("bbslist", bbslist);
		
		request.getSession().setAttribute("team", team);
		request.getSession().setAttribute("login", login);
		
		return login1;
	}
	
	@RequestMapping(value = "loginpopup.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String loginpopup(Model model) throws Exception{
		logger.info("Welcome HelloMemberController loginpopup! " + new Date());
		
		return "loginpopup.tiles";
	}
	
	@RequestMapping(value = "loginpopup1.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String loginpopup1(Model model) throws Exception{
		logger.info("Welcome HelloMemberController loginpopup! " + new Date());
		
		return "loginpopup1.tiles";
	}
	@RequestMapping(value = "loginpopup2.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String loginpopup2(Model model) throws Exception{
		logger.info("Welcome HelloMemberController loginpopup! " + new Date());
		
		return "loginpopup2.tiles";
	}

	@RequestMapping(value = "join.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String join(foot_user_DTO fudto, HttpServletRequest request, Model model) throws Exception {
		logger.info("Welcome HelloMemberController join! " + new Date());
		
		 int a = (int) (Math.random()*10);
	     int b = (int) (Math.random()*10);
	     int c = (int) (Math.random()*10);
	     int d = (int) (Math.random()*10);
	     int e = (int) (Math.random()*10);
	     int f = (int) (Math.random()*10);
		
	     String result = Integer.toString(a) + Integer.toString(b) + Integer.toString(c) + Integer.toString(d)
	     + Integer.toString(e)+ Integer.toString(f);
		
	     
	     
		List<foot_user_DTO> emaillist = fuservice.emaillist();
		System.out.println(emaillist.size());
		model.addAttribute("emaillist", emaillist);
		 model.addAttribute("result", result);
		 model.addAttribute("qwe", "123");

		return "join.tiles";
	}

	@RequestMapping(value = "join1.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String join1(@RequestParam("file") MultipartFile file, foot_user_DTO fudto, String user_email1,
			String user_email2, HttpServletRequest request, Model model) throws Exception {
		logger.info("Welcome HelloMemberController join1! " + new Date());
		
		
		String user_email = user_email1 + "@" + user_email2;
		fudto.setUser_email(user_email);
		System.out.println(fudto.toString());
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
		
		System.out.println("1 : " + fudto.getUser_birth());
		System.out.println("2 : " + fudto.getUser_pw());
		System.out.println("3 : " + fudto.getUser_name());
		System.out.println("4 : " + fudto.getUser_birth());
		System.out.println("5 : " + fudto.getUser_age());
		System.out.println("6 : " + fudto.getUser_phone());
		System.out.println("7 : " + fudto.getUser_high());
		System.out.println("8 : " + fudto.getUser_weight());
		System.out.println("9 : " + fudto.getUser_foot());
		System.out.println("10 : " + fudto.getUser_position1());
		System.out.println("11 : " + fudto.getUser_position2());
		System.out.println("12 : " + fudto.getUser_position3());
		System.out.println("13 : " + fudto.getUser_address());
		System.out.println("14 : " + fudto.getUser_profile());
		System.out.println("15 : " + fudto.getUser_helper());
		System.out.println("16 : " + fudto.getUser_enabled());
		
		
		
		
		
		
		
		boolean join = fuservice.join(fudto);
		return "exit.tiles";
	}

	@RequestMapping(value = "logout.do", method = RequestMethod.GET)
	public String logout(HttpServletRequest request, Model model) throws Exception {
		logger.info("Welcome HelloMemberController logout! " + new Date());
		
		String jyre="";
		foot_user_DTO jyfudto = (foot_user_DTO) request.getSession().getAttribute("login");
		if(jyfudto==null){
			jyre="redirect:loginpopup1.do";
		}else{
			request.getSession().invalidate();
			jyre="first.tiles";
		}
		return jyre;
	}

	@RequestMapping(value = "myinform.do", method = RequestMethod.GET)
	public String myinform(HttpServletRequest request, Model model) throws Exception {
		logger.info("Welcome HelloMemberController myinform! " + new Date());

		String jyre="";
		foot_user_DTO jyfudto = (foot_user_DTO) request.getSession().getAttribute("login");
		if(jyfudto==null){
			jyre="redirect:loginpopup1.do";
		}else{
			
			jyre="myinform.tiles";
		}
		return jyre;
	}
	
	@RequestMapping(value = "modify.do", method = RequestMethod.GET)
	public String modify(HttpServletRequest request, Model model) throws Exception {
		logger.info("Welcome HelloMemberController modify! " + new Date());
		String jyre="";
		foot_user_DTO jyfudto = (foot_user_DTO) request.getSession().getAttribute("login");
		if(jyfudto==null){
			jyre="redirect:loginpopup1.do";
		}else{
			
			jyre="modify.tiles";
		}
		return jyre;
	}
	@RequestMapping(value = "modify1.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String modify1(foot_user_DTO fudto,HttpServletRequest request, Model model) throws Exception {
		logger.info("Welcome HelloMemberController modify1! " + new Date());
		
		String jyre="";
		foot_user_DTO jyfudto = (foot_user_DTO) request.getSession().getAttribute("login");
		if(jyfudto==null){
			jyre="redirect:loginpopup1.do";
		}else{
			foot_user_DTO pw = (foot_user_DTO) request.getSession().getAttribute("login");
			
			if(pw.getUser_pw().equals(fudto.getUser_pw())){
				jyre = "modify1.tiles";
			}else{
				jyre = "modifyfail.tiles";
			}
			
		}
		return jyre;
		
	}
	
	@RequestMapping(value = "modify2.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String modify2(@RequestParam("file") MultipartFile file, foot_user_DTO fudto,HttpServletRequest request, Model model) throws Exception {
		logger.info("Welcome HelloMemberController modify2! " + new Date());
		
		String jyre="";
		foot_user_DTO jyfudto = (foot_user_DTO) request.getSession().getAttribute("login");
		if(jyfudto==null){
			jyre="redirect:loginpopup1.do";
		
		}else{
			
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
			
			
			jyre="redirect:myinform.do";
		}
		return jyre;
		
	}
	
	@RequestMapping(value = "search.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String search(HttpServletRequest request, Model model) throws Exception {
		
		List<foot_user_DTO> ulist = fuservice.userList();
		
		model.addAttribute("ulist", ulist);
		
		return "search.tiles";
	}
	
	@RequestMapping(value = "infoFind.do", method = { RequestMethod.GET, RequestMethod.POST })
	public void infoFind(Model model, HttpServletRequest request, HttpServletResponse response) throws MessagingException {

		String val = "gmail";

		String host = "smtp.gmail.com";
		String username = "bonum12@gmail.com";
		String password = "qkrdmswjd3!";

		// 메일 내용
		String recipient = request.getParameter("receive");
		String subject = "안녕하세요. 싸커원입니다. 찾으신 비밀번호를 보내드립니다.";
		String result = request.getParameter("result");
		System.out.println("result" + result);
		String body = "비밀번호 : " + result; // properties 설정

		Properties props = new Properties();
		props.put("mail.smtps.auth", "true"); // 메일 세션
		Session session = Session.getDefaultInstance(props);
		MimeMessage msg = new MimeMessage(session); // 메일 관련
		msg.setSubject(subject);
		msg.setText(body);
		msg.setFrom(new InternetAddress(username));
		msg.addRecipient(Message.RecipientType.TO, new InternetAddress(recipient)); // 발송
																					// 처리
		Transport transport = session.getTransport("smtps");
		transport.connect(host, username, password);
		transport.sendMessage(msg, msg.getAllRecipients());
		transport.close();

		model.addAttribute("val", val);

	}
	
}
