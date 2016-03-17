package soccer.co.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import soccer.co.DTO.foot_fbooking_DTO;
import soccer.co.DTO.foot_user_DTO;
import soccer.co.DTO.postDTO;
import soccer.co.Service.foot_fbookingService;
import soccer.co.Service.foot_stadiumService;

@Controller
public class freeBookingController {

	@Autowired
	private foot_stadiumService service;

	@Autowired
	private foot_fbookingService fservice;

	@RequestMapping(value = "fbookingList.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String fbookingList(Model model, foot_fbooking_DTO dto) throws Exception {

		System.out.println("dasda : " + dto.getFree_b_sendrecieve());

		int sn = dto.getPageNumber();
		int start = (sn) * dto.getRecordCountPerPage() + 1;
		int end = (sn + 1) * dto.getRecordCountPerPage();

		dto.setStart(start);
		dto.setEnd(end);
		// logger.info("start number : "+sn);
		// logger.info("start : "+start);
		// logger.info("end : "+end);

		int totalRecordCount = fservice.getfbookingCount(dto);

		List<foot_fbooking_DTO> list = fservice.fbookingList(dto);
		List<foot_fbooking_DTO> mlist = fservice.fbookingManagerList();
		List<postDTO> post1 = service.post_gugun();

		model.addAttribute("list", list);
		model.addAttribute("mlist", mlist);
		model.addAttribute("post1", post1);
		model.addAttribute("pageNumber", sn);
		model.addAttribute("pageCountPerScreen", 10);
		model.addAttribute("recordCountPerPage", dto.getRecordCountPerPage());
		model.addAttribute("totalRecordCount", totalRecordCount);
		model.addAttribute("title", "freebooking");
		model.addAttribute("menuNum", 1);

		return "fbookingList.tiles";
	}

	@RequestMapping(value = "fbookingWrite.do", method = RequestMethod.GET)
	public String fbookingWrite(Model model, HttpServletRequest request) throws Exception {
		foot_user_DTO jyfudto = (foot_user_DTO) request.getSession().getAttribute("login");

		if (jyfudto == null) {
			return "redirect:loginpopup1.do";
		} else {

			String mode = request.getParameter("mode");

			if (!(mode == null || mode.equals(""))) {

				if (mode == "update" || mode.equals("update")) {
					int free_b_seq = Integer.parseInt(request.getParameter("seq"));
					foot_fbooking_DTO dto = fservice.fbookingDetail(free_b_seq);
					model.addAttribute("mode", mode);
					model.addAttribute("fdto", dto);
				} else {
					model.addAttribute("mode", "write");
				}
			}

			String context = request.getContextPath();

			List<postDTO> post1 = service.post_gugun();

			model.addAttribute("con", context);
			model.addAttribute("post1", post1);
			model.addAttribute("title", "freebooking");
			model.addAttribute("menuNum", 1);
			return "fbookingWrite.tiles";

		}

	}

	@RequestMapping(value = "fbookingWrite_ok.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String fbookingWrite_ok(Model model, HttpServletRequest request, foot_fbooking_DTO dto) throws Exception {
		foot_user_DTO jyfudto = (foot_user_DTO) request.getSession().getAttribute("login");

		if (jyfudto == null) {
			return "redirect:loginpopup1.do";
		} else {

			String mode = request.getParameter("mode");

			dto.setUser_name(fservice.getUserName(dto.getUser_email()));

			if (dto.getUser_email() == "carroll@naver.com" || dto.getUser_email().equals("carroll@naver.com")) {
				dto.setFree_b_manager(2);
			} else {
				dto.setFree_b_manager(1);
			}

			if (mode == "update" || mode.equals("update")) {
				fservice.fbookingUpdate(dto);
			} else {
				fservice.fbookingWrite(dto);
			}

			return "redirect:/fbookingList.do";

		}

	}

	@RequestMapping(value = "fbookingDetail.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String fbookingDetail(Model model, HttpServletRequest request) throws Exception {

		int free_b_seq = Integer.parseInt(request.getParameter("seq"));

		fservice.hitCount(free_b_seq);

		foot_fbooking_DTO dto = fservice.fbookingDetail(free_b_seq);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("free_b_seq", free_b_seq);

		foot_fbooking_DTO preDTO = null;
		preDTO = (foot_fbooking_DTO) fservice.preTitle(map);

		foot_fbooking_DTO nextDTO = null;
		nextDTO = (foot_fbooking_DTO) fservice.nextTitle(map);

		model.addAttribute("preDTO", preDTO);
		model.addAttribute("nextDTO", nextDTO);
		model.addAttribute("fdto", dto);
		model.addAttribute("title", "freebooking");
		model.addAttribute("menuNum", 1);

		return "fbookingDetail.tiles";
	}

	@RequestMapping(value = "fbookingDelete.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String fbookingDelete(Model model, HttpServletRequest request) throws Exception {
		foot_user_DTO jyfudto = (foot_user_DTO) request.getSession().getAttribute("login");

		if (jyfudto == null) {
			return "redirect:loginpopup1.do";
		} else {

			int free_b_seq = Integer.parseInt(request.getParameter("seq"));

			fservice.fbookingDelete(free_b_seq);
			return "redirect:/fbookingList.do";

		}

	}

}
