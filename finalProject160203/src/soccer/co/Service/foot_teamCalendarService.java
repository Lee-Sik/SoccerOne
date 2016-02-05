package soccer.co.Service;

import java.util.ArrayList;

import soccer.co.DTO.foot_cal_DTO;
import soccer.co.DTO.foot_calteam_DTO;

public interface foot_teamCalendarService {
	public ArrayList<foot_calteam_DTO> getmycal(foot_cal_DTO cdto) throws Exception;
	public ArrayList<foot_calteam_DTO> caldetail(foot_calteam_DTO mcdto) throws Exception;
	public foot_cal_DTO makecal(foot_cal_DTO cdto) throws Exception;
	public foot_cal_DTO sleft(foot_cal_DTO cdto) throws Exception;
	public foot_cal_DTO sright(foot_cal_DTO cdto) throws Exception;
	public foot_cal_DTO makecal1() throws Exception;
	public foot_cal_DTO writecal(foot_cal_DTO cdto) throws Exception;
	public boolean writecal1(foot_calteam_DTO mcdto) throws Exception;

}
