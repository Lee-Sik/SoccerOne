package soccer.co.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class freeBookingController {

	@RequestMapping(value = "fbookingList.do", method = RequestMethod.GET)	
	public String fbookingList(Model model) {	
		
		return "fbookingList.tiles";
	}
	@RequestMapping(value = "fbookingWrite.do", method = RequestMethod.GET)	
	public String fbookingWrite(Model model) {	
		
		return "fbookingWrite.tiles";
	}
}
