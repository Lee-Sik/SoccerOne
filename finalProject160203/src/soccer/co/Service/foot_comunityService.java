package soccer.co.Service;

import java.util.List;

import soccer.co.DTO.BBSParam;
import soccer.co.DTO.foot_comment_DTO;
import soccer.co.DTO.foot_comunity_DTO;
import soccer.co.DTO.foot_like_DTO;


public interface foot_comunityService {
	boolean writeBBS(foot_comunity_DTO bbs) throws Exception;
	boolean writeComment(foot_comment_DTO comdto) throws Exception;
	List<foot_comment_DTO> getCommentList(int parent_bbs_no)throws Exception;
	
	List<foot_comunity_DTO> getBBSList()throws Exception;
	List<foot_comunity_DTO> getBBSPagingList(BBSParam param)throws Exception;
	
	int getBBSCount(BBSParam param) throws Exception;
	
	foot_comunity_DTO getBBS(foot_comunity_DTO dto)throws Exception;
	foot_like_DTO getLike(foot_like_DTO flike)throws Exception;
	
	boolean replyBBS(foot_comunity_DTO bbs)throws Exception;
	boolean incrementReadCount(foot_comunity_DTO bbs)throws Exception;
	boolean incrementCommentCount(foot_comunity_DTO bbs)throws Exception;
	
	boolean bbsLike(foot_like_DTO flike)throws Exception;
	boolean bbsLikeCount(int bbs_no)throws Exception;
	boolean bbsLikeDel(foot_like_DTO flike)throws Exception;
	boolean bbsLikeCountDel(int bbs_no)throws Exception;
	
	boolean updateBBS(foot_comunity_DTO bbs)throws Exception;
	
	boolean delBBS(foot_comunity_DTO bbs)throws Exception;
}
