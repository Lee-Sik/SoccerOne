package soccer.co.Service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import soccer.co.DAO.foot_team_DAO;
import soccer.co.DTO.foot_team_DTO;
import soccer.co.DTO.foot_user_DTO;
import soccer.co.Service.foot_clubService;

@Service
public class foot_teamService_impl implements foot_clubService{

	@Autowired
	foot_team_DAO teamdao;
	
	@Override
	public boolean join(foot_team_DTO team) throws Exception {
		return teamdao.join(team);
	
	}

}
