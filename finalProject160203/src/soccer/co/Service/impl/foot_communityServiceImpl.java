package soccer.co.Service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import soccer.co.DAO.foot_community_DAO;
import soccer.co.DTO.BBSParam;
import soccer.co.DTO.foot_comment_DTO;
import soccer.co.DTO.foot_community_DTO;
import soccer.co.DTO.foot_like_DTO;
import soccer.co.Service.foot_communityService;


@Service
public class foot_communityServiceImpl implements foot_communityService {
    
	@Autowired
	private foot_community_DAO BBSDao;
	
	@Override
	@Transactional
	public boolean writeBBS(foot_community_DTO bbs) throws Exception {
		return BBSDao.writeBBS(bbs);
	}
	
	@Override
	@Transactional
	public boolean writeGallery(foot_community_DTO bbs) throws Exception {
		return BBSDao.writeGallery(bbs);
	}
	
	@Override
	@Transactional
	public boolean writeSellbuy(foot_community_DTO bbs) throws Exception {
		return BBSDao.writeSellbuy(bbs);
	}
	
	@Override
	@Transactional
	public boolean writeComment(foot_comment_DTO comdto) throws Exception {
		return BBSDao.writeComment(comdto);
	}
	
	@Override
	@Transactional
	public boolean writeGalComment(foot_comment_DTO comdto) throws Exception {
		return BBSDao.writeGalComment(comdto);
	}
	
	@Override
	@Transactional
	public boolean writeSellbuyComment(foot_comment_DTO comdto) throws Exception {
		return BBSDao.writeSellbuyComment(comdto);
	}
	
	@Override
	@Transactional(readOnly=true)
	public List<foot_comment_DTO> getCommentList(int parent_bbs_no) throws Exception {
		return BBSDao.getCommentList(parent_bbs_no);
	}
	
	@Override
	@Transactional(readOnly=true)
	public List<foot_comment_DTO> getGalCommentList(int parent_gallery_no) throws Exception {
		return BBSDao.getGalCommentList(parent_gallery_no);
	}
	
	@Override
	@Transactional(readOnly=true)
	public List<foot_comment_DTO> getSellbuyCommentList(int parent_sellbuy_no) throws Exception {
		return BBSDao.getSellbuyCommentList(parent_sellbuy_no);
	}
	
	@Override
	@Transactional(readOnly=true)
	public List<foot_community_DTO> getBBSList() throws Exception {
		return BBSDao.getBBSList();
	}

	@Override
	@Transactional(readOnly=true)
	public List<foot_community_DTO> getBBSPagingList(BBSParam param)
			throws Exception {
		
		return BBSDao.getBBSPagingList(param);
	}
	
	@Override
	@Transactional(readOnly=true)
	public int getBBSCount(BBSParam param) throws Exception {
		return BBSDao.getBBSCount(param);
	}
	
	@Override
	@Transactional(readOnly=true)
	public List<foot_community_DTO> getGalleryPagingList(BBSParam param)
			throws Exception {
		
		return BBSDao.getGalleryPagingList(param);
	}
	
	@Override
	@Transactional(readOnly=true)
	public int getGalleryCount(BBSParam param) throws Exception {
		return BBSDao.getGalleryCount(param);
	}
	
	@Override
	@Transactional(readOnly=true)
	public List<foot_community_DTO> getSellbuyPagingList(BBSParam param)
			throws Exception {
		
		return BBSDao.getSellbuyPagingList(param);
	}
	
	@Override
	@Transactional(readOnly=true)
	public int getSellbuyCount(BBSParam param) throws Exception {
		return BBSDao.getSellbuyCount(param);
	}
	
	@Override
	@Transactional(readOnly=true)
	public foot_like_DTO getLike(foot_like_DTO flike) throws Exception {
		foot_like_DTO fail=  BBSDao.getLike(flike);
		foot_like_DTO init=  new foot_like_DTO();
		
		return fail == null? init: fail;
	}
	
