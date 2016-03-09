package soccer.co.Service;

import java.util.List;

import soccer.co.DTO.MATCHINGParam;
import soccer.co.DTO.RANKParam;
import soccer.co.DTO.foot_game_DTO;
import soccer.co.DTO.foot_game_record;

public interface foot_gameService {

	public boolean freegame(foot_game_DTO fgdto) throws Exception;
	public foot_game_DTO publicgame(foot_game_DTO fgdto) throws Exception;
	foot_game_DTO getPublicgamedetail(foot_game_DTO fgdto)throws Exception;
	foot_game_DTO getFreegamedetail(foot_game_DTO fgdto)throws Exception;
	
//	public foot_game_DTO getpublicgame(foot_game_DTO fgdto) throws Exception;
	
	public boolean publicgamerecord(foot_game_record fgr) throws Exception;
	
	List<foot_game_DTO> getfreegameList()throws Exception;
	List<foot_game_DTO> getpublicgameList()throws Exception;
	List<foot_game_DTO> getpmatchingsearchList(MATCHINGParam param)throws Exception;
	List<foot_game_DTO> getfmatchingsearchList(MATCHINGParam param)throws Exception;
	
	List<RANKParam> getrankingList(RANKParam rank)throws Exception;
	public boolean statechange(foot_game_DTO fgdto);
	
	List<foot_game_DTO> adminMainList()throws Exception;
	
}
