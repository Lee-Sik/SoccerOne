package soccer.co.Service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import soccer.co.DAO.foot_user_DAO;
import soccer.co.DTO.foot_team_DTO;
import soccer.co.DTO.foot_user_DTO;
import soccer.co.Service.foot_userService;


@Service
public class foot_userService_impl implements foot_userService{

	@Autowired
	foot_user_DAO fudao;
	
	@Override
	public foot_user_DTO login(foot_user_DTO fudto) throws Exception {
		return fudao.login(fudto);
	}

	@Override
	public boolean join(foot_user_DTO fudto) throws Exception {
		return fudao.join(fudto);
	}

	@Override
	public foot_team_DTO loginteam(foot_user_DTO fudto) throws Exception {
		// TODO Auto-generated method stub
		return fudao.loginteam(fudto);
	}

	@Override
	public foot_user_DTO login1(foot_user_DTO fudto) throws Exception {
		// TODO Auto-generated method stub
		return fudao.login1(fudto);
	}
	
}
