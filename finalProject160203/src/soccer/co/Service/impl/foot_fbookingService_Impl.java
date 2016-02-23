package soccer.co.Service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import soccer.co.DAO.foot_fbooking_DAO;
import soccer.co.DTO.foot_fbooking_DTO;
import soccer.co.Service.foot_fbookingService;

@Service
public class foot_fbookingService_Impl implements foot_fbookingService{
	
	@Autowired
	private foot_fbooking_DAO dao;
	
	
	@Override
	public boolean fbookingWrite(foot_fbooking_DTO dto) throws Exception {
		// TODO Auto-generated method stub
		return dao.fbookingWrite(dto);
	}


	@Override
	public List<foot_fbooking_DTO> fbookingList() throws Exception {
	
		return dao.fbookingList();
	}


	@Override
	public String getUserName(String user_email) throws Exception {

		return dao.getUserName(user_email);
	}


	@Override
	public List<foot_fbooking_DTO> fbookingManagerList() throws Exception {
		
		return dao.fbookingManagerList();
	}

}
