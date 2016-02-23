package soccer.co.DAO;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import soccer.co.DTO.foot_fbooking_DTO;

@Repository
public class foot_fbooking_DAO {
	@Autowired
	SqlSession sqlsession;
	
	public boolean fbookingWrite(foot_fbooking_DTO dto)throws Exception{
		
		sqlsession.insert("fbooking.fbookingWrite", dto);
		
		return true;
	}
	
	public List<foot_fbooking_DTO> fbookingList()throws Exception{
		List<foot_fbooking_DTO> list = sqlsession.selectList("fbooking.fbookingList");
		
		return list;
	}
	public List<foot_fbooking_DTO> fbookingManagerList()throws Exception{
		List<foot_fbooking_DTO> list = sqlsession.selectList("fbooking.fbookingManagerList");
		
		return list;
	}
	
	public String getUserName(String user_email)throws Exception{
		
		String name = (String)sqlsession.selectOne("fbooking.getUserName", user_email);
		
		return name;
	}
}
