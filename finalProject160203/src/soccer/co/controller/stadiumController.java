package soccer.co.controller;

import java.io.BufferedOutputStream;

import java.io.File;
import java.io.FileOutputStream;

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
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import soccer.co.DTO.ZipcodeDTO;
import soccer.co.DTO.foot_fbooking_DTO;
import soccer.co.DTO.foot_sbookingReserve_DTO;
import soccer.co.DTO.foot_sbooking_DTO;
import soccer.co.DTO.foot_stadium_DTO;
import soccer.co.DTO.foot_user_DTO;
import soccer.co.DTO.postDTO;
import soccer.co.Service.foot_fbookingService;
import soccer.co.Service.foot_stadiumService;
import soccer.co.Service.foot_userService;

@Controller
public class stadiumController {

	@Autowired
	private foot_stadiumService service;

	@Autowired
	private foot_userService uservice;

	@Autowired
	private foot_fbookingService fservice;

	@RequestMapping(value = "stadium_write.do", method = RequestMethod.GET)
	public String stadium_write(Model model, HttpServletRequest request) throws Exception {
		foot_user_DTO jyfudto = (foot_user_DTO) request.getSession().getAttribute("login");

		if (jyfudto == null) {
			return "redirect:loginpopup1.do";
		} else {

			String mode = request.getParameter("mode");

			if (!(mode == null || mode.equals(""))) {
				if (mode == "update" || mode.equals("update")) {
					int stadium_seq = Integer.parseInt(request.getParameter("seq"));
					foot_stadium_DTO dto = service.stadiumDetail(stadium_seq);
					model.addAttribute("mode", mode);
					model.addAttribute("dto", dto);
					
				} else {
					model.addAttribute("mode", "write");
					
				}

			} else {
				model.addAttribute("mode", "write");
				
			}

			int a = (int) (Math.random() * 10);
			int b = (int) (Math.random() * 10);
			int c = (int) (Math.random() * 10);
			int d = (int) (Math.random() * 10);
			int e = (int) (Math.random() * 10);
			int f = (int) (Math.random() * 10);

			String result = Integer.toString(a) + Integer.toString(b) + Integer.toString(c) + Integer.toString(d)
					+ Integer.toString(e) + Integer.toString(f);

			List<foot_user_DTO> ulist = uservice.userList();

			model.addAttribute("result", result);
			model.addAttribute("ulist", ulist);
			model.addAttribute("title", "publicbooking");
			model.addAttribute("menuNum", 0);
			return "stadium_write.tiles";

		}

	}

	@RequestMapping(value = "bookingList.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String bookingList(Model model, HttpServletRequest request, foot_sbooking_DTO dto) throws Exception {
		System.out.println("들어와");
		String mode = request.getParameter("mode");
		String day = request.getParameter("day");
		String area = request.getParameter("area");

		System.out.println("mode : " + mode);
		System.out.println("area : " + area);

		if (!(mode == null || mode.equals(""))) {
			if (mode == "day" || mode.equals("day")) {
				dto.setMode(mode);
				dto.setBooking_day(day.substring(6, 10) + day.substring(0, 2) + day.substring(3, 5));
			} else {
				dto.setMode(mode);
				dto.setBooking_area(area);
			}
		}

		int sn = dto.getPageNumber();
		int start = (sn) * dto.getRecordCountPerPage() + 1;
		int end = (sn + 1) * dto.getRecordCountPerPage();

		dto.setStart(start);
		dto.setEnd(end);

		int totalRecordCount = service.getbookingCount(dto);

		List<foot_sbooking_DTO> blist = service.bookingList(dto);

		List<foot_fbooking_DTO> flist = fservice.miniList();

		model.addAttribute("pageNumber", sn);
		model.addAttribute("pageCountPerScreen", 10);
		model.addAttribute("recordCountPerPage", dto.getRecordCountPerPage());
		model.addAttribute("totalRecordCount", totalRecordCount);
		model.addAttribute("blist", blist);
		model.addAttribute("flist", flist);
		model.addAttribute("title", "publicbooking");
		model.addAttribute("menuNum", 0);

		return "bookingList.tiles";
	}

	@RequestMapping(value = "zipsearch.do", method = RequestMethod.GET)
	public String zipsearch(Model model, HttpServletRequest request) {
		foot_user_DTO jyfudto = (foot_user_DTO) request.getSession().getAttribute("login");

		if (jyfudto == null) {
			return "redirect:loginpopup1.do";
		} else {

			return "zipsearch.tiles";

		}

	}

