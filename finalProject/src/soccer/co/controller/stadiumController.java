package soccer.co.controller;

import java.util.List;
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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import soccer.co.DTO.ZipcodeDTO;
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
		
		return "stadium_write.tiles";
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
}
