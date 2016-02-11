package soccer.co.DAO;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import soccer.co.DTO.MATCHINGParam;
import soccer.co.DTO.foot_game_DTO;
import soccer.co.DTO.foot_game_record;

@Repository
public class foot_game_DAO{
	
	@Autowired
	private SqlSession sqlse;
	
	private String ns = "foot_game.";


	public boolean freegame(foot_game_DTO fgdto) throws Exception {

		sqlse.insert(ns+"freegame", fgdto);
		
		return true;
	}
	
	public foot_game_DTO publicgame(foot_game_DTO fgdto) throws Exception {
		
		sqlse.insert(ns+"publicgame", fgdto);
		
		foot_game_DTO fgt = null;
		fgt=(foot_game_DTO)sqlse.selectOne(ns+"getpublicgame", fgdto);

		return fgt;
	}
	
	public boolean publicgamerecord(foot_game_record fgr) throws Exception {
		// TODO Auto-generated method stub
		sqlse.insert(ns+"publicgamerecord", fgr);
		
		return true;
	}
	
	public List<foot_game_DTO> getpmatchingsearchList(MATCHINGParam param)throws Exception{
		List<foot_game_DTO> list=new ArrayList<foot_game_DTO>();
		list=(List<foot_game_DTO>)
				sqlse.selectList(ns+"getpmatchingsearchList",param);
		return list;
	}
	
	public List<foot_game_DTO> getfmatchingsearchList(MATCHINGParam param)throws Exception{
		List<foot_game_DTO> list=new ArrayList<foot_game_DTO>();
		list=(List<foot_game_DTO>)
				sqlse.selectList(ns+"getfmatchingsearchList",param);
		return list;
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
