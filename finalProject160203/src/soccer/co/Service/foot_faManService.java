package soccer.co.Service;

import java.util.List;
import java.util.Map;

import soccer.co.DTO.foot_faMan_DTO;
import soccer.co.DTO.foot_fbooking_DTO;

public interface foot_faManService {
	public boolean faManWrite(foot_faMan_DTO dto)throws Exception;
	public List<foot_faMan_DTO> faManManagerList()throws Exception;
	public List<foot_faMan_DTO> faManList(foot_faMan_DTO dto)throws Exception;
	public boolean hitCount(int fa_man_seq)throws Exception;
	public foot_faMan_DTO faManDetail(int fa_man_seq)throws Exception;
	public foot_faMan_DTO preTitle(Map<String, Object> map)throws Exception;
	public foot_faMan_DTO nextTitle(Map<String, Object> map)throws Exception;
	public boolean faManUpdate(foot_faMan_DTO dto)throws Exception;
	public boolean faManDelete(int fa_man_seq)throws Exception;
	public int getfaManCount(foot_faMan_DTO dto)throws Exception;
	
}
