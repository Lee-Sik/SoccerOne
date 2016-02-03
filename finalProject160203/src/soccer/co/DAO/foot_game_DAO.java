package soccer.co.DAO;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import soccer.co.DTO.foot_game_DTO;

@Repository
public class foot_game_DAO{
	
	@Autowired
	private SqlSession sqlse;
	
	private String ns = "foot_game.";


	public boolean freegame(foot_game_DTO fgdto) throws Exception {
		// TODO Auto-generated method stub
		sqlse.insert(ns+"freegame", fgdto);
		
		return true;
	}
	
	public boolean publicgame(foot_game_DTO fgdto) throws Exception {
		// TODO Auto-generated method stub
		sqlse.insert(ns+"publicgame", fgdto);
		
		return true;
	}
	
	public List<foot_game_DTO> getfreegameList()throws Exception{
		List<foot_game_DTO> list=new ArrayList<foot_game_DTO>();
		list=(List<foot_game_DTO>)
				sqlse.selectList(ns+"getfreegameList");
		return list;
	}
	
	public List<foot_game_DTO> getpublicgameList()throws Exception{
		List<foot_game_DTO> list=new ArrayList<foot_game_DTO>();
		list=(List<foot_game_DTO>)
				sqlse.selectList(ns+"getpublicgameList");
		return list;
	}


}
