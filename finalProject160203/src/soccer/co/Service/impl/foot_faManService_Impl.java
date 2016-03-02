package soccer.co.Service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import soccer.co.DAO.foot_faMan_DAO;
import soccer.co.DTO.foot_faMan_DTO;
import soccer.co.Service.foot_faManService;

@Service
public class foot_faManService_Impl implements foot_faManService{
	
	@Autowired
	private foot_faMan_DAO dao;
	
	
	@Override
	public boolean faManWrite(foot_faMan_DTO dto) throws Exception {
		
		return dao.faManWrite(dto);
	}


	@Override
	public List<foot_faMan_DTO> faManManagerList() throws Exception {

		return dao.faManManagerList();
	}


	@Override
	public List<foot_faMan_DTO> faManList(foot_faMan_DTO dto) throws Exception {
		
		return dao.faManList(dto);
	}


	@Override
	public boolean hitCount(int fa_man_seq) throws Exception {
		
		return dao.hitCount(fa_man_seq);
	}


	@Override
	public foot_faMan_DTO faManDetail(int fa_man_seq) throws Exception {
		// TODO Auto-generated method stub
		return dao.fbookingDetail(fa_man_seq);
	}


	@Override
	public foot_faMan_DTO preTitle(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return dao.preTitle(map);
	}


	@Override
	public foot_faMan_DTO nextTitle(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return dao.nextTitle(map);
	}


	@Override
	public boolean faManUpdate(foot_faMan_DTO dto) throws Exception {
		
		return dao.faManUpdate(dto);
	}


	@Override
	public boolean faManDelete(int fa_man_seq) throws Exception {
		
		return dao.faManDelete(fa_man_seq);
	}

}
