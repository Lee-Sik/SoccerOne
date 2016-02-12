package soccer.co.Service;

import soccer.co.DTO.foot_team_DTO;
import soccer.co.DTO.foot_user_DTO;

public interface foot_userService {
	
	public foot_user_DTO login(foot_user_DTO fudto) throws Exception;
	public foot_user_DTO login1(foot_user_DTO fudto) throws Exception;
	public foot_team_DTO loginteam(foot_user_DTO fudto) throws Exception;
	public boolean join(foot_user_DTO fudto) throws Exception;
	
}