	@Override
	@Transactional(readOnly=true)
	public foot_like_DTO getGalLike(foot_like_DTO flike) throws Exception {
		foot_like_DTO fail=  BBSDao.getGalLike(flike);
		foot_like_DTO init=  new foot_like_DTO();
		
		return fail == null? init: fail;
	}
	
	@Override
	@Transactional(readOnly=true)
	public foot_like_DTO getSellbuyLike(foot_like_DTO flike) throws Exception {
		foot_like_DTO fail=  BBSDao.getSellbuyLike(flike);
		foot_like_DTO init=  new foot_like_DTO();
		
		return fail == null? init: fail;
	}

	@Override
	@Transactional(readOnly=true)
	public foot_community_DTO getBBS(foot_community_DTO dto) throws Exception {
		return BBSDao.getBBS(dto);
	}
	
	@Override
	@Transactional(readOnly=true)
	public foot_community_DTO getGallery(foot_community_DTO dto) throws Exception {
		return BBSDao.getGallery(dto);
	}
	
	@Override
	@Transactional(readOnly=true)
	public foot_community_DTO getSellbuy(foot_community_DTO dto) throws Exception {
		return BBSDao.getSellbuy(dto);
	}
	
	@Override
	@Transactional(readOnly=true)
	public foot_comment_DTO getComment(foot_comment_DTO comdto) throws Exception {
		return BBSDao.getComment(comdto);
	}
	
	@Override
	@Transactional(readOnly=true)
	public foot_comment_DTO getGalComment(foot_comment_DTO comdto) throws Exception {
		return BBSDao.getGalComment(comdto);
	}
	
	@Override
	@Transactional(readOnly=true)
	public foot_comment_DTO getSellbuyComment(foot_comment_DTO comdto) throws Exception {
		return BBSDao.getSellbuyComment(comdto);
	}
	
	@Override
	public boolean replyBBS(foot_community_DTO bbs) throws Exception {
		BBSDao.replyBBSUpdate(bbs);
		BBSDao.replyBBSInsert(bbs);
		return true;
	}

	@Override
	public boolean incrementReadCount(foot_community_DTO bbs) throws Exception {
		return BBSDao.incrementReadCount(bbs);
	}
	
	@Override
	public boolean incrementGalReadCount(foot_community_DTO bbs) throws Exception {
		return BBSDao.incrementGalReadCount(bbs);
	}
	
	@Override
	public boolean incrementSellbuyReadCount(foot_community_DTO bbs) throws Exception {
		return BBSDao.incrementSellbuyReadCount(bbs);
	}
	
	@Override
	public boolean incrementCommentCount(foot_community_DTO bbs) throws Exception {	
		return BBSDao.incrementCommentCount(bbs);
	}
	
	@Override
	public boolean incrementGalCommentCount(foot_community_DTO bbs) throws Exception {	
		return BBSDao.incrementGalCommentCount(bbs);
	}
	
	@Override
	public boolean incrementSellbuyCommentCount(foot_community_DTO bbs) throws Exception {	
		return BBSDao.incrementSellbuyCommentCount(bbs);
	}
	
	@Override
	public boolean bbsLike(foot_like_DTO flike) throws Exception {
		
		return BBSDao.bbsLike(flike);
	}
	
	@Override
	public boolean galLike(foot_like_DTO flike) throws Exception {
		
		return BBSDao.galLike(flike);
	}
	
	@Override
	public boolean sellbuyLike(foot_like_DTO flike) throws Exception {
		
		return BBSDao.sellbuyLike(flike);
	}
	
	@Override
	public boolean bbsLikeCount(int bbs_no) throws Exception {
		
		return BBSDao.bbsLikeCount(bbs_no);
	}
	
	@Override
	public boolean galLikeCount(int gallery_no) throws Exception {
		
		return BBSDao.galLikeCount(gallery_no);
	}
	
	@Override
	public boolean sellbuyLikeCount(int sellbuy_no) throws Exception {
		
		return BBSDao.sellbuyLikeCount(sellbuy_no);
	}
	
