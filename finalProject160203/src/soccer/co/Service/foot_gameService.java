package soccer.co.Service;

import java.util.List;

import soccer.co.DTO.foot_game_DTO;

public interface foot_gameService {

	public boolean freegame(foot_game_DTO fgdto) throws Exception;
	public boolean publicgame(foot_game_DTO fgdto) throws Exception;
	
	List<foot_game_DTO> getfreegameList()throws Exception;
	List<foot_game_DTO> getpublicgameList()throws Exception;
	List<foot_game_DTO> getmatchingsearchList(foot_game_DTO fgdto)throws Exception;
	
	
}
