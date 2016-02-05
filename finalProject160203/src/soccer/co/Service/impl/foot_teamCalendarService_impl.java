package soccer.co.Service.impl;

import java.util.ArrayList;
import soccer.co.DTO.foot_cal_DTO;
import soccer.co.DTO.foot_calteam_DTO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import soccer.co.DAO.foot_teamCalendar_DAO;
import soccer.co.Service.foot_teamCalendarService;

@Service
public class foot_teamCalendarService_impl implements foot_teamCalendarService{
	
	@Autowired
	foot_teamCalendar_DAO mdao;
	
	public ArrayList<foot_calteam_DTO> getmycal(foot_cal_DTO cdto) throws Exception{
		return mdao.getmycal(cdto);
	}
	public foot_cal_DTO makecal(foot_cal_DTO cdto) throws Exception{
		return mdao.makecal(cdto);
	}
	public foot_cal_DTO sleft(foot_cal_DTO cdto) throws Exception{
		return mdao.sleft(cdto);
	}
	public foot_cal_DTO sright(foot_cal_DTO cdto) throws Exception{
		return mdao.sright(cdto);
	}
	public foot_cal_DTO makecal1() throws Exception{
		return mdao.makecal1();
	}
	@Override
	public foot_cal_DTO writecal(foot_cal_DTO cdto) throws Exception {
		// TODO Auto-generated method stub
		return mdao.writecal(cdto);
	}
	@Override
	public boolean writecal1(foot_calteam_DTO mcdto) throws Exception {
		// TODO Auto-generated method stub
		return mdao.writecal1(mcdto);
	}
	@Override
	public ArrayList<foot_calteam_DTO> caldetail(foot_calteam_DTO mcdto) throws Exception {
		// TODO Auto-generated method stub
		return mdao.caldetail(mcdto);
	}
}
