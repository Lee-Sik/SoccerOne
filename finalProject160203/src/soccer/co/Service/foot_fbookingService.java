package soccer.co.Service;

import java.util.List;

import soccer.co.DTO.foot_fbooking_DTO;

public interface foot_fbookingService {
	
	public boolean fbookingWrite(foot_fbooking_DTO dto)throws Exception;
	public List<foot_fbooking_DTO> fbookingList()throws Exception;
	public List<foot_fbooking_DTO> fbookingManagerList()throws Exception;
	public String getUserName(String user_email)throws Exception;
}
