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
	
	public boolean teamapplymeg(foot_message_DTO fmdto) {
		// TODO Auto-generated method stub
		sql.insert(ns+"teamapplymeg", fmdto);
		return false;
	}

	public ArrayList<foot_message_DTO> messagecheck(foot_user_DTO fudto) {
		// TODO Auto-generated method stub
		ArrayList<foot_message_DTO> list = (ArrayList<foot_message_DTO>) sql.selectList(ns+"messagecheck", fudto);
		return list;
	}

}
