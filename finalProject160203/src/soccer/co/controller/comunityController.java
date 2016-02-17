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

import com.sun.org.apache.regexp.internal.recompile;

import soccer.co.DTO.BBSParam;
import soccer.co.DTO.foot_comment_DTO;
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
	
	
	@RequestMapping(value = "bbswrite.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String bbswrite(Model model) {
		logger.info("Welcome MemberController bbswrite! "+ new Date());
		model.addAttribute("title", "게시판 글쓰기");
		return "bbswrite.tiles";
	}
	
	@RequestMapping(value = "bbswriteAf.do", method = RequestMethod.POST)
	public String bbswriteAf(@RequestParam("file") MultipartFile file, 
			foot_comunity_DTO bbs,Model model,String topic, String user_email, String title, String content) throws Exception {
		logger.info("Welcome MemberController bbswriteAf! "+ new Date());

		String fileName = null;
		File upload = null;
		
		if (!file.isEmpty()) {
			try {
				fileName = file.getOriginalFilename();
				
				//upload = new File("/Users/chojaeyong/Desktop/eclipse3/finalProject160203/WebContent/image/" + fileName);
				//upload = new File("C:/Users/RyuDung/Desktop/study_jsp/eclipse/finalProject160203/WebContent/image/" + fileName);
				//upload = new File("C:/springstudy/finalProject160203/WebContent/image/" + fileName);
//				upload = new File("file://211.238.142.152/share/siksama/" + fileName);
				upload = new File("c://image/" + fileName);
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
		bbs.setTopic(topic);
		bbs.setTitle(title);
		bbs.setContent(content);
		
//		try{
//			clubservice.join(team);//팀생성 실패시 어떻게 할까?
//			req.getSession().setAttribute("team",team);
//		}catch(Exception e){
//			e.printStackTrace();
//		}
		BBSService.writeBBS(bbs);
		
		return "redirect:/bbslist.do";
	}
	
	@RequestMapping(value = "commentAf.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String commentAf(int parent_no, foot_comment_DTO comdto,Model model) throws Exception {
		logger.info("Welcome BBSController commentAf! "+ new Date());
		
		comdto.setParent_bbs_no(parent_no);
		
		BBSService.writeComment(comdto);
		
		return  "redirect:/bbsdetail.do?bbs_no=" + parent_no;
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
	public String bbsdetail(foot_comunity_DTO bbs,Model model,HttpServletRequest request) throws Exception {
		
		int bbs_no = Integer.parseInt(request.getParameter("bbs_no"));
		
		//int parent_no = Integer.parseInt(request.getParameter("parent_no"));
		
		List<foot_comment_DTO> comdto  = BBSService.getCommentList(bbs_no);
		
		model.addAttribute("comlist",comdto);
		
		foot_comunity_DTO dto=BBSService.getBBS(bbs);
		
		BBSService.incrementReadCount(bbs);
		model.addAttribute("bbs",dto);
		model.addAttribute("title", "글 상세보기");
		
		return "bbsdetail.tiles";
	}
}

