package soccer.co.DAO;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import soccer.co.DTO.foot_message_DTO;
import soccer.co.DTO.foot_user_DTO;
@Repository
public class foot_message_DAO {

	@Autowired
	SqlSession sql;
	
	String ns = "foot_message.";
	String ns1 = "foot_user.";
	
	public boolean message(foot_message_DTO fmdto) {
		// TODO Auto-generated method stub
		sql.insert(ns+"message", fmdto);
		return false;
	}

	public ArrayList<foot_message_DTO> messagecheck(foot_user_DTO fudto) {
		// TODO Auto-generated method stub
		ArrayList<foot_message_DTO> list = (ArrayList<foot_message_DTO>) sql.selectList(ns+"messagecheck", fudto);
		return list;
	}

	public foot_message_DTO messagedetail(foot_message_DTO fmdto) {
		// TODO Auto-generated method stub
		foot_message_DTO fmdto1 = (foot_message_DTO) sql.selectOne(ns+"messagedetail", fmdto);
		return fmdto1;
	}

	public boolean join(foot_user_DTO fudto) {
		// TODO Auto-generated method stub
		sql.update(ns1+"teamjoin", fudto);
		return false;
	}

	public boolean messageread(foot_message_DTO fmdto) {
		// TODO Auto-generated method stub
		sql.update(ns+"messageread", fmdto);
		return false;
	}

	public ArrayList<foot_message_DTO> messagecheck1(foot_user_DTO login) {
		// TODO Auto-generated method stub
		ArrayList<foot_message_DTO> list = (ArrayList<foot_message_DTO>) sql.selectList(ns+"messagecheck1", login);
		return list;
	}

	public boolean teamapply(foot_message_DTO fmdto) {
		// TODO Auto-generated method stub
		sql.update(ns+"teamapply", fmdto);
		return false;
	}

	public ArrayList<foot_message_DTO> messagesendlist(foot_message_DTO fmdto) {
		// TODO Auto-generated method stub
		ArrayList<foot_message_DTO> list =(ArrayList<foot_message_DTO>) sql.selectList(ns+"messagesendlist", fmdto);
		return list;
	}

	public boolean matching(foot_message_DTO fmdto) {
		// TODO Auto-generated method stub
		sql.update(ns+"matching", fmdto);
		
		return false;
	}

	

}
