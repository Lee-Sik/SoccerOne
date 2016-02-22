package soccer.co.Service;

import java.util.List;

import soccer.co.DTO.BBSParam;
import soccer.co.DTO.foot_comment_DTO;
import soccer.co.DTO.foot_community_DTO;
import soccer.co.DTO.foot_like_DTO;


public interface foot_communityService {
	boolean writeBBS(foot_community_DTO bbs) throws Exception;
	boolean writeComment(foot_comment_DTO comdto) throws Exception;
	List<foot_comment_DTO> getCommentList(int parent_bbs_no)throws Exception;
	
	List<foot_community_DTO> getBBSList()throws Exception;
	List<foot_community_DTO> getBBSPagingList(BBSParam param)throws Exception;
	
	int getBBSCount(BBSParam param) throws Exception;
	
	foot_community_DTO getBBS(foot_community_DTO dto)throws Exception;
	foot_comment_DTO getComment(foot_comment_DTO comdto)throws Exception;
	foot_like_DTO getLike(foot_like_DTO flike)throws Exception;
	
	boolean replyBBS(foot_community_DTO bbs)throws Exception;
	boolean incrementReadCount(foot_community_DTO bbs)throws Exception;
	boolean incrementCommentCount(foot_community_DTO bbs)throws Exception;
	
	boolean bbsLike(foot_like_DTO flike)throws Exception;
	boolean bbsLikeCount(int bbs_no)throws Exception;
	boolean bbsLikeDel(foot_like_DTO flike)throws Exception;
	boolean bbsLikeCountDel(int bbs_no)throws Exception;
	
	boolean updateBBS(foot_community_DTO bbs)throws Exception;
	boolean updateComment(foot_comment_DTO comdto)throws Exception;
	
	boolean delBBS(foot_community_DTO bbs)throws Exception;
	boolean delComment(foot_comment_DTO comdto)throws Exception;
	boolean decrementCommentCount(foot_community_DTO bbs)throws Exception;
	
}