	@Override
	public boolean bbsLikeDel(foot_like_DTO flike) throws Exception {
		
		return BBSDao.bbsLikeDel(flike);
	}
	
	@Override
	public boolean galLikeDel(foot_like_DTO flike) throws Exception {
		
		return BBSDao.galLikeDel(flike);
	}
	
	@Override
	public boolean sellbuyLikeDel(foot_like_DTO flike) throws Exception {
		return BBSDao.sellbuyLikeDel(flike);
	}
	
	@Override
	public boolean bbsLikeCountDel(int bbs_no) throws Exception {
		
		return BBSDao.bbsLikeCountDel(bbs_no);
	}
	
	@Override
	public boolean galLikeCountDel(int gallery_no) throws Exception {
		
		return BBSDao.galLikeCountDel(gallery_no);
	}
	
	@Override
	public boolean sellbuyLikeCountDel(int sellbuy_no) throws Exception {
		
		return BBSDao.sellbuyLikeCountDel(sellbuy_no);
	}

	@Override
	public boolean updateBBS(foot_community_DTO bbs) throws Exception {
		
		return BBSDao.updateBBS(bbs);		
	}
	
	@Override
	public boolean updateGallery(foot_community_DTO bbs) throws Exception {
		
		return BBSDao.updateGallery(bbs);		
	}
	
	@Override
	public boolean updateSellbuy(foot_community_DTO bbs) throws Exception {
		
		return BBSDao.updateSellbuy(bbs);		
	}

	@Override
	public boolean delBBS(foot_community_DTO bbs) throws Exception {
		
		System.out.println("bbs.getDel = " + bbs.getDel());
		bbs.setDel(1);
		System.out.println("bbs.getDel = " + bbs.getDel());
		
		return BBSDao.delBBS(bbs);		
	}
	
	@Override
	public boolean delGallery(foot_community_DTO bbs) throws Exception {
		
		System.out.println("bbs.getDel = " + bbs.getDel());
		bbs.setDel(1);
		System.out.println("bbs.getDel = " + bbs.getDel());
		
		return BBSDao.delGallery(bbs);		
	}
	
	@Override
	public boolean delSellbuy(foot_community_DTO bbs) throws Exception {
		
		System.out.println("bbs.getDel = " + bbs.getDel());
		bbs.setDel(1);
		System.out.println("bbs.getDel = " + bbs.getDel());
		
		return BBSDao.delSellbuy(bbs);		
	}
	
	@Override
	public boolean delComment(foot_comment_DTO comdto) throws Exception {
		
		return BBSDao.delComment(comdto);
	}
	
	@Override
	public boolean delGalComment(foot_comment_DTO comdto) throws Exception {
		
		return BBSDao.delGalComment(comdto);
	}
	
	@Override
	public boolean delSellbuyComment(foot_comment_DTO comdto) throws Exception {
		
		return BBSDao.delSellbuyComment(comdto);
	}
	
	@Override
	public boolean decrementCommentCount(foot_community_DTO bbs) throws Exception {
		
		return BBSDao.decrementCommentCount(bbs);		
	}
	
	@Override
	public boolean decrementGalCommentCount(foot_community_DTO bbs) throws Exception {
		
		return BBSDao.decrementGalCommentCount(bbs);		
	}
	
	@Override
	public boolean decrementSellbuyCommentCount(foot_community_DTO bbs) throws Exception {
		
		return BBSDao.decrementSellbuyCommentCount(bbs);		
	}
	
	@Override
	public boolean updateComment(foot_comment_DTO comdto) throws Exception {
		
		return BBSDao.updateComment(comdto);		
	}
	
	@Override
	public boolean updateGalComment(foot_comment_DTO comdto) throws Exception {
		
		return BBSDao.updateGalComment(comdto);		
	}
	
	@Override
	public boolean updateSellbuyComment(foot_comment_DTO comdto) throws Exception {
		
		return BBSDao.updateSellbuyComment(comdto);		
	}
	
	
}
