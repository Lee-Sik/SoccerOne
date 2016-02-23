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
		messageservice.teamapplymeg(fmdto);
		
		return "exit1.tiles";
	}
	
}
