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

import soccer.co.DTO.foot_faMan_DTO;
import soccer.co.DTO.foot_user_DTO;
import soccer.co.DTO.postDTO;
import soccer.co.Service.foot_faManService;
import soccer.co.Service.foot_fbookingService;
import soccer.co.Service.foot_stadiumService;

@Controller
public class faManController {
	@Autowired
	private foot_stadiumService service;

	@Autowired
	private foot_fbookingService fservice;

	@Autowired
	private foot_faManService faservice;

	@RequestMapping(value = "faManList.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String faManList(Model model, foot_faMan_DTO dto) throws Exception {

		int sn = dto.getPageNumber();
		int start = (sn) * dto.getRecordCountPerPage() + 1;
		int end = (sn + 1) * dto.getRecordCountPerPage();

		dto.setStart(start);
		dto.setEnd(end);

		int totalRecordCount = faservice.getfaManCount(dto);

		List<postDTO> post1 = service.post_gugun();
		List<foot_faMan_DTO> mlist = faservice.faManManagerList();
		List<foot_faMan_DTO> list = faservice.faManList(dto);

		model.addAttribute("post1", post1);
		model.addAttribute("mlist", mlist);
		model.addAttribute("list", list);
		model.addAttribute("pageNumber", sn);
		model.addAttribute("pageCountPerScreen", 10);
		model.addAttribute("recordCountPerPage", dto.getRecordCountPerPage());
		model.addAttribute("totalRecordCount", totalRecordCount);
		model.addAttribute("title", "faplayer");
		model.addAttribute("menuNum", 2);

		return "faManList.tiles";
	}

	@RequestMapping(value = "faManWrite.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String faManWrite(Model model, HttpServletRequest request) throws Exception {

		foot_user_DTO jyfudto = (foot_user_DTO) request.getSession().getAttribute("login");

		if (jyfudto == null) {
			return "redirect:loginpopup1.do";
		} else {

			String mode = request.getParameter("mode");

			if (!(mode == null || mode.equals(""))) {

				if (mode == "update" || mode.equals("update")) {
					int fa_man_seq = Integer.parseInt(request.getParameter("seq"));
					foot_faMan_DTO dto = faservice.faManDetail(fa_man_seq);
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
			model.addAttribute("title", "faplayer");

			return "faManWrite.tiles";

		}

	}

	@RequestMapping(value = "faManWrite_ok.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String faManWrite_ok(Model model, foot_faMan_DTO dto, HttpServletRequest request) throws Exception {
		foot_user_DTO jyfudto = (foot_user_DTO) request.getSession().getAttribute("login");

		if (jyfudto == null) {
			return "redirect:loginpopup1.do";
		} else {

			String mode = request.getParameter("mode");
			dto.setUser_name(fservice.getUserName(dto.getUser_email()));

			if (dto.getUser_email() == "carroll@naver.com" || dto.getUser_email().equals("carroll@naver.com")) {
				dto.setFa_man_manager(2);
			} else {
				dto.setFa_man_manager(1);
			}

			if (mode == "update" || mode.equals("update")) {
				faservice.faManUpdate(dto);
			} else {
				faservice.faManWrite(dto);
			}

			return "redirect:/faManList.do";

		}

	}

	@RequestMapping(value = "faManDetail.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String faManDetail(Model model, HttpServletRequest request) throws Exception {

		int fa_man_seq = Integer.parseInt(request.getParameter("seq"));

		faservice.hitCount(fa_man_seq);

		foot_faMan_DTO dto = faservice.faManDetail(fa_man_seq);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("fa_man_seq", fa_man_seq);

		foot_faMan_DTO preDTO = null;
		preDTO = (foot_faMan_DTO) faservice.preTitle(map);

		foot_faMan_DTO nextDTO = null;
		nextDTO = (foot_faMan_DTO) faservice.nextTitle(map);

		model.addAttribute("preDTO", preDTO);
		model.addAttribute("nextDTO", nextDTO);
		model.addAttribute("fdto", dto);
		model.addAttribute("title", "faplayer");

		return "faManDetail.tiles";
	}

	@RequestMapping(value = "faManDelete.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String fbookingDelete(Model model, HttpServletRequest request) throws Exception {
		foot_user_DTO jyfudto = (foot_user_DTO) request.getSession().getAttribute("login");

		if (jyfudto == null) {
			return "redirect:loginpopup1.do";
		} else {

			int fa_man_seq = Integer.parseInt(request.getParameter("seq"));

			faservice.faManDelete(fa_man_seq);
			return "redirect:/faManList.do";

		}

	}

}
