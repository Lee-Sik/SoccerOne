package soccer.co.DAO;

import java.util.List;
import java.util.Map;

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
	
	public foot_fbooking_DTO fbookingDetail(int free_b_seq)throws Exception{
		
		foot_fbooking_DTO dto = (foot_fbooking_DTO)sqlsession.selectOne("fbooking.fbookingDetail", free_b_seq);
		
		return dto;
	}
	public foot_fbooking_DTO preTitle(Map<String, Object> map)throws Exception{
		foot_fbooking_DTO dto = null;
		
		dto = (foot_fbooking_DTO)sqlsession.selectOne("fbooking.preTitle", map);
		return dto;
	}
	public foot_fbooking_DTO nextTitle(Map<String, Object> map)throws Exception{
		foot_fbooking_DTO dto = null;
		
		dto = (foot_fbooking_DTO)sqlsession.selectOne("fbooking.nextTitle", map);
		return dto;
	}
	
	
	
	
	
	
	
	
	
	
	
	
}
