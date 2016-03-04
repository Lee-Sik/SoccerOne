package soccer.co.Service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import soccer.co.DAO.foot_team_DAO;
import soccer.co.DTO.FOOT_USER_RECORD;
import soccer.co.DTO.RANKParam;
import soccer.co.DTO.foot_game_record;
import soccer.co.DTO.foot_team_DTO;
import soccer.co.DTO.foot_user_DTO;
import soccer.co.Service.foot_teamService;

@Service
public class foot_teamService_impl implements foot_teamService{

	@Autowired
	foot_team_DAO teamdao;
	
	@Override
	public boolean join(foot_team_DTO team) throws Exception {
		return teamdao.join(team);
	
	}

	@Override
	public List<String> getGu() throws Exception {
		return teamdao.getGu();
	}

	@Override
	public List<foot_team_DTO> notteamGu(String user_address) throws Exception {
		return teamdao.teamGu(user_address);
	}

	@Override
	public List<foot_game_record> getGameRecord(String team_name) {
		return teamdao.getGameRecord(team_name);
	}

	@Override
	public List<foot_user_DTO> getTeamMember(String team_name) {
		return teamdao.getTeamMember(team_name);
	}

	@Override
	public foot_team_DTO getTeam(foot_team_DTO team) {
		return teamdao.getTeam(team);
		
	}

	@Override
	public boolean modifyteam(foot_team_DTO team, foot_user_DTO fudto, String originteamname) {
		return teamdao.modifyteam(team,fudto,originteamname);
	}

	@Override
	public void userUpdate(foot_user_DTO tmpUserDTO) {
		teamdao.userUpdate(tmpUserDTO);
	}

	@Override
	public List<foot_team_DTO> allteam() {
		// TODO Auto-generated method stub
		return teamdao.allteam();
	}

	@Override
	public List<foot_team_DTO> recruitteam() {
		return teamdao.recruitteam();
	}

	@Override
	public List<FOOT_USER_RECORD> getMyRecord(foot_user_DTO user) {
		return teamdao.getMyRecord(user);
	}

	@Override
	public List<RANKParam> getAllTeamLeague() {
		return teamdao.getAllTeamLeague();
	}

}
