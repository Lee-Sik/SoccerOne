package soccer.co.Service;

import java.util.List;

import soccer.co.DTO.BBSParam;
import soccer.co.DTO.foot_comment_DTO;
import soccer.co.DTO.foot_community_DTO;
import soccer.co.DTO.foot_like_DTO;


public interface foot_communityService {
	boolean writeBBS(foot_community_DTO bbs) throws Exception;
	boolean writeGallery(foot_community_DTO bbs) throws Exception;
	boolean writeSellbuy(foot_community_DTO bbs) throws Exception;
	
	boolean writeComment(foot_comment_DTO comdto) throws Exception;
	boolean writeGalComment(foot_comment_DTO comdto) throws Exception;
	boolean writeSellbuyComment(foot_comment_DTO comdto) throws Exception;
	
	List<foot_comment_DTO> getCommentList(int parent_bbs_no)throws Exception;
	List<foot_comment_DTO> getGalCommentList(int parent_gallery_no)throws Exception;
	List<foot_comment_DTO> getSellbuyCommentList(int parent_gallery_no)throws Exception;
	
	List<foot_community_DTO> getBBSList()throws Exception;
	List<foot_community_DTO> getBBSPagingList(BBSParam param)throws Exception;
	int getBBSCount(BBSParam param) throws Exception;
	
	List<foot_community_DTO> getGalleryPagingList(BBSParam param)throws Exception;
	int getGalleryCount(BBSParam param) throws Exception;
	
	List<foot_community_DTO> getSellbuyPagingList(BBSParam param)throws Exception;
	int getSellbuyCount(BBSParam param) throws Exception;
	
	foot_community_DTO getBBS(foot_community_DTO dto)throws Exception;
	foot_community_DTO getGallery(foot_community_DTO dto)throws Exception;
	foot_community_DTO getSellbuy(foot_community_DTO dto)throws Exception;
	
	foot_comment_DTO getComment(foot_comment_DTO comdto)throws Exception;
	foot_comment_DTO getGalComment(foot_comment_DTO comdto)throws Exception;
	foot_comment_DTO getSellbuyComment(foot_comment_DTO comdto)throws Exception;
	
	foot_like_DTO getLike(foot_like_DTO flike)throws Exception;
	foot_like_DTO getGalLike(foot_like_DTO flike)throws Exception;
	foot_like_DTO getSellbuyLike(foot_like_DTO flike)throws Exception;
	
	boolean replyBBS(foot_community_DTO bbs)throws Exception;
	
	boolean incrementReadCount(foot_community_DTO bbs)throws Exception;
	boolean incrementGalReadCount(foot_community_DTO bbs)throws Exception;
	boolean incrementSellbuyReadCount(foot_community_DTO bbs)throws Exception;
	
	boolean incrementCommentCount(foot_community_DTO bbs)throws Exception;
	boolean incrementGalCommentCount(foot_community_DTO bbs)throws Exception;
	boolean incrementSellbuyCommentCount(foot_community_DTO bbs)throws Exception;
	
	boolean bbsLike(foot_like_DTO flike)throws Exception;
	boolean bbsLikeCount(int bbs_no)throws Exception;
	boolean bbsLikeDel(foot_like_DTO flike)throws Exception;
	boolean bbsLikeCountDel(int bbs_no)throws Exception;
	
	boolean galLike(foot_like_DTO flike)throws Exception;
	boolean galLikeCount(int parent_gallery_no)throws Exception;
	boolean galLikeDel(foot_like_DTO flike)throws Exception;
	boolean galLikeCountDel(int parent_gallery_no)throws Exception;
	
	boolean sellbuyLike(foot_like_DTO flike)throws Exception;
	boolean sellbuyLikeCount(int sellbuy_no)throws Exception;
	boolean sellbuyLikeDel(foot_like_DTO flike)throws Exception;
	boolean sellbuyLikeCountDel(int sellbuy_no)throws Exception;
	
	boolean updateBBS(foot_community_DTO bbs)throws Exception;
	boolean updateComment(foot_comment_DTO comdto)throws Exception;
	
	boolean updateGallery(foot_community_DTO bbs)throws Exception;
	boolean updateGalComment(foot_comment_DTO comdto)throws Exception;
	
	boolean updateSellbuy(foot_community_DTO bbs)throws Exception;
	boolean updateSellbuyComment(foot_comment_DTO comdto)throws Exception;
	
	boolean delBBS(foot_community_DTO bbs)throws Exception;
	boolean delComment(foot_comment_DTO comdto)throws Exception;
	boolean decrementCommentCount(foot_community_DTO bbs)throws Exception;
	
	boolean delGallery(foot_community_DTO bbs)throws Exception;
	boolean delGalComment(foot_comment_DTO comdto)throws Exception;
	boolean decrementGalCommentCount(foot_community_DTO bbs)throws Exception;
	
	boolean delSellbuy(foot_community_DTO bbs)throws Exception;
	boolean delSellbuyComment(foot_comment_DTO comdto)throws Exception;
	boolean decrementSellbuyCommentCount(foot_community_DTO bbs)throws Exception;
	
}
