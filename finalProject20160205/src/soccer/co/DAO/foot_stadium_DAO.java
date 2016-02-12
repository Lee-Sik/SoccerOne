package soccer.co.DAO;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import soccer.co.DTO.ZipcodeDTO;
import soccer.co.DTO.foot_sbooking_DTO;
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
	
	public List<foot_stadium_DTO> stadiumList(String user_email)throws Exception{
		
		List<foot_stadium_DTO> stadiumList = sqlsession.selectList("stadium.stadiumList", user_email);
		
		return stadiumList;
		
	}
	
	public boolean bookingWrite(foot_sbooking_DTO dto)throws Exception{
		
		sqlsession.insert("stadium.bookingWrtie", dto);
		
		return true;
	}
	
	public boolean stadiumDelete(int stadium_seq)throws Exception{
		sqlsession.delete("stadium.stadiumDelete", stadium_seq);
		return true;
	}
	
	public List<foot_sbooking_DTO> bookingList()throws Exception{
		
		List<foot_sbooking_DTO> bookingList = sqlsession.selectList("stadium.bookingList");
		
		return bookingList;
		
	}
	
	public foot_stadium_DTO stadiumDetail(int stadium_seq)throws Exception{
			
		foot_stadium_DTO sdto = (foot_stadium_DTO)sqlsession.selectOne("stadium.stadiumDetail", stadium_seq);
		
		return sdto;
	}
	
	public  foot_sbooking_DTO bookingDetail(int booking_seq)throws Exception{
		
		foot_sbooking_DTO bdto = (foot_sbooking_DTO)sqlsession.selectOne("stadium.bookingDetail", booking_seq);
		
		return bdto;
		
	}
	
	
	
	
	
}
