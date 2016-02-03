package soccer.co.DAO;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import soccer.co.DTO.ZipcodeDTO;
import soccer.co.DTO.foot_stadium_DTO;
import soccer.co.DTO.postDTO;

@Repository
public class foot_stadium_DAO {
	
	@Autowired
	private SqlSession sqlsession;
	
	public List<ZipcodeDTO> zipcode(String dong)throws Exception{
		
		List<ZipcodeDTO> zipcode = (List<ZipcodeDTO>)sqlsession.selectList("stadium.zipcode", dong);
		
		return zipcode;
	}
	public boolean stadiumWrite(foot_stadium_DTO dto)throws Exception{
		
		sqlsession.insert("stadium.stadiumWrite", dto);
		return true;
		
	}
	public List<postDTO> post_gugun()throws Exception{
		
		List<postDTO> post_gugun = sqlsession.selectList("stadium.post_gugun");
		
		return post_gugun;
	}
	public List<postDTO> post_result(String gugun,String addrtype)throws Exception{
		
		Map<String, String> map = new HashMap<String,String>();
		
		map.put("gugun", gugun);
		map.put("addrtype", addrtype);
		
		List<postDTO> post_result = sqlsession.selectList("stadium.post_result", map);
		
		return post_result;
		
	}
}
