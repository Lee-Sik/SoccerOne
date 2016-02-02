package soccer.co.DAO;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import soccer.co.DTO.ZipcodeDTO;

@Repository
public class foot_stadium_DAO {
	
	@Autowired
	private SqlSession sqlsession;
	
	public List<ZipcodeDTO> zipcode(String dong)throws Exception{
		
		List<ZipcodeDTO> zipcode = (List<ZipcodeDTO>)sqlsession.selectList("booking.zipcode", dong);
		
		return zipcode;
	}
}
