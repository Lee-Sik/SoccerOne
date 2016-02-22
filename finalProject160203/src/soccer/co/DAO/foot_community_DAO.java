package soccer.co.DAO;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import soccer.co.DTO.BBSParam;
import soccer.co.DTO.foot_comment_DTO;
import soccer.co.DTO.foot_community_DTO;
import soccer.co.DTO.foot_like_DTO;

@Repository
public class foot_community_DAO {
	@Autowired
	private SqlSession sqlSession;
	private String ns="BBS.";
	
	public boolean writeBBS(foot_community_DTO bbs) throws Exception{
		sqlSession.insert(ns+"writeBBS",bbs);
		return true;
	}
	
	public boolean writeGallery(foot_community_DTO bbs) throws Exception{
		sqlSession.insert(ns+"writeGallery",bbs);
		return true;
	}
	
	public boolean writeComment(foot_comment_DTO comdto) throws Exception{
		sqlSession.insert(ns+"writeComment",comdto);
		
		return true;
	}
	
	public boolean writeGalComment(foot_comment_DTO comdto) throws Exception{
		sqlSession.insert(ns+"writeGalComment",comdto);
		return true;
	}
	
	public List<foot_community_DTO> getBBSList()throws Exception{
		List<foot_community_DTO> list=new ArrayList<foot_community_DTO>();
		list=(List<foot_community_DTO>)
				sqlSession.selectList(ns+"getBBSList");
		return list;
	}
	
	public List<foot_comment_DTO> getCommentList(int parent_bbs_no)throws Exception{
		List<foot_comment_DTO> list=new ArrayList<foot_comment_DTO>();
		list=(List<foot_comment_DTO>)
				sqlSession.selectList(ns+"getCommentList", parent_bbs_no);
		return list;
	}
	
	public List<foot_comment_DTO> getGalCommentList(int parent_gallery_no)throws Exception{
		List<foot_comment_DTO> list=new ArrayList<foot_comment_DTO>();
		list=(List<foot_comment_DTO>)
				sqlSession.selectList(ns+"getGalCommentList", parent_gallery_no);
		return list;
	}

	public foot_like_DTO getLike(foot_like_DTO flike)throws Exception{
		foot_like_DTO fdto=null;
		fdto=(foot_like_DTO)
				sqlSession.selectOne(ns+"getLike",flike);
		return fdto;
	}
	
	public foot_like_DTO getGalLike(foot_like_DTO flike)throws Exception{
		foot_like_DTO fdto=null;
		fdto=(foot_like_DTO)
				sqlSession.selectOne(ns+"getGalLike",flike);
		return fdto;
	}
	
	public List<foot_community_DTO> getBBSPagingList(BBSParam param)throws Exception{
		List<foot_community_DTO> list=new ArrayList<foot_community_DTO>();
		list=(List<foot_community_DTO>)
				sqlSession.selectList(ns+"getBBSPagingList",param);
		return list;
	}	
	public int getBBSCount(BBSParam param) throws Exception{
		int num=0;
		num=(Integer)sqlSession.selectOne(ns+"getBBSCount",param);
		return num;
	}
	
	public List<foot_community_DTO> getGalleryPagingList(BBSParam param)throws Exception{
		List<foot_community_DTO> list=new ArrayList<foot_community_DTO>();
		list=(List<foot_community_DTO>)
				sqlSession.selectList(ns+"getGalleryPagingList",param);
		return list;
	}	
	public int getGalleryCount(BBSParam param) throws Exception{
		int num=0;
		num=(Integer)sqlSession.selectOne(ns+"getGalleryCount",param);
		return num;
	}
	
	public foot_comment_DTO getComment(foot_comment_DTO comdto)throws Exception{
		foot_comment_DTO com=null;
		com=(foot_comment_DTO)
				sqlSession.selectOne(ns+"getComment",comdto);
		return com;
	}
	
	public foot_comment_DTO getGalComment(foot_comment_DTO comdto)throws Exception{
		foot_comment_DTO com=null;
		com=(foot_comment_DTO)
				sqlSession.selectOne(ns+"getGalComment",comdto);
		return com;
	}
	
	public foot_community_DTO getBBS(foot_community_DTO dto)throws Exception{
		foot_community_DTO bbs=null;
		bbs=(foot_community_DTO)
				sqlSession.selectOne(ns+"getBBS",dto);
		return bbs;
	}
	
	public foot_community_DTO getGallery(foot_community_DTO dto)throws Exception{
		foot_community_DTO gal=null;
		gal=(foot_community_DTO)
				sqlSession.selectOne(ns+"getGallery",dto);
		return gal;
	}
	
