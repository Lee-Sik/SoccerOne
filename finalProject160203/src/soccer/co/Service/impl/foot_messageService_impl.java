package soccer.co.Service.impl;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import soccer.co.DAO.foot_message_DAO;
import soccer.co.DTO.foot_message_DTO;
import soccer.co.DTO.foot_team_DTO;
import soccer.co.DTO.foot_user_DTO;
import soccer.co.Service.foot_messageService;
@Service
public class foot_messageService_impl implements foot_messageService{

	@Autowired
	foot_message_DAO fmdao;
	
	@Override
	public boolean teamapplymeg(foot_message_DTO fmdto) {
		// TODO Auto-generated method stub
		return fmdao.teamapplymeg(fmdto);
	}

	@Override
	public ArrayList<foot_message_DTO> messagecheck(foot_user_DTO fudto) {
		// TODO Auto-generated method stub
		return  fmdao.messagecheck(fudto);
	}

}
