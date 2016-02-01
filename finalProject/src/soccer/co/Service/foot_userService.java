package soccer.co.Service;

import soccer.co.DTO.foot_user_DTO;

public interface foot_userService {
	public foot_user_DTO login(foot_user_DTO fudto) throws Exception;

	public boolean join(foot_user_DTO fudto) throws Exception;

}
