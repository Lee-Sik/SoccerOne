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
import soccer.co.DTO.foot_community_DTO;
import soccer.co.DTO.foot_like_DTO;
import soccer.co.DTO.foot_user_DTO;
import soccer.co.Service.foot_communityService;

@Controller
public class communityController {
	private static final Logger logger = 
	LoggerFactory.getLogger(communityController.class);
	
	@Autowired
	private foot_communityService BBSService;//IoC
	//DI 
	
	// COMMUNITY Main
	@RequestMapping(value = "community.do", method = {RequestMethod.GET,RequestMethod.POST})	
	public String community(Model model) throws Exception {	
		logger.info("Welcome gameController community! "+ new Date());
		
		List<foot_community_DTO> bbslist=BBSService.getBBSList();
		model.addAttribute("bbslist", bbslist);
		
		model.addAttribute("title", "커뮤니티");
		return "community.tiles";
	}
	
	// BBS List
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
		List<foot_community_DTO> bbslist=BBSService.getBBSPagingList(param);
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
	
	// BBS Write
	@RequestMapping(value = "bbswrite.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String bbswrite(Model model) {
		logger.info("Welcome MemberController bbswrite! "+ new Date());
		model.addAttribute("title", "게시판 글쓰기");
		return "bbswrite.tiles";
	}
	
	// BBS WriteAf
	@RequestMapping(value = "bbswriteAf.do", method = RequestMethod.POST)
	public String bbswriteAf(foot_community_DTO bbs,Model model,String topic, String user_email, String title, String content) throws Exception {
		logger.info("Welcome MemberController bbswriteAf! "+ new Date());
		
		bbs.setUser_email(user_email);
		bbs.setTopic(topic);
		bbs.setTitle(title);
		bbs.setContent(content);
		
		BBSService.writeBBS(bbs);
		
		return "redirect:/bbslist.do";
	}
	
	// CommentAf
	@RequestMapping(value = "commentAf.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String commentAf(int parent_no, foot_comment_DTO comdto, Model model) throws Exception {
		logger.info("Welcome BBSController commentAf! "+ new Date());
		
		comdto.setParent_bbs_no(parent_no);
		
		foot_community_DTO bbs = new foot_community_DTO();
		
		bbs.setBbs_no(parent_no);
		
		BBSService.incrementCommentCount(bbs);
		BBSService.writeComment(comdto);
		
		return  "redirect:/bbsdetail.do?bbs_no=" + parent_no;
	}
	
	// BBS Like
	@RequestMapping(value = "bbslike.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String bbslike(int bbs_no, String user_email, foot_like_DTO flike, Model model) throws Exception {
		logger.info("Welcome BBSController bbslike! "+ new Date());
		
		flike.setParent_bbs_no(bbs_no);
		flike.setUser_email(user_email);
		BBSService.bbsLike(flike);
		
		BBSService.bbsLikeCount(bbs_no);
		
		
		return  "redirect:/bbsdetail.do?bbs_no=" + bbs_no;
	}
	
	// BBS Like Del
	@RequestMapping(value = "bbslikedel.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String bbslikedel(int bbs_no, String user_email, foot_like_DTO flike, Model model) throws Exception {
		logger.info("Welcome BBSController bbslikedel! "+ new Date());
		
		flike.setParent_bbs_no(bbs_no);
		flike.setUser_email(user_email);
		BBSService.bbsLikeDel(flike);
		
		BBSService.bbsLikeCountDel(bbs_no);
		
		
		return  "redirect:/bbsdetail.do?bbs_no=" + bbs_no;
	}
	
	// BBS Update
	@RequestMapping(value = "bbsupdate.do", method = RequestMethod.POST)
	public String bbsupdate(foot_community_DTO bbs,Model model) throws Exception {
		logger.info("Welcome BBSController bbsupdate! "+ new Date());
				
		foot_community_DTO rbbs=BBSService.getBBS(bbs);		
		model.addAttribute("bbs", rbbs);
		model.addAttribute("title", "글 수정");
		
		return "bbsupdate.tiles";
	}
	
