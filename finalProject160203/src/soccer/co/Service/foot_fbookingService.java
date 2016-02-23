package soccer.co.Service;

import java.util.List;
import java.util.Map;

import soccer.co.DTO.foot_fbooking_DTO;

public interface foot_fbookingService {
	
	public boolean fbookingWrite(foot_fbooking_DTO dto)throws Exception;
	public List<foot_fbooking_DTO> fbookingList()throws Exception;
	public List<foot_fbooking_DTO> fbookingManagerList()throws Exception;
	public String getUserName(String user_email)throws Exception;
	public foot_fbooking_DTO fbookingDetail(int free_b_seq)throws Exception;
	public foot_fbooking_DTO preTitle(Map<String, Object> map)throws Exception;
	public foot_fbooking_DTO nextTitle(Map<String, Object> map)throws Exception;
}
