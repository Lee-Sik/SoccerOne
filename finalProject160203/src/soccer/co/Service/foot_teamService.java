package soccer.co.Service;

import java.util.List;

import soccer.co.DTO.foot_game_record;
import soccer.co.DTO.foot_team_DTO;
import soccer.co.DTO.foot_user_DTO;

public interface foot_teamService {

	public boolean join(foot_team_DTO team) throws Exception;
	
	public List<String> getGu() throws Exception;
	
	public List<foot_team_DTO> notteamGu(String user_address) throws Exception;

	public List<foot_game_record> getGameRecord(String team_name);

	public List<foot_user_DTO> getTeamMember(String team_name);

	public foot_team_DTO getTeam(foot_team_DTO team);
	
	public boolean modifyteam(foot_team_DTO team, foot_user_DTO fudto, String originteamname);

	public void userUpdate(foot_user_DTO tmpUserDTO);

	public List<foot_team_DTO> allteam();

	public List<foot_team_DTO> recruitteam();
}
