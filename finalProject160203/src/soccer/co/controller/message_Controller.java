package soccer.co.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

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

import com.sun.org.apache.regexp.internal.recompile;

import soccer.co.DTO.foot_community_DTO;
import soccer.co.DTO.foot_message_DTO;
import soccer.co.DTO.foot_team_DTO;
import soccer.co.DTO.foot_user_DTO;

import soccer.co.Service.foot_messageService;
import soccer.co.Service.foot_userService;

@Controller
public class message_Controller {
	@Autowired
	foot_userService userservice;
	@Autowired
	foot_messageService messageservice;
	
	private static final Logger logger = LoggerFactory.getLogger(message_Controller.class);
	
	@RequestMapping(value = "teamapplymeg.do", method = {RequestMethod.GET,RequestMethod.POST})	
	public String teamapplymeg(foot_message_DTO fmdto, HttpServletRequest request, Model model) throws Exception {	
		logger.info("Welcome message_Controller teamapplymeg! "+ new Date());
		fmdto.setMercenaryre(0);
		fmdto.setTeamapplymegre(1);
		fmdto.setMatchingre(0);
		messageservice.message(fmdto);
		
		return "exit1.tiles";
	}
	
	@RequestMapping(value = "messagedetail.do", method = {RequestMethod.GET,RequestMethod.POST})	
	public String messagedetail(HttpServletRequest request, Model model) throws Exception {	
		logger.info("Welcome message_Controller messagedetail! "+ new Date());
		foot_user_DTO fudto = (foot_user_DTO) request.getSession().getAttribute("login");
		
		ArrayList<foot_message_DTO> list = messageservice.messagecheck(fudto);
		model.addAttribute("messagedetail", list);
		return "messagedetail.tiles";
	}
	
	@RequestMapping(value = "messagedetail1.do", method = {RequestMethod.GET,RequestMethod.POST})	
	public String messagedetail1(foot_message_DTO fmdto, HttpServletRequest request, Model model) throws Exception {	
		logger.info("Welcome message_Controller messagedetail1! "+ new Date());
		
		foot_message_DTO fmdto1 = messageservice.messagedetail(fmdto);
		
		messageservice.messageread(fmdto);
		
		model.addAttribute("messagedetail1", fmdto1);
		return "messagedetail1.tiles";
	}
	
	@RequestMapping(value = "teamapplyallow.do", method = {RequestMethod.GET,RequestMethod.POST})	
	public String teamapplyallow(foot_message_DTO fmdto, HttpServletRequest request, Model model) throws Exception {	
		logger.info("Welcome message_Controller teamapplyallow! "+ new Date());
		foot_message_DTO fmdto1 = new foot_message_DTO();
		fmdto1.setSender_user_email(fmdto.getReceiver_user_email());
		fmdto1.setReceiver_user_email(fmdto.getSender_user_email());
		fmdto1.setMessage_type("teamapplymeg");
		fmdto1.setMessage("팀 가입에 승인 되었습니다. 환영합니다.");
		
		fmdto.setMercenaryre(0);
		fmdto.setTeamapplymegre(0);
		fmdto.setMatchingre(0);
		messageservice.teamapply(fmdto);
		messageservice.message(fmdto1);
		
		
		foot_user_DTO fudto = new foot_user_DTO();
		foot_user_DTO fudto1 = (foot_user_DTO) request.getSession().getAttribute("login");
		fudto.setUser_team(fudto1.getUser_team());
		fudto.setUser_email(fmdto.getSender_user_email());
		
		messageservice.join(fudto);
		
		return "redirect:messagedetail.do";
	}
	
	@RequestMapping(value = "teamapplyrefuse.do", method = {RequestMethod.GET,RequestMethod.POST})	
	public String teamapplyrefuse(foot_message_DTO fmdto, HttpServletRequest request, Model model) throws Exception {	
		logger.info("Welcome message_Controller teamapplyrefuse! "+ new Date());
		foot_message_DTO fmdto1 = new foot_message_DTO();
		fmdto1.setSender_user_email(fmdto.getReceiver_user_email());
		fmdto1.setReceiver_user_email(fmdto.getSender_user_email());
		fmdto1.setMessage_type("teamapplymeg");
		fmdto1.setMessage("팀 가입에 거절 되었습니다. 죄송합니다.");
		messageservice.teamapply(fmdto);
		fmdto.setMercenaryre(0);
		fmdto.setTeamapplymegre(0);
		fmdto.setMatchingre(0);
		messageservice.message(fmdto1);
		return "redirect:messagedetail.do";
	}
	
		@RequestMapping(value = "messageanswer.do", method = {RequestMethod.GET,RequestMethod.POST})	
	public String messageanswer(foot_message_DTO fmdto, HttpServletRequest request, Model model) throws Exception {	
		logger.info("Welcome message_Controller messageanswer! "+ new Date());
		foot_message_DTO fmdto1 = new foot_message_DTO();
		fmdto1.setSender_user_email(fmdto.getReceiver_user_email());
		fmdto1.setReceiver_user_email(fmdto.getSender_user_email());
		model.addAttribute("message", fmdto1);
		return "messageanswer.tiles";
	}
		@RequestMapping(value = "messageanswer1.do", method = {RequestMethod.GET,RequestMethod.POST})	
		public String messageanswer1(foot_message_DTO fmdto, HttpServletRequest request, Model model) throws Exception {	
			logger.info("Welcome message_Controller messageanswer1! "+ new Date());
			fmdto.setMercenaryre(0);
			fmdto.setTeamapplymegre(0);
			fmdto.setMatchingre(0);
			messageservice.message(fmdto);
			return "redirect:messagedetail.do";
		}
		@RequestMapping(value = "messagesend.do", method = {RequestMethod.GET,RequestMethod.POST})	
		public String messagesend(HttpServletRequest request, Model model) throws Exception {	
			logger.info("Welcome message_Controller messagesend! "+ new Date());
			
			
			return "messagesend.tiles";
		}
		@RequestMapping(value = "messagesend1.do", method = {RequestMethod.GET,RequestMethod.POST})	
		public String messagesend1(foot_message_DTO fmdto,HttpServletRequest request, Model model) throws Exception {	
			logger.info("Welcome message_Controller messagesend! "+ new Date());
			fmdto.setMercenaryre(0);
			fmdto.setTeamapplymegre(0);
			fmdto.setMatchingre(0);
			messageservice.message(fmdto);
			return "redirect:messagedetail.do";
		}
		@RequestMapping(value = "messagesendlist.do", method = {RequestMethod.GET,RequestMethod.POST})	
		public String messagesendlist(foot_message_DTO fmdto,HttpServletRequest request, Model model) throws Exception {	
			logger.info("Welcome message_Controller messagesendlist! "+ new Date());
			
			ArrayList<foot_message_DTO> list= messageservice.messagesendlist(fmdto);
			model.addAttribute("messagesendlist", list);
			return "messagesendlist.tiles";
		}
		
		@RequestMapping(value = "messagesendlist1.do", method = {RequestMethod.GET,RequestMethod.POST})	
		public String messagesendlist1(foot_message_DTO fmdto,HttpServletRequest request, Model model) throws Exception {	
			logger.info("Welcome message_Controller messagesendlist1! "+ new Date());
			
			foot_message_DTO fmdto1= messageservice.messagedetail(fmdto);
			model.addAttribute("messagesendlist1", fmdto1);
			return "messagesendlist1.tiles";
		}
}
