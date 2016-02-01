package soccer.co.controller;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import soccer.co.DTO.foot_user_DTO;
import soccer.co.Service.foot_userService;

@Controller
public class userController {
	@Autowired
	foot_userService fuservice;
	
private static final Logger logger = LoggerFactory.getLogger(userController.class);
	
	@RequestMapping(value = "first.do", method = {RequestMethod.GET,RequestMethod.POST})	
	public String first(Model model) {	
		logger.info("Welcome HelloMemberController first! "+ new Date());
		
		return "first.tiles";
	}
	@RequestMapping(value = "login.do", method = {RequestMethod.GET,RequestMethod.POST})	
	public String login(foot_user_DTO fudto, HttpServletRequest request, Model model) throws Exception {	
		logger.info("Welcome HelloMemberController login! "+ new Date());
		foot_user_DTO login = fuservice.login(fudto);
		request.getSession().setAttribute("login", login);
		return "login.tiles";
	}
	@RequestMapping(value = "join.do", method = {RequestMethod.GET,RequestMethod.POST})	
	public String join(foot_user_DTO fudto, HttpServletRequest request, Model model) throws Exception {	
		logger.info("Welcome HelloMemberController join! "+ new Date());
		
		return "join.tiles";
	}
	@RequestMapping(value = "join1.do", method = {RequestMethod.GET,RequestMethod.POST})	
	public String join1(foot_user_DTO fudto, HttpServletRequest request, Model model) throws Exception {	
		logger.info("Welcome HelloMemberController join1! "+ new Date());
		boolean join=fuservice.join(fudto);
		return "exit.tiles";
	}
}
