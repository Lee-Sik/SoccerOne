package soccer.co.Service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import soccer.co.DAO.foot_stadium_DAO;
import soccer.co.DTO.ZipcodeDTO;
import soccer.co.DTO.foot_stadium_DTO;
import soccer.co.DTO.postDTO;
import soccer.co.Service.foot_stadiumService;

@Service
public class foot_stadiumService_impl implements foot_stadiumService{
	
	@Autowired
	private foot_stadium_DAO dao;
	
	@Override
	public List<ZipcodeDTO> zipcode(String dong) throws Exception {
		return dao.zipcode(dong);
	}

	@Override
	public boolean stadiumWrite(foot_stadium_DTO dto) throws Exception {
		
		return dao.stadiumWrite(dto);
		
	}

	@Override
	public List<postDTO> post_gugun() throws Exception {
	
		return dao.post_gugun();
	}

	@Override
	public List<postDTO> post_result(String gugun, String addrtype) throws Exception {
		
		return dao.post_result(gugun, addrtype);
	}


	
}
