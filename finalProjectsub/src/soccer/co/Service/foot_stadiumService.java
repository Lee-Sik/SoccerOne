package soccer.co.Service;

import java.util.List;

import soccer.co.DTO.ZipcodeDTO;
import soccer.co.DTO.foot_stadium_DTO;
import soccer.co.DTO.postDTO;



public interface foot_stadiumService {
	
	public List<ZipcodeDTO> zipcode(String dong)throws Exception;
	public boolean stadiumWrite(foot_stadium_DTO dto)throws Exception;
	public List<postDTO> post_gugun()throws Exception;
	public List<postDTO> post_result(String gugun, String addrtype)throws Exception;
}