	// BBS UpdateAf
	@RequestMapping(value = "bbsupdateAf.do", method = RequestMethod.POST)
	public String bbsupdateAf(foot_community_DTO bbs,Model model) throws Exception {
		logger.info("Welcome BBSController bbsupdateAf! "+ new Date());
		
		System.out.println("BBSDTO.seq = " + bbs.getBbs_no());
		System.out.println("BBSDTO.title = " + bbs.getTitle());
		System.out.println("BBSDTO.content = " + bbs.getContent());
		
		BBSService.updateBBS(bbs);
		return "redirect:/bbslist.do";
	}
	
	// BBS Delete
	@RequestMapping(value = "bbsdel.do", method = RequestMethod.POST)
	public String bbsdel(foot_community_DTO bbs,Model model) throws Exception {
		logger.info("Welcome BBSController bbsdel! "+ new Date());
		
		BBSService.delBBS(bbs);
		
		System.out.println("BBSDTO.seq = " + bbs.getBbs_no());
		System.out.println("BBSDTO.title = " + bbs.getTitle());
		System.out.println("BBSDTO.content = " + bbs.getContent());
		System.out.println("BBSDTO.del = " + bbs.getDel());
		
		return "redirect:/bbslist.do";
	}
	
	// BBS Detail
	@RequestMapping(value = "bbsdetail.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String bbsdetail(BBSParam param,foot_community_DTO bbs,Model model,HttpServletRequest request) throws Exception {
		
		int bbs_no = Integer.parseInt(request.getParameter("bbs_no"));
		
		//int parent_no = Integer.parseInt(request.getParameter("parent_no"));
		
		List<foot_comment_DTO> comdto  = BBSService.getCommentList(bbs_no);
		
		model.addAttribute("comlist",comdto);
		
		foot_community_DTO dto=BBSService.getBBS(bbs);
		
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
		List<foot_community_DTO> bbslist=BBSService.getBBSPagingList(param);
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
	
	// BBS Comment List
	@RequestMapping(value = "commentlist.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String commentlist(Model model,HttpServletRequest request) throws Exception {
		
		int bbs_no = Integer.parseInt(request.getParameter("bbs_no"));
		
		List<foot_comment_DTO> comdto  = BBSService.getCommentList(bbs_no);
		
		model.addAttribute("comlist",comdto);
		model.addAttribute("bbs_no",bbs_no);
		
		return "commentlist.tiles";
	}
	
	// BBS Comment Delete
	@RequestMapping(value = "commentdel.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String commentdel(foot_comment_DTO comdto, foot_community_DTO bbs, Model model,HttpServletRequest request) throws Exception {
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
	
	// BBS Comment Update
	@RequestMapping(value = "commentupdate.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String commentupdate(foot_comment_DTO comdto ,Model model,HttpServletRequest request) throws Exception {
		logger.info("Welcome BBSController commentupdate! "+ new Date());

		int comment_no = Integer.parseInt(request.getParameter("comment_no"));
		
		comdto.setComment_no(comment_no);

		foot_comment_DTO com = BBSService.getComment(comdto);

		model.addAttribute("com",com);

		return "commentupdate.tiles";
	}
	
	// BBS Comment UpdateAf
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
	
//	@RequestMapping(value = "bbswriteAf.do", method = RequestMethod.POST)
//	public String bbswriteAf(@RequestParam("file") MultipartFile file, 
//			foot_community_DTO bbs,Model model,String topic, String user_email, String title, String content) throws Exception {
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

//	@RequestMapping(value = "bbslist.do", 
//			method = {RequestMethod.GET,
//			RequestMethod.POST})
//	public String bbslist(Model model) throws Exception {
//		logger.info("Welcome MemberController bbslist! "+ new Date());
//		
//		List<foot_community_DTO> bbslist=BBSService.getBBSList();
//		model.addAttribute("bbslist", bbslist);
//		
//		return "bbslist.tiles";
//	}
	
	// Gallery Write
	@RequestMapping(value = "gallerywrite.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String gallerywrite(Model model) {
		logger.info("Welcome MemberController gallerywrite! "+ new Date());
		model.addAttribute("title", "짤방 글쓰기");
		return "gallerywrite.tiles";
	}
	
	// Gallery WriteAf
	@RequestMapping(value = "gallerywriteAf.do", method = RequestMethod.POST)
	public String gallerywriteAf(@RequestParam("file") MultipartFile file, 
			foot_community_DTO bbs,Model model, String user_email, String title, String content) throws Exception {
		logger.info("Welcome MemberController gallerywriteAf! "+ new Date());

		String fileName = null;
		File upload = null;
		
		if (!file.isEmpty()) {
			try {
				fileName = file.getOriginalFilename();
				
				upload = new File("//211.238.142.152/공유/ryu/" + fileName);
				// 
				byte[] bytes = file.getBytes();
				BufferedOutputStream buffStream = new BufferedOutputStream(
						new FileOutputStream(upload));

				buffStream.write(bytes);
				buffStream.close();
				bbs.setImageurl(fileName);
				
				System.out.println("You have successfully uploaded " + fileName);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			System.out.println("empty!!!!!!!!");
			bbs.setImageurl("");
		}
		
		bbs.setUser_email(user_email);
		bbs.setTitle(title);
		bbs.setContent(content);
		
		BBSService.writeGallery(bbs);
		
		return "redirect:/gallerylist.do";
	}
	
	// Gallery List
		@RequestMapping(value = "gallerylist.do", method = {RequestMethod.GET, RequestMethod.POST})
		public String gallerylist(BBSParam param,Model model) throws Exception {
			logger.info("Welcome MemberController gallerylist! "+ new Date());
			logger.info("Welcome MemberController param! "+ param);
			int sn=param.getPageNumber();
			int start=(sn)*param.getRecordCountPerPage()+1;
			int end=(sn+1)*param.getRecordCountPerPage();
			
			param.setStart(start);
			param.setEnd(end);
			//logger.info("start number : "+sn);
			//logger.info("start : "+start);
			//logger.info("end : "+end);
			
			int totalRecordCount=BBSService.getGalleryCount(param);
			List<foot_community_DTO> gallerylist=BBSService.getGalleryPagingList(param);
			model.addAttribute("gallerylist", gallerylist);
			
			model.addAttribute("pageNumber", sn);
			model.addAttribute("pageCountPerScreen", 10);
			model.addAttribute("recordCountPerPage", param.getRecordCountPerPage());
			model.addAttribute("totalRecordCount", totalRecordCount);
			
			model.addAttribute("s_category", param.getS_category());
			model.addAttribute("s_keyword", param.getS_keyword());
					
			model.addAttribute("title", "짤방게시판");

			return "gallerylist.tiles";
		}
	
		// BBS Detail
		@RequestMapping(value = "gallerydetail.do", method = {RequestMethod.GET,RequestMethod.POST})
		public String gallerydetail(BBSParam param,foot_community_DTO bbs,Model model,HttpServletRequest request) throws Exception {
			
			int gallery_no = Integer.parseInt(request.getParameter("gallery_no"));
			
			//int parent_no = Integer.parseInt(request.getParameter("parent_no"));
			
			List<foot_comment_DTO> comdto  = BBSService.getGalCommentList(gallery_no);
			
			model.addAttribute("comlist",comdto);
			
			foot_community_DTO dto=BBSService.getGallery(bbs);
			
			BBSService.incrementGalReadCount(bbs);
			model.addAttribute("gal",dto);
			model.addAttribute("title", "글 상세보기");
			
			foot_user_DTO fudto = (foot_user_DTO) request.getSession().getAttribute("login");
			
			String user_email = fudto.getUser_email();
			
			System.out.println("gallery_no = " + gallery_no);
			System.out.println("user_email = " + user_email);
			
			foot_like_DTO flike = new foot_like_DTO();
			
			flike.setParent_gallery_no(gallery_no);
			flike.setUser_email(user_email);
			
			foot_like_DTO fdto = BBSService.getGalLike(flike);
			
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
			
			int totalRecordCount=BBSService.getGalleryCount(param);
			List<foot_community_DTO> gallerylist=BBSService.getGalleryPagingList(param);
			model.addAttribute("gallerylist", gallerylist);
			model.addAttribute("doc_title", "BBS 리스트");
			
			model.addAttribute("pageNumber", sn);
			model.addAttribute("pageCountPerScreen", 10);
			model.addAttribute("recordCountPerPage", param.getRecordCountPerPage());
			model.addAttribute("totalRecordCount", totalRecordCount);
			
			model.addAttribute("s_category", param.getS_category());
			model.addAttribute("s_keyword", param.getS_keyword());
			
			
			return "gallerydetail.tiles";
		}
	
		// Gallery CommentAf
		@RequestMapping(value = "galcommentAf.do", method = {RequestMethod.GET, RequestMethod.POST})
		public String galcommentAf(int parent_no, foot_comment_DTO comdto, Model model) throws Exception {
			logger.info("Welcome BBSController galcommentAf! "+ new Date());
			
			comdto.setParent_gallery_no(parent_no);
			
			foot_community_DTO bbs = new foot_community_DTO();
			
			bbs.setGallery_no(parent_no);
			
			BBSService.incrementGalCommentCount(bbs);
			BBSService.writeGalComment(comdto);
			
			return  "redirect:/gallerydetail.do?gallery_no=" + parent_no;
		}
	
		// Gallery Like
		@RequestMapping(value = "gallike.do", method = {RequestMethod.GET, RequestMethod.POST})
		public String gallike(int gallery_no, String user_email, foot_like_DTO flike, Model model) throws Exception {
			logger.info("Welcome BBSController gallike! "+ new Date());
			
			flike.setParent_gallery_no(gallery_no);
			flike.setUser_email(user_email);
			BBSService.galLike(flike);
			
			BBSService.galLikeCount(gallery_no);
			
			
			return  "redirect:/gallerydetail.do?gallery_no=" + gallery_no;
		}
		
		// Gallery Like Del
		@RequestMapping(value = "gallikedel.do", method = {RequestMethod.GET, RequestMethod.POST})
		public String gallikedel(int gallery_no, String user_email, foot_like_DTO flike, Model model) throws Exception {
			logger.info("Welcome BBSController gallikedel! "+ new Date());
			
			flike.setParent_gallery_no(gallery_no);
			flike.setUser_email(user_email);
			BBSService.galLikeDel(flike);
			
			BBSService.galLikeCountDel(gallery_no);
			
			
			return  "redirect:/gallerydetail.do?gallery_no=" + gallery_no;
		}
		
		
		// Gallery Update
		@RequestMapping(value = "galleryupdate.do", method = RequestMethod.POST)
		public String galleryupdate(foot_community_DTO bbs,Model model) throws Exception {
			logger.info("Welcome BBSController galleryupdate! "+ new Date());
					
			foot_community_DTO rbbs=BBSService.getGallery(bbs);		
			model.addAttribute("gal", rbbs);
			model.addAttribute("title", "짤방 수정");
			
			return "galleryupdate.tiles";
		}
		
		// Gallery UpdateAf
		@RequestMapping(value = "galleryupdateAf.do", method = RequestMethod.POST)
		public String galleryupdateAf(foot_community_DTO bbs,Model model) throws Exception {
			logger.info("Welcome BBSController galleryupdateAf! "+ new Date());
					
			BBSService.updateGallery(bbs);
			return "redirect:/gallerylist.do";
		}
		
		// Gallery Delete
		@RequestMapping(value = "gallerydel.do", method = RequestMethod.POST)
		public String gallerydel(foot_community_DTO bbs,Model model) throws Exception {
			logger.info("Welcome BBSController gallerydel! "+ new Date());
			
			BBSService.delGallery(bbs);
	
			return "redirect:/gallerylist.do";
		}
		
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	@RequestMapping(value = "bbsreply.do", method = RequestMethod.POST)
	public String bbsreply(foot_community_DTO bbs,Model model) throws Exception {
		logger.info("Welcome BBSController bbsreply! "+ new Date());
		model.addAttribute("head", "BBS");
		foot_community_DTO rbbs=BBSService.getBBS(bbs);
		
		model.addAttribute("bbs", rbbs);
		return "bbsreply.tiles";
	}//
	
	@RequestMapping(value = "bbsreplyAf.do", method = RequestMethod.POST)
	public String bbsreplyAf(foot_community_DTO bbs,Model model) throws Exception {
		logger.info("Welcome BBSController bbsreplyAf! "+ new Date());
		//model.addAttribute("head", "BBS");
		BBSService.replyBBS(bbs);
		return "redirect:/bbslist.do";
	}

}

