package soccer.co.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
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

import soccer.co.DTO.BBSParam;
import soccer.co.DTO.foot_comment_DTO;
import soccer.co.DTO.foot_comunity_DTO;
import soccer.co.DTO.foot_like_DTO;
import soccer.co.DTO.foot_user_DTO;
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
	
	
	@RequestMapping(value = "bbswrite.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String bbswrite(Model model) {
		logger.info("Welcome MemberController bbswrite! "+ new Date());
		model.addAttribute("title", "게시판 글쓰기");
		return "bbswrite.tiles";
	}
	
	@RequestMapping(value = "bbswriteAf.do", method = RequestMethod.POST)
	public String bbswriteAf(foot_comunity_DTO bbs,Model model,String topic, String user_email, String title, String ir1) throws Exception {
		logger.info("Welcome MemberController bbswriteAf! "+ new Date());
		
		bbs.setUser_email(user_email);
		bbs.setTopic(topic);
		bbs.setTitle(title);
		bbs.setContent(ir1);
		
		BBSService.writeBBS(bbs);
		
		return "redirect:/bbslist.do";
	}
	
//	@RequestMapping(value = "bbswriteAf.do", method = RequestMethod.POST)
//	public String bbswriteAf(@RequestParam("file") MultipartFile file, 
//			foot_comunity_DTO bbs,Model model,String topic, String user_email, String title, String content) throws Exception {
//		logger.info("Welcome MemberController bbswriteAf! "+ new Date());
//
//		String fileName = null;
//		File upload = null;
//		
//		if (!file.isEmpty()) {
//			try {
//				fileName = file.getOriginalFilename();
//				
//				upload = new File("//211.238.142.152/공유/ryu/" + fileName);
//				// 
//				byte[] bytes = file.getBytes();
//				BufferedOutputStream buffStream = new BufferedOutputStream(
//						new FileOutputStream(upload));
//
//				buffStream.write(bytes);
//				buffStream.close();
//				bbs.setImageurl(fileName);
//				
//				System.out.println("You have successfully uploaded " + fileName);
//			} catch (Exception e) {
//				e.printStackTrace();
//			}
//		} else {
//			System.out.println("empty!!!!!!!!");
//			bbs.setImageurl("");
//		}
//		
//		bbs.setUser_email(user_email);
//		bbs.setTopic(topic);
//		bbs.setTitle(title);
//		bbs.setContent(content);
//		
//		BBSService.writeBBS(bbs);
//		
//		return "redirect:/bbslist.do";
//	}
	
	@RequestMapping(value = "commentAf.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String commentAf(int parent_no, foot_comment_DTO comdto, Model model) throws Exception {
		logger.info("Welcome BBSController commentAf! "+ new Date());
		
		comdto.setParent_bbs_no(parent_no);
		
		foot_comunity_DTO bbs = new foot_comunity_DTO();
		
		bbs.setBbs_no(parent_no);
		
		BBSService.incrementCommentCount(bbs);
		BBSService.writeComment(comdto);
		
		return  "redirect:/bbsdetail.do?bbs_no=" + parent_no;
	}
	
	@RequestMapping(value = "bbslike.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String bbslike(int bbs_no, String user_email, foot_like_DTO flike, Model model) throws Exception {
		logger.info("Welcome BBSController bbslike! "+ new Date());
		
		flike.setParent_bbs_no(bbs_no);
		flike.setUser_email(user_email);
		BBSService.bbsLike(flike);
		
		BBSService.bbsLikeCount(bbs_no);
		
		
		return  "redirect:/bbsdetail.do?bbs_no=" + bbs_no;
	}
	
	@RequestMapping(value = "bbslikedel.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String bbslikedel(int bbs_no, String user_email, foot_like_DTO flike, Model model) throws Exception {
		logger.info("Welcome BBSController bbslikedel! "+ new Date());
		
		flike.setParent_bbs_no(bbs_no);
		flike.setUser_email(user_email);
		BBSService.bbsLikeDel(flike);
		
		BBSService.bbsLikeCountDel(bbs_no);
		
		
		return  "redirect:/bbsdetail.do?bbs_no=" + bbs_no;
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
		model.addAttribute("title", "글 수정");
		
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
	
	@RequestMapping(value = "bbslist.do", method = {RequestMethod.GET, RequestMethod.POST})
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
	public String bbsdetail(BBSParam param,foot_comunity_DTO bbs,Model model,HttpServletRequest request) throws Exception {
		
		int bbs_no = Integer.parseInt(request.getParameter("bbs_no"));
		
		//int parent_no = Integer.parseInt(request.getParameter("parent_no"));
		
		List<foot_comment_DTO> comdto  = BBSService.getCommentList(bbs_no);
		
		model.addAttribute("comlist",comdto);
		
		foot_comunity_DTO dto=BBSService.getBBS(bbs);
		
		BBSService.incrementReadCount(bbs);
		model.addAttribute("bbs",dto);
		model.addAttribute("title", "글 상세보기");
		
		foot_user_DTO fudto = (foot_user_DTO) request.getSession().getAttribute("login");
		
		String user_email = fudto.getUser_email();
		
		System.out.println("bbs_no = " + bbs_no);
		System.out.println("user_email = " + user_email);
		
		foot_like_DTO flike = new foot_like_DTO();
		
		flike.setParent_bbs_no(bbs_no);
		flike.setUser_email(user_email);
		
		foot_like_DTO fdto = BBSService.getLike(flike);
		
		//System.out.println("parent_bbs_no = " + fdto.getParent_bbs_no());
		//System.out.println("id = " + fdto.getUser_email());
		
		model.addAttribute("flike",fdto);
		
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
		
		
		return "bbsdetail.tiles";
	}
	
	@RequestMapping(value = "commentlist.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String commentlist(Model model,HttpServletRequest request) throws Exception {
		
		int bbs_no = Integer.parseInt(request.getParameter("bbs_no"));
		
		List<foot_comment_DTO> comdto  = BBSService.getCommentList(bbs_no);
		
		model.addAttribute("comlist",comdto);
		model.addAttribute("bbs_no",bbs_no);
		
		return "commentlist.tiles";
	}
	
	@RequestMapping(value = "commentdel.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String commentdel(foot_comment_DTO comdto, foot_comunity_DTO bbs, Model model,HttpServletRequest request) throws Exception {
		logger.info("Welcome BBSController commentdel! "+ new Date());
		String mode = request.getParameter("mode");
		int comment_no = Integer.parseInt(request.getParameter("comment_no"));
		int bbs_no = Integer.parseInt(request.getParameter("bbs_no"));
		
		comdto.setComment_no(comment_no);
		BBSService.delComment(comdto);
		
		bbs.setBbs_no(bbs_no);
		BBSService.decrementCommentCount(bbs);
		
		if(mode.equals("popuplist")){
			return "redirect:/commentlist.do?bbs_no=" + bbs_no;
		}else{
			return "redirect:/bbsdetail.do?bbs_no=" + bbs_no;
		}
		
	}
	
	@RequestMapping(value = "commentupdate.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String commentupdate(foot_comment_DTO comdto ,Model model,HttpServletRequest request) throws Exception {
		logger.info("Welcome BBSController commentupdate! "+ new Date());

		int comment_no = Integer.parseInt(request.getParameter("comment_no"));

		comdto.setComment_no(comment_no);

		foot_comment_DTO com = BBSService.getComment(comdto);

		model.addAttribute("com",com);

		return "commentupdate.tiles";
	}
	
	@RequestMapping(value = "commentupdateAf.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String commentupdateAf(foot_comment_DTO comdto ,Model model,HttpServletRequest request) throws Exception {
		logger.info("Welcome BBSController commentupdateAf! "+ new Date());
		
		int comment_no = Integer.parseInt(request.getParameter("comment_no"));
		String content = request.getParameter("content");
		
		System.out.println("comment_no = " + comment_no);
		System.out.println("content = " + content);
		
		
		comdto.setComment_no(comment_no);
		comdto.setContent(content);
		
		BBSService.updateComment(comdto);

		return "bbsupdate.tiles"; 
	}
	
	
}

