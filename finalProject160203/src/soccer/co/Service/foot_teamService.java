package soccer.co.Service;

import java.util.List;

import soccer.co.DTO.FOOT_USER_RECORD;
import soccer.co.DTO.RANKParam;
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

	public List<FOOT_USER_RECORD> getMyRecord(foot_user_DTO user);

	public List<RANKParam> getAllTeamLeague();

	public List<foot_team_DTO> searchTeam(String query);

	public foot_team_DTO getTeam2(foot_team_DTO team);

	public int updateGameRecord(foot_game_record rec);

	public int updatePublicRecord(foot_game_record rec);

	public foot_user_DTO getUserByName(foot_user_DTO a);

	public void insertUserRecord(FOOT_USER_RECORD ur);
}
