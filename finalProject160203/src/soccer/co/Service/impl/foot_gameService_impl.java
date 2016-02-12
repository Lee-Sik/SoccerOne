package soccer.co.Service.impl;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import soccer.co.DAO.foot_game_DAO;
import soccer.co.DTO.MATCHINGParam;
import soccer.co.DTO.foot_comunity_DTO;
import soccer.co.DTO.foot_game_DTO;
import soccer.co.DTO.foot_game_record;
import soccer.co.Service.foot_gameService;

@Service
public class foot_gameService_impl implements foot_gameService{

	@Autowired
	foot_game_DAO fgdao;

	@Override
	public boolean freegame(foot_game_DTO fgdto) throws Exception {
		// TODO Auto-generated method stub
		return fgdao.freegame(fgdto);
	}
	
	@Override
	@Transactional(readOnly=true)
	public foot_game_DTO publicgame(foot_game_DTO fgdto) throws Exception {
		// TODO Auto-generated method stub
		return fgdao.publicgame(fgdto);
	}
	
	@Override
	@Transactional(readOnly=true)
	public foot_game_DTO getPublicgamedetail(foot_game_DTO fgdto) throws Exception {
		return fgdao.getPublicgamedetail(fgdto);
	}
	
//	@Override
//	@Transactional(readOnly=true)
//	public foot_game_DTO getpublicgame(foot_game_DTO fgdto) throws Exception {
//		// TODO Auto-generated method stub
//		return fgdao.publicgame(fgdto);
//	}
	
	@Override
	public boolean publicgamerecord(foot_game_record fgr) throws Exception {
		// TODO Auto-generated method stub
		return fgdao.publicgamerecord(fgr);
	}
	
	@Override
	@Transactional(readOnly=true)
	public List<foot_game_DTO> getfreegameList() throws Exception {
		return fgdao.getfreegameList();
	}
	
	@Override
	@Transactional(readOnly=true)
	public List<foot_game_DTO> getpublicgameList() throws Exception {
		return fgdao.getpublicgameList();
	}
	
	@Override
	@Transactional(readOnly=true)
	public List<foot_game_DTO> getpmatchingsearchList(MATCHINGParam param) throws Exception {
		return fgdao.getpmatchingsearchList(param);
	}
	
	@Override
	@Transactional(readOnly=true)
	public List<foot_game_DTO> getfmatchingsearchList(MATCHINGParam param) throws Exception {
		return fgdao.getfmatchingsearchList(param);
	}
	
}
