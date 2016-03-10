package soccer.co.Service;

import java.util.List;

import soccer.co.DTO.foot_team_DTO;
import soccer.co.DTO.foot_user_DTO;

public interface foot_userService {
	
	public foot_user_DTO login(foot_user_DTO fudto) throws Exception;
	public foot_user_DTO login1(foot_user_DTO fudto) throws Exception;
	public foot_team_DTO loginteam(foot_user_DTO fudto) throws Exception;
	public boolean join(foot_user_DTO fudto) throws Exception;
	public boolean modify(foot_user_DTO fudto1) throws Exception;
	public List<foot_user_DTO> userList()throws Exception;
	public List<foot_user_DTO> emaillist();
	
}