	@RequestMapping(value = "zipsearch_result.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String zipsearch_result(Model model, String dong, HttpServletRequest request) throws Exception {
		foot_user_DTO jyfudto = (foot_user_DTO) request.getSession().getAttribute("login");

		if (jyfudto == null) {
			return "redirect:loginpopup1.do";
		} else {

			List<ZipcodeDTO> list = service.zipcode(dong);

			model.addAttribute("list", list);

			return "zipsearch_result.tiles";

		}

	}

	@RequestMapping(value = "email.do", method = { RequestMethod.GET, RequestMethod.POST })
	public void email(Model model, HttpServletRequest request, HttpServletResponse response) throws MessagingException {

		String val = "gmail";

		String host = "smtp.gmail.com";
		String username = "bonum12@gmail.com";
		String password = "qkrdmswjd3!";

		// 메일 내용
		String recipient = request.getParameter("receive");
		String subject = "안녕하세요. 싸커원 이메일 인증번호 전송문입니다.";
		String result = request.getParameter("result");
		System.out.println("result" + result);
		String body = "인증번호 : " + result; // properties 설정

		Properties props = new Properties();
		props.put("mail.smtps.auth", "true"); // 메일 세션
		Session session = Session.getDefaultInstance(props);
		MimeMessage msg = new MimeMessage(session); // 메일 관련
		msg.setSubject(subject);
		msg.setText(body);
		msg.setFrom(new InternetAddress(username));
		msg.addRecipient(Message.RecipientType.TO, new InternetAddress(recipient)); // 발송
																					// 처리
		Transport transport = session.getTransport("smtps");
		transport.connect(host, username, password);
		transport.sendMessage(msg, msg.getAllRecipients());
		transport.close();

		model.addAttribute("val", val);

	}

	/*
	 * @RequestMapping(value = "stadium_write_ok.do", method =
	 * {RequestMethod.GET, RequestMethod.POST}) public String
	 * uploadFile(foot_stadium_DTO dto,HttpServletRequest request, Model model)
	 * throws Exception {
	 * 
	 * System.out.println("Dddadsasd"); foot_stadium_DTO dto = new
	 * foot_stadium_DTO();
	 * 
	 * String uri = request.getRequestURI();
	 * 
	 * String url;
	 * 
	 * String root = request.getServletContext().getRealPath("/");
	 * 
	 * String path = root + File.separator + "pds" + File.separator +
	 * "imageFile";
	 * 
	 * File dir = new File(path); if(!dir.exists()){ dir.mkdirs(); }
	 * 
	 * String encType = "UTF-8"; int maxSize = 5*512*512;
	 * System.out.println("DSAdasdaddd12231s");
	 * 
	 * 
	 * MultipartRequest mr = new MultipartRequest(request, path, maxSize,
	 * encType, new DefaultFileRenamePolicy());
	 * 
	 * System.out.println("1234555");
	 * 
	 * System.out.println("useremail12313:" + mr.getParameter("user_email"));
	 * 
	 * 
	 * if(mr.getFile("stadium_img1")!=null){
	 * 
	 * dto.setStadium_img1(mr.getFilesystemName("stadium_img1")); }
	 * 
	 * 
	 * String addr = request.getParameter("addr1") +
	 * request.getParameter("addr2"); dto.setAddr(addr);
	 * 
	 * System.out.println("1 : " + dto.getUser_email()); System.out.println(
	 * "2 : " + dto.getAddr()); System.out.println("3 : " + dto.getFindway());
	 * System.out.println("4 : " + dto.getS_content()); System.out.println(
	 * "5 : " + dto.getUser_email()); System.out.println("6 : " +
	 * dto.getStadium_phone());
	 * 
	 * System.out.println("img1 : " + dto.getStadium_img1());
	 * 
	 * service.stadiumWrite(dto);
	 * 
	 * return "redirect:/kickoff.do"; }
	 */

