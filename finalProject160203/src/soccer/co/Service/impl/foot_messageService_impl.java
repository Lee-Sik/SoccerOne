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
	public boolean message(foot_message_DTO fmdto) {
		// TODO Auto-generated method stub
		return fmdao.message(fmdto);
	}

	@Override
	public ArrayList<foot_message_DTO> messagecheck(foot_user_DTO fudto) {
		// TODO Auto-generated method stub
		return  fmdao.messagecheck(fudto);
	}

	@Override
	public foot_message_DTO messagedetail(foot_message_DTO fmdto) {
		// TODO Auto-generated method stub
		return fmdao.messagedetail(fmdto);
	}

	@Override
	public boolean join(foot_user_DTO fudto) {
		// TODO Auto-generated method stub
		return fmdao.join(fudto);
	}

	@Override
	public boolean messageread(foot_message_DTO fmdto) {
		// TODO Auto-generated method stub
		return fmdao.messageread(fmdto);
	}

	@Override
	public ArrayList<foot_message_DTO> messagecheck1(foot_user_DTO login) {
		// TODO Auto-generated method stub
		return fmdao.messagecheck1(login);
	}

	@Override
	public boolean teamapply(foot_message_DTO fmdto) {
		// TODO Auto-generated method stub
		return fmdao.teamapply(fmdto);
	}

	@Override
	public ArrayList<foot_message_DTO> messagesendlist(foot_message_DTO fmdto) {
		// TODO Auto-generated method stub
		return fmdao.messagesendlist(fmdto);
	}



}
