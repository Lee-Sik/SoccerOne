package soccer.co.controller;

import java.util.Date;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import soccer.co.DTO.BBSParam;
import soccer.co.DTO.foot_comunity_DTO;
import soccer.co.Service.foot_comunityService;

@Controller
public class comunityController {
	private static final Logger logger = 
	LoggerFactory.getLogger(comunityController.class);
	
	@Autowired
	private foot_comunityService BBSService;//IoC
	//DI 
	
	@RequestMapping(value = "comunity.do", method = {RequestMethod.GET,RequestMethod.POST})	
	public String comunity(Model model) throws Exception {	
		logger.info("Welcome gameController comunity! "+ new Date());
		
		List<foot_comunity_DTO> bbslist=BBSService.getBBSList();
		model.addAttribute("bbslist", bbslist);
		
		model.addAttribute("title", "커뮤니티");
		return "comunity.tiles";
	}
	
	
	@RequestMapping(value = "bbswrite.do", 
			method = {RequestMethod.GET,
			RequestMethod.POST})
	public String bbswrite(Model model) {
		logger.info("Welcome MemberController bbswrite! "+ new Date());
		model.addAttribute("title", "게시판 글쓰기");
		return "bbswrite.tiles";
	}
	
	@RequestMapping(value = "bbswriteAf.do", 
			method = RequestMethod.POST)
	public String bbswriteAf(foot_comunity_DTO bbs,Model model) throws Exception {
		logger.info("Welcome MemberController bbswriteAf! "+ new Date());
		System.out.println("topic = " + bbs.getTopic());
		System.out.println("id = " + bbs.getUser_email());
		BBSService.writeBBS(bbs);
		
		return "redirect:/bbslist.do";
	}
	
//	@RequestMapping(value = "bbslist.do", 
//			method = {RequestMethod.GET,
//			RequestMethod.POST})
//	public String bbslist(Model model) throws Exception {
//		logger.info("Welcome MemberController bbslist! "+ new Date());
//		
//		List<foot_comunity_DTO> bbslist=BBSService.getBBSList();
//		model.addAttribute("bbslist", bbslist);
//		
//		return "bbslist.tiles";
//	}
	
	
	@RequestMapping(value = "bbsreply.do", 
			method = RequestMethod.POST)
	public String bbsreply(foot_comunity_DTO bbs,Model model) throws Exception {
		logger.info("Welcome BBSController bbsreply! "+ new Date());
		model.addAttribute("head", "BBS");
		foot_comunity_DTO rbbs=BBSService.getBBS(bbs);
		
		model.addAttribute("bbs", rbbs);
		return "bbsreply.tiles";
	}//
	
	@RequestMapping(value = "bbsreplyAf.do", 
			method = RequestMethod.POST)
	public String bbsreplyAf(foot_comunity_DTO bbs,Model model) throws Exception {
		logger.info("Welcome BBSController bbsreplyAf! "+ new Date());
		//model.addAttribute("head", "BBS");
		BBSService.replyBBS(bbs);
		return "redirect:/bbslist.do";
	}
	
	@RequestMapping(value = "bbsupdate.do", 
			method = RequestMethod.POST)
	public String bbsupdate(foot_comunity_DTO bbs,Model model) throws Exception {
		logger.info("Welcome BBSController bbsupdate! "+ new Date());
				
		foot_comunity_DTO rbbs=BBSService.getBBS(bbs);		
		model.addAttribute("bbs", rbbs);
		return "bbsupdate.tiles";
	}
	
	@RequestMapping(value = "bbsupdateAf.do", 
			method = RequestMethod.POST)
	public String bbsupdateAf(foot_comunity_DTO bbs,Model model) throws Exception {
		logger.info("Welcome BBSController bbsupdateAf! "+ new Date());
		
		System.out.println("BBSDTO.seq = " + bbs.getBbs_no());
		System.out.println("BBSDTO.title = " + bbs.getTitle());
		System.out.println("BBSDTO.content = " + bbs.getContent());
			
		BBSService.updateBBS(bbs);
		return "redirect:/bbslist.do";
	}
	
	@RequestMapping(value = "bbsdel.do", 
			method = RequestMethod.POST)
	public String bbsdel(foot_comunity_DTO bbs,Model model) throws Exception {
		logger.info("Welcome BBSController bbsdel! "+ new Date());
		
		BBSService.delBBS(bbs);
		
		System.out.println("BBSDTO.seq = " + bbs.getBbs_no());
		System.out.println("BBSDTO.title = " + bbs.getTitle());
		System.out.println("BBSDTO.content = " + bbs.getContent());
		System.out.println("BBSDTO.del = " + bbs.getDel());
		
		return "redirect:/bbslist.do";
	}
	
	@RequestMapping(value = "bbslist.do", 
			method = {RequestMethod.GET,
			RequestMethod.POST})
	public String bbslist(BBSParam param,Model model) throws Exception {
		logger.info("Welcome MemberController bbslist! "+ new Date());
		logger.info("Welcome MemberController param! "+ param);
		int sn=param.getPageNumber();
		int start=(sn)*param.getRecordCountPerPage()+1;
		int end=(sn+1)*param.getRecordCountPerPage();
		
		param.setStart(start);
		param.setEnd(end);
		//logger.info("start number : "+sn);
		//logger.info("start : "+start);
		//logger.info("end : "+end);
		
		int totalRecordCount=BBSService.getBBSCount(param);
		List<foot_comunity_DTO> bbslist=BBSService.getBBSPagingList(param);
		model.addAttribute("bbslist", bbslist);
		model.addAttribute("doc_title", "BBS 리스트");
		
		model.addAttribute("pageNumber", sn);
		model.addAttribute("pageCountPerScreen", 10);
		model.addAttribute("recordCountPerPage", param.getRecordCountPerPage());
		model.addAttribute("totalRecordCount", totalRecordCount);
		
		model.addAttribute("s_category", param.getS_category());
		model.addAttribute("s_keyword", param.getS_keyword());
		
		
		model.addAttribute("title", "축덕포럼");
		return "bbslist.tiles";
	}
	
	@RequestMapping(value = "bbsdetail.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String bbsdetail(foot_comunity_DTO bbs,Model model) throws Exception {
		logger.info("Welcome MemberController bbsdetail! "+ new Date());
		logger.info("Welcome MemberController bbs.getBbs_no()! "+ bbs.getBbs_no());
		foot_comunity_DTO dto=BBSService.getBBS(bbs);
		
		BBSService.incrementReadCount(bbs);
		model.addAttribute("bbs",dto);
		model.addAttribute("title", "글 상세보기");
		
		return "bbsdetail.tiles";
	}
}

