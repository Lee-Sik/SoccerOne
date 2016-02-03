package soccer.co.Service;

import java.util.List;

import soccer.co.DTO.foot_team_DTO;

public interface foot_clubService {

	public boolean join(foot_team_DTO team) throws Exception;
	
	public List<String> getGu() throws Exception;
	
	public List<foot_team_DTO> notteamGu(String user_address) throws Exception;
}
