package soccer.co.DAO;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import soccer.co.DTO.ZipcodeDTO;
import soccer.co.DTO.foot_stadium_DTO;

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
}
