package soccer.co.Service.impl;

import java.util.List;

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

	@Override
	public boolean modify(foot_user_DTO fudto1) {
		// TODO Auto-generated method stub
		return fudao.modify(fudto1);
	}

	@Override
	public List<foot_user_DTO> userList() throws Exception {
		
		return fudao.userList();
	}

	@Override
	public List<foot_user_DTO> emaillist() {
		// TODO Auto-generated method stub
		return fudao.emaillist();
	}
	
}
