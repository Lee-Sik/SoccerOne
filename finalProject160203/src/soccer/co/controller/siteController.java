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
	
	@RequestMapping(value = "introduce.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String introduce(Model model) throws Exception {
		logger.info("Welcome siteController matching! " + new Date());
		
		model.addAttribute("title", "사이트");
		
		return "introduce.tiles";
	}
	
	@RequestMapping(value = "address.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String address(Model model) throws Exception {
		logger.info("Welcome siteController matching! " + new Date());
		
		model.addAttribute("title", "연락처");
		
		return "address.tiles";
	}
	
}
