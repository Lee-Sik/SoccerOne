package soccer.co.Service;

import java.util.List;

import soccer.co.DTO.BBSParam;
import soccer.co.DTO.foot_comunity_DTO;


public interface foot_comunityService {
	boolean writeBBS(foot_comunity_DTO bbs) throws Exception;
	
	
	
	
	List<foot_comunity_DTO> getBBSList()throws Exception;
	List<foot_comunity_DTO> getBBSPagingList(BBSParam param)throws Exception;
	
	int getBBSCount(BBSParam param) throws Exception;
	foot_comunity_DTO getBBS(foot_comunity_DTO dto)throws Exception;
	
	boolean replyBBS(foot_comunity_DTO bbs)throws Exception;
	boolean incrementReadCount(foot_comunity_DTO bbs)throws Exception;
	
	boolean updateBBS(foot_comunity_DTO bbs)throws Exception;
	
	boolean delBBS(foot_comunity_DTO bbs)throws Exception;
}
