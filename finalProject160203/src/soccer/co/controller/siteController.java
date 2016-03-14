package soccer.co.controller;

import java.util.Date;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class siteController {
	
	private static final Logger logger = LoggerFactory.getLogger(siteController.class);
	
	@RequestMapping(value = "hello.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String hello(Model model) throws Exception {
		logger.info("Welcome siteController hello! " + new Date());
		
		model.addAttribute("title", "hello");
		model.addAttribute("menuNum", 0);
		
		return "hello.tiles";
	}
	
	@RequestMapping(value = "introduce.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String introduce(Model model) throws Exception {
		logger.info("Welcome siteController introduce! " + new Date());
		
		model.addAttribute("title", "introduce");
		model.addAttribute("menuNum", 1);
		return "introduce.tiles";
	}
	
	@RequestMapping(value = "contact.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String contact(Model model) throws Exception {
		logger.info("Welcome siteController contact! " + new Date());
		
		model.addAttribute("title", "contact");
		model.addAttribute("menuNum", 2);
		return "contact.tiles";
	}
	
}