	public boolean incrementReadCount(foot_community_DTO bbs)throws Exception{
		sqlSession.update(ns+"incrementReadCount",bbs);
		return true;
	}
	
	public boolean incrementGalReadCount(foot_community_DTO bbs)throws Exception{
		sqlSession.update(ns+"incrementGalReadCount",bbs);
		return true;
	}
	
	public boolean incrementCommentCount(foot_community_DTO bbs)throws Exception{
		sqlSession.update(ns+"incrementCommentCount",bbs);
		return true;
	}
	
	public boolean incrementGalCommentCount(foot_community_DTO bbs)throws Exception{
		sqlSession.update(ns+"incrementGalCommentCount",bbs);
		return true;
	}
	
	public boolean bbsLike(foot_like_DTO flike)throws Exception{
		sqlSession.insert(ns+"bbsLike",flike);
		return true;
	}
	
	public boolean galLike(foot_like_DTO flike)throws Exception{
		sqlSession.insert(ns+"galLike",flike);
		return true;
	}
	
	public boolean bbsLikeCount(int bbs_no)throws Exception{
		sqlSession.update(ns+"bbsLikeCount",bbs_no);
		return true;
	}
	
	public boolean galLikeCount(int gallery_no)throws Exception{
		sqlSession.update(ns+"galLikeCount",gallery_no);
		return true;
	}
	
	public boolean bbsLikeDel(foot_like_DTO flike)throws Exception{
		sqlSession.delete(ns+"bbsLikeDel",flike);
		return true;
	}
	
	public boolean galLikeDel(foot_like_DTO flike)throws Exception{
		sqlSession.delete(ns+"galLikeDel",flike);
		return true;
	}
	
	public boolean bbsLikeCountDel(int bbs_no)throws Exception{
		sqlSession.update(ns+"bbsLikeCountDel",bbs_no);
		return true;
	}
	
	public boolean galLikeCountDel(int gallery_no)throws Exception{
		sqlSession.update(ns+"galLikeCountDel",gallery_no);
		return true;
	}
	
	public boolean bbsLikeReadCount(foot_community_DTO bbs)throws Exception{
		sqlSession.update(ns+"bbsLikeReadCount",bbs);
		return true;
	}
	
	public boolean galLikeReadCount(foot_community_DTO bbs)throws Exception{
		sqlSession.update(ns+"galLikeReadCount",bbs);
		return true;
	}
	
	public boolean replyBBSUpdate(foot_community_DTO bbs)throws Exception{
		sqlSession.update(ns+"replyBBSUpdate",bbs);
		return true;
	}
	
	public boolean replyBBSInsert(foot_community_DTO bbs)throws Exception{
		sqlSession.insert(ns+"replyBBSInsert",bbs);
		return true;
	}
	
	public boolean updateBBS(foot_community_DTO bbs)throws Exception{
		sqlSession.update(ns+"updateBBS",bbs);
		return true;
	}
	
	public boolean updateGallery(foot_community_DTO bbs)throws Exception{
		sqlSession.update(ns+"updateGallery",bbs);
		return true;
	}
	
	public boolean delBBS(foot_community_DTO bbs)throws Exception{		
		sqlSession.update(ns+"delBBS", bbs);
		return true;
	}
	
	public boolean delGallery(foot_community_DTO bbs)throws Exception{		
		sqlSession.update(ns+"delGallery", bbs);
		return true;
	}
	
	public boolean delComment(foot_comment_DTO comdto)throws Exception{
		sqlSession.delete(ns+"delComment",comdto);
		return true;
	}
	
	public boolean delGalComment(foot_comment_DTO comdto)throws Exception{
		sqlSession.delete(ns+"delGalComment",comdto);
		return true;
	}
	
	public boolean decrementCommentCount(foot_community_DTO bbs)throws Exception{		
		sqlSession.update(ns+"decrementCommentCount", bbs);
		return true;
	}
	
	public boolean decrementGalCommentCount(foot_community_DTO bbs)throws Exception{		
		sqlSession.update(ns+"decrementGalCommentCount", bbs);
		return true;
	}
	
	public boolean updateComment(foot_comment_DTO comdto)throws Exception{
		sqlSession.update(ns+"updateComment",comdto);
		return true;
	}
	
	public boolean updateGalComment(foot_comment_DTO comdto)throws Exception{
		sqlSession.update(ns+"updateGalComment",comdto);
		return true;
	}
	
}
