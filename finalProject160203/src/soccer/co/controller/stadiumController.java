package soccer.co.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import soccer.co.DTO.ZipcodeDTO;
import soccer.co.DTO.foot_stadium_DTO;
import soccer.co.Service.foot_stadiumService;

@Controller
public class stadiumController {
	
	@Autowired
	private foot_stadiumService service;
	
	@RequestMapping(value = "stadium_write.do", method = RequestMethod.GET)	
	public String stadium_write(Model model) {		
		
		 int a = (int) (Math.random()*10);
	     int b = (int) (Math.random()*10);
	     int c = (int) (Math.random()*10);
	     int d = (int) (Math.random()*10);
	     int e = (int) (Math.random()*10);
	     int f = (int) (Math.random()*10);
		
	     String result = Integer.toString(a) + Integer.toString(b) + Integer.toString(c) + Integer.toString(d)
	     + Integer.toString(e)+ Integer.toString(f);
	     
	     model.addAttribute("result", result);
	     model.addAttribute("title", "공식대관");
		
		return "stadium_write.tiles";
	}
	@RequestMapping(value = "bookingList.do", method = RequestMethod.GET)	
	public String bookingList(Model model) {		
		
		return "bookingList.tiles";
	}
	@RequestMapping(value = "zipsearch.do", method = RequestMethod.GET)	
	public String zipsearch(Model model) {		
		
		return "zipsearch.tiles";
	}
	@RequestMapping(value = "zipsearch_result.do", method = {RequestMethod.GET,RequestMethod.POST})	
	public String zipsearch_result(Model model,String dong) throws Exception {		
		
		List<ZipcodeDTO> list = service.zipcode(dong);
		
		model.addAttribute("list", list);
		
		return "zipsearch_result.tiles";
	}
	@RequestMapping(value = "email.do", method = {RequestMethod.GET,RequestMethod.POST})	
	public void email(Model model,HttpServletRequest request,
			HttpServletResponse response) throws MessagingException {		
		
		String val = "gmail";
		
		String host = "smtp.gmail.com";
		String username = "bonum12@gmail.com";
		String password = "qkrdmswjd3!";

		// 메일 내용
		String recipient = request.getParameter("receive");
		String subject = "지메일을 사용한 발송 테스트입니다.";
		String result = request.getParameter("result");
		System.out.println("result" + result);
		String body = "인증번호 : 123456"; // properties 설정
		
		Properties props = new Properties();
		props.put("mail.smtps.auth", "true"); // 메일 세션
		Session session = Session.getDefaultInstance(props);
		MimeMessage msg = new MimeMessage(session); // 메일 관련
		msg.setSubject(subject);
		msg.setText(body);
		msg.setFrom(new InternetAddress(username));
		msg.addRecipient(Message.RecipientType.TO, new InternetAddress(recipient)); // 발송 처리
		Transport transport = session.getTransport("smtps");
		transport.connect(host, username, password);
		transport.sendMessage(msg, msg.getAllRecipients());
		transport.close();
		
		model.addAttribute("val", val);
		
	}
	
	/*@RequestMapping(value = "stadium_write_ok.do", method = {RequestMethod.GET, RequestMethod.POST})
    public String uploadFile(foot_stadium_DTO dto,HttpServletRequest request,
                     Model model) throws Exception {
		
		Multipart filename = request.getParameter("stadium_img1");
		
		 String savePath = request.getSession().getServletContext().getRealPath("/upload");
         String originalFilename1 = stadium_img1.getOriginalFilename(); // fileName.jpg
         String originalFilename2 = stadium_img2.getOriginalFilename(); // fileName.jpg
         String originalFilename3 = stadium_img3.getOriginalFilename(); // fileName.jpg
         String originalFilename4 = stadium_img4.getOriginalFilename(); // fileName.jpg
         
         
         String onlyFileName = originalFilename1.substring(0, originalFilename1.indexOf(".")); // fileName
     
         String extension = originalFilename1.substring(originalFilename1.indexOf(".")); // .jpg
     
//        String rename = onlyFileName + "_" + getCurrentDayTime() + extension; // fileName_20150721-14-07-50.jpg
     
         String fullPath = savePath + "\\" + originalFilename1;
     
         if (!stadium_img1.isEmpty()) {
             try {
                 byte[] bytes = stadium_img1.getBytes();
                 BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(new File(fullPath)));
                 stream.write(bytes);
                 stream.close();
                 model.addAttribute("resultMsg", "파일을 업로드 성공!");
             } catch (Exception e) {
                 model.addAttribute("resultMsg", "파일을 업로드하는 데에 실패했습니다.");
             }
         } else {
             model.addAttribute("resultMsg", "업로드할 파일을 선택해주시기 바랍니다.");
         }
  
         model.addAttribute("doc_title", "PDS 자료실");

      dto.setStadium_img1(originalFilename1);
		
		
		String addr = request.getParameter("addr1") + request.getParameter("addr2");
	       dto.setAddr(addr);
		
	       service.stadiumWrite(dto);
		
	       return "redirect:/kickoff.do";
    }*/
	
	@RequestMapping(value = "stadium_write_ok.do", method = {RequestMethod.GET,RequestMethod.POST})	
	public String stadium_write_ok(Model model,HttpServletRequest request) throws Exception {
		
		foot_stadium_DTO dto = new foot_stadium_DTO();
		
		String uri = request.getRequestURI();
		
		String url;
		
		String root = request.getServletContext().getRealPath("/");
		
		String path = root + File.separator + "pds" + File.separator + "imageFile";
		
		File dir = new File(path);
		if(!dir.exists()){
			dir.mkdirs();
		}
		
		String encType = "UTF-8";
		int maxSize = 5*512*512;

		MultipartRequest mr = 
				new MultipartRequest(request, path, maxSize, encType, new DefaultFileRenamePolicy());
		
		System.out.println("useremail12313:" + mr.getParameter("user_email"));
		
		
		if(mr.getFile("stadium_img1")!=null){
			
			dto.setStadium_img1(mr.getFilesystemName("stadium_img1"));
		}
		
		
		
		
		
		
		/*MultipartRequest mr = new MultipartReques(request, path, maxSize, encType,
				new DefaultFileRenamePolicy());*/
		
		
		
		
		
	       String addr = request.getParameter("addr1") + request.getParameter("addr2");
	       dto.setAddr(addr);
	       
	       System.out.println("1 : " + dto.getUser_email());
	       System.out.println("2 : " + dto.getAddr());
	       System.out.println("3 : " + dto.getFindway());
	       System.out.println("4 : " + dto.getS_content());
	       System.out.println("5 : " + dto.getUser_email());
	       System.out.println("6 : " + dto.getStadium_phone());
	       
	       System.out.println("img1 : " + dto.getStadium_img1());
	       
	       service.stadiumWrite(dto);
		
	       return "redirect:/kickoff.do";
	}
	
	@RequestMapping(value = "stadiumList.do", method = {RequestMethod.GET,RequestMethod.POST})	
	public String stadiumList(Model model) {		
		System.out.println("dddd");
		return "stadiumList.tiles";
	}
	
	
	@RequestMapping(value = "post.do", method = RequestMethod.GET)	
	public String post(Model model) {		
		
		return "post.tiles";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
