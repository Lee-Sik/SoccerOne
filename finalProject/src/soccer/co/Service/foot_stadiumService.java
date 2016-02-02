package soccer.co.Service;

import java.util.List;

import soccer.co.DTO.ZipcodeDTO;



public interface foot_stadiumService {
	
	public List<ZipcodeDTO> zipcode(String dong)throws Exception;
}
