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
import com.sun.org.apache.regexp.internal.recompile;

import soccer.co.DTO.ZipcodeDTO;
import soccer.co.DTO.foot_sbooking_DTO;
import soccer.co.DTO.foot_stadium_DTO;
import soccer.co.DTO.postDTO;
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
		
			System.out.println("Dddadsasd");
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
		System.out.println("DSAdasdaddd12231s");
		
		
		MultipartRequest mr = 
				new MultipartRequest(request, path, maxSize, encType, new DefaultFileRenamePolicy());
		
		System.out.println("1234555");
		
		System.out.println("useremail12313:" + mr.getParameter("user_email"));
		
		
		if(mr.getFile("stadium_img1")!=null){
			
			dto.setStadium_img1(mr.getFilesystemName("stadium_img1"));
		}
		
		
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
    }*/
	
	@RequestMapping(value = "stadium_write_ok.do", method = RequestMethod.POST)	
	public String stadium_write_ok(@RequestParam("stadium_img11") MultipartFile file,
			@RequestParam("stadium_img22") MultipartFile file2,@RequestParam("stadium_img33") MultipartFile file3,
			@RequestParam("stadium_img44") MultipartFile file4,
			foot_stadium_DTO dto,Model model,HttpServletRequest request) throws Exception {

		
		String root = request.getServletContext().getRealPath("/"); //여기까지가 study/
		//실제 주소
		String path = root + File.separator + "stadiumImg";
		
		File dir = new File(path);
		if(!dir.exists()){
			dir.mkdirs();
		}
		
		String fileName = null;
		String fileName2 = null;
		String fileName3 = null;
		String fileName4 = null;
		
		File upload = null;
		File upload2 = null;
		File upload3 = null;
		File upload4 = null;
		
		if (!file.isEmpty()) {
			try {
				
				fileName = file.getOriginalFilename();
				fileName2 =file2.getOriginalFilename();
				fileName3 = file3.getOriginalFilename();
				fileName4 = file4.getOriginalFilename();
				
				
				
				//upload = new File("/Users/chojaeyong/Desktop/eclipse3/finalProject160203/WebContent/image/" + fileName);
				upload = new File(path + "/" + fileName);
				upload2 = new File(path + "/" + fileName2);
				upload3 = new File(path + "/" + fileName3);
				upload4 = new File(path + "/" + fileName4);
				
				byte[] bytes = file.getBytes();
				byte[] bytes2 = file2.getBytes();
				byte[] bytes3 = file3.getBytes();
				byte[] bytes4 = file4.getBytes();
				
				BufferedOutputStream buffStream = new BufferedOutputStream(new FileOutputStream(upload));
				BufferedOutputStream buffStream2 = new BufferedOutputStream(new FileOutputStream(upload2));
				BufferedOutputStream buffStream3 = new BufferedOutputStream(new FileOutputStream(upload3));
				BufferedOutputStream buffStream4 = new BufferedOutputStream(new FileOutputStream(upload4));
				
				buffStream.write(bytes);
				buffStream2.write(bytes2);
				buffStream3.write(bytes3);
				buffStream4.write(bytes4);
				
				buffStream.close();
				buffStream2.close();
				buffStream3.close();
				buffStream4.close();
				
				dto.setStadium_img1(fileName);
				dto.setStadium_img2(fileName2);
				dto.setStadium_img3(fileName3);
				dto.setStadium_img4(fileName4);
				
				String addr = request.getParameter("addr1") + request.getParameter("addr2");
			    dto.setAddr(addr);
				System.out.println("You have successfully uploaded " + fileName);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			System.out.println("empty!!!!!!!!");
			dto.setStadium_img1("");
		}
			
		try{
			 service.stadiumWrite(dto);
			
		}catch(Exception e){
			e.printStackTrace();
		}

	       return "redirect:/bookingList.do";
	}
	
	@RequestMapping(value = "stadiumList.do", method = {RequestMethod.GET,RequestMethod.POST})	
	public String stadiumList(Model model,HttpServletRequest request)throws Exception {		
		
		String user_email = request.getParameter("user_email");
		
		List<foot_stadium_DTO> slist = service.stadiumList(user_email);
		
		model.addAttribute("slist", slist);
		
		return "stadiumList.tiles";
	}
	
	
	@RequestMapping(value = "post.do", method = RequestMethod.GET)	
	public String post(Model model) throws Exception {		
		
		List<postDTO> post1 = service.post_gugun();
		
		model.addAttribute("post1", post1);
		
		return "post.tiles";
	}
	
	@RequestMapping(value = "post_result.do", method = RequestMethod.GET)	
	public String post_result(Model model,HttpServletRequest request) throws Exception {		
		
		String gugun = request.getParameter("gugun");
		String addrtype = request.getParameter("addrtype");
		
		
		List<postDTO> post2 = service.post_result(gugun, addrtype);
		
		model.addAttribute("seoul", "서울");
		model.addAttribute("gugun", gugun);
		model.addAttribute("addrtype", addrtype);
		model.addAttribute("post2", post2);
		
		return "post_result.tiles";
	}
	
	@RequestMapping(value = "booking_write.do", method = {RequestMethod.GET,RequestMethod.POST})	
	public String booking_write(Model model,HttpServletRequest request) throws Exception {	
		
		String stadium_seq = request.getParameter("stadium_seq");
		String stadium_name = request.getParameter("stadium_name");
		
		List<postDTO> post1 = service.post_gugun();
		
		model.addAttribute("stadium_seq", stadium_seq);
		model.addAttribute("stadium_name", stadium_name);
		model.addAttribute("post1", post1);
		
		return "booking_write.tiles";
	}
	
	@RequestMapping(value = "booking_write_ok.do", method = {RequestMethod.GET,RequestMethod.POST})	
	public String booking_write_ok(Model model,HttpServletRequest request,foot_sbooking_DTO dto) throws Exception {
		
		String day = request.getParameter("day");
		String rentalaccount = request.getParameter("bank") + " " + request.getParameter("banknum") 
							+ " " + request.getParameter("bankuser");
		dto.setRentalaccount(rentalaccount);
		String booking_day = day.substring(0, 4) + day.substring(5, 7) + day.substring(8, 10);
		dto.setBooking_day(booking_day);
		
		service.bookingWrtie(dto);
		
		return "redirect:/bookingList.do";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