	@RequestMapping(value = "stadium_write_ok.do", method = RequestMethod.POST)
	public String stadium_write_ok(@RequestParam("stadium_img11") MultipartFile file,
			@RequestParam("stadium_img22") MultipartFile file2, @RequestParam("stadium_img33") MultipartFile file3,
			@RequestParam("stadium_img44") MultipartFile file4, foot_stadium_DTO dto, Model model,
			HttpServletRequest request) throws Exception {
		foot_user_DTO jyfudto = (foot_user_DTO) request.getSession().getAttribute("login");

		if (jyfudto == null) {
			return "redirect:loginpopup1.do";
		} else {

			String mode = request.getParameter("mode");
			/*
			 * String root = request.getServletContext().getRealPath("/");
			 * //여기까지가 study/ //실제 주소 String path = root + File.separator +
			 * "stadiumImg";
			 */

			String path = "//211.238.142.152/공유/ryu";
			
			/*String path = "C:/poto";*/

			File dir = new File(path);
			if (!dir.exists()) {
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
					fileName2 = file2.getOriginalFilename();
					fileName3 = file3.getOriginalFilename();
					fileName4 = file4.getOriginalFilename();

					// upload = new
					// File("/Users/chojaeyong/Desktop/eclipse3/finalProject160203/WebContent/image/"
					// + fileName);
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

			try {

				System.out.println("mode212313 : " + mode);
				if (!(mode == null || mode.equals(""))) {
					System.out.println("gggg");
					if (mode == "update" || mode.equals("update")) {
						System.out.println("gggg2");
						service.stadiumUpdate(dto);
					} else {
						System.out.println("hhhhh");
						service.stadiumWrite(dto);
					}

				}

			} catch (Exception e) {
				e.printStackTrace();
			}

			return "redirect:/bookingList.do";

		}

	}

	@RequestMapping(value = "stadiumList.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String stadiumList(Model model, HttpServletRequest request) throws Exception {
		foot_user_DTO jyfudto = (foot_user_DTO) request.getSession().getAttribute("login");

		if (jyfudto == null) {
			return "redirect:loginpopup1.do";
		} else {

			String user_email = request.getParameter("user_email");

			List<foot_stadium_DTO> slist = service.stadiumList(user_email);

			model.addAttribute("user_email", user_email);
			model.addAttribute("slist", slist);
			model.addAttribute("title", "publicbooking");
			model.addAttribute("menuNum", 0);
			return "stadiumList.tiles";

		}

	}

	@RequestMapping(value = "post.do", method = RequestMethod.GET)
	public String post(Model model, HttpServletRequest request) throws Exception {
		foot_user_DTO jyfudto = (foot_user_DTO) request.getSession().getAttribute("login");

		if (jyfudto == null) {
			return "redirect:loginpopup1.do";
		} else {

			List<postDTO> post1 = service.post_gugun();

			model.addAttribute("post1", post1);

			return "post.tiles";

		}

	}

	@RequestMapping(value = "post_result.do", method = RequestMethod.GET)
	public String post_result(Model model, HttpServletRequest request) throws Exception {
		foot_user_DTO jyfudto = (foot_user_DTO) request.getSession().getAttribute("login");

		if (jyfudto == null) {
			return "redirect:loginpopup1.do";
		} else {

			String gugun = request.getParameter("gugun");
			String addrtype = request.getParameter("addrtype");

			List<postDTO> post2 = service.post_result(gugun, addrtype);

			model.addAttribute("seoul", "서울");
			model.addAttribute("gugun", gugun);
			model.addAttribute("addrtype", addrtype);
			model.addAttribute("post2", post2);

			return "post_result.tiles";

		}

	}

	@RequestMapping(value = "booking_write.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String booking_write(Model model, HttpServletRequest request) throws Exception {
		foot_user_DTO jyfudto = (foot_user_DTO) request.getSession().getAttribute("login");

		if (jyfudto == null) {
			return "redirect:loginpopup1.do";
		} else {

			String stadium_seq = request.getParameter("stadium_seq");
			String stadium_name = request.getParameter("stadium_name");

			List<postDTO> post1 = service.post_gugun();

			model.addAttribute("stadium_seq", stadium_seq);
			model.addAttribute("stadium_name", stadium_name);
			model.addAttribute("post1", post1);
			model.addAttribute("title", "publicbooking");
			model.addAttribute("menuNum", 0);
			return "booking_write.tiles";

		}

	}

	@RequestMapping(value = "booking_write_ok.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String booking_write_ok(Model model, HttpServletRequest request, foot_sbooking_DTO dto) throws Exception {
		foot_user_DTO jyfudto = (foot_user_DTO) request.getSession().getAttribute("login");

		if (jyfudto == null) {
			return "redirect:loginpopup1.do";
		} else {

			String day = request.getParameter("day");
			String rentalaccount = request.getParameter("bank") + " " + request.getParameter("banknum") + " "
					+ request.getParameter("bankuser");
			dto.setRentalaccount(rentalaccount);
			String booking_day = day.substring(6, 10) + day.substring(0, 2) + day.substring(3, 5);
			dto.setBooking_day(booking_day);
			
			service.bookingWrtie(dto);

			return "redirect:/bookingList.do";

		}

	}

	@RequestMapping(value = "stadiumDelete.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String stadiumDelete(Model model, HttpServletRequest request) throws Exception {
		foot_user_DTO jyfudto = (foot_user_DTO) request.getSession().getAttribute("login");

		if (jyfudto == null) {
			return "redirect:loginpopup1.do";
		} else {
			String user_email = request.getParameter("user_email");
			int stadium_seq = Integer.parseInt(request.getParameter("stadium_seq"));
			System.out.println("dsadasdsa : " + stadium_seq);
			service.stadiumDelete(stadium_seq);

			return "redirect:/stadiumList.do?user_email=" + user_email;

		}

	}

	@RequestMapping(value = "bookingDetail.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String bookingDetail(Model model, HttpServletRequest request, HttpSession sessionm,foot_user_DTO fudto) throws Exception {

		/*
		 * String root = request.getServletContext().getRealPath("/"); //여기까지가
		 * study/
		 */ // 실제 주소

		/*
		 * String root = session.getServletContext().getRealPath("/");
		 * 
		 * Set<String> pathSet =
		 * request.getSession().getServletContext().getResourcePaths("/");
		 */
		foot_user_DTO jyfudto = (foot_user_DTO) request.getSession().getAttribute("login");

		if (jyfudto == null) {
			return "redirect:loginpopup1.do";
		} else {

			int stadium_seq = Integer.parseInt(request.getParameter("stadium_seq"));
			int booking_seq = Integer.parseInt(request.getParameter("booking_seq"));

			System.out.println("stadium_seq : " + stadium_seq);
			System.out.println("booking_seq : " + booking_seq);

			foot_stadium_DTO sdto = service.stadiumDetail(stadium_seq);
			fudto.setUser_email(sdto.getUser_email());
			foot_user_DTO udto = uservice.login1(fudto);
			foot_sbooking_DTO bdto = service.bookingDetail(booking_seq);

			int game1 = service.getRentalSwitch(request.getParameter("booking_seq"), "game1");
			int game2 = service.getRentalSwitch(request.getParameter("booking_seq"), "game2");
			int game3 = service.getRentalSwitch(request.getParameter("booking_seq"), "game3");
			int game4 = service.getRentalSwitch(request.getParameter("booking_seq"), "game4");
			int game5 = service.getRentalSwitch(request.getParameter("booking_seq"), "game5");
			int game6 = service.getRentalSwitch(request.getParameter("booking_seq"), "game6");
			int game7 = service.getRentalSwitch(request.getParameter("booking_seq"), "game7");

			System.out.println("game1 : " + game1);

			/*
			 * String path =
			 * "c:/jsp/spring/finalProject160205/WebContent/image/stadiumImg";
			 * 
			 * model.addAttribute("path", path);
			 */
			model.addAttribute("game1", game1);
			model.addAttribute("game2", game2);
			model.addAttribute("game3", game3);
			model.addAttribute("game4", game4);
			model.addAttribute("game5", game5);
			model.addAttribute("game6", game6);
			model.addAttribute("game7", game7);
			model.addAttribute("sdto", sdto);
			model.addAttribute("bdto", bdto);
			model.addAttribute("udto", udto);
			model.addAttribute("title", "publicbooking");
			model.addAttribute("menuNum", 0);
			return "bookingDetail.tiles";

		}

	}

	@RequestMapping(value = "BookingLayer.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String BookingLayer(Model model, HttpServletRequest request, HttpSession session) throws Exception {
		foot_user_DTO jyfudto = (foot_user_DTO) request.getSession().getAttribute("login");

		if (jyfudto == null) {
			return "redirect:loginpopup1.do";
		} else {

			return "BookingLayer.tiles";

		}

	}

	@RequestMapping(value = "booking_reserve.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String booking_reserve(Model model, HttpServletRequest request, foot_sbookingReserve_DTO dto)
			throws Exception {
		foot_user_DTO jyfudto = (foot_user_DTO) request.getSession().getAttribute("login");

		if (jyfudto == null) {
			return "redirect:loginpopup1.do";
		} else {

			System.out.println("gametime : " + dto.getGametime());
			String phone = request.getParameter("num1") + request.getParameter("num2") + request.getParameter("num3");
			dto.setPhone(phone);
			String stadium_seq = request.getParameter("stadium_seq");
			service.bookingReserve(dto);

			return "redirect:/bookingDetail.do?booking_seq=" + Integer.toString(dto.getBooking_seq()) + "&stadium_seq="
					+ stadium_seq;

		}

	}

	@RequestMapping(value = "stadiumUpdate.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String stadiumUpdate(Model model, HttpServletRequest request) throws Exception {
		foot_user_DTO jyfudto = (foot_user_DTO) request.getSession().getAttribute("login");

		if (jyfudto == null) {
			return "redirect:loginpopup1.do";
		} else {

			return "stadiumUpdate.tiles";

		}

	}

}
