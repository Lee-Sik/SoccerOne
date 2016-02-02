package soccer.co.Service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import soccer.co.DAO.foot_stadium_DAO;
import soccer.co.DTO.ZipcodeDTO;
import soccer.co.DTO.foot_stadium_DTO;
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
	
}
