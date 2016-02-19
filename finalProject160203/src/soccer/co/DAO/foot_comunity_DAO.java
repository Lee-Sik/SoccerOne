package soccer.co.DAO;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import soccer.co.DTO.BBSParam;
import soccer.co.DTO.foot_comment_DTO;
import soccer.co.DTO.foot_comunity_DTO;
import soccer.co.DTO.foot_like_DTO;

@Repository
public class foot_comunity_DAO {
	@Autowired
	private SqlSession sqlSession;
	private String ns="BBS.";
	
	public boolean writeBBS(foot_comunity_DTO bbs) throws Exception{
		sqlSession.insert(ns+"writeBBS",bbs);
		return true;
	}
	
	public boolean writeComment(foot_comment_DTO comdto) throws Exception{
		sqlSession.insert(ns+"writeComment",comdto);
		return true;
	}
	
	public List<foot_comunity_DTO> getBBSList()throws Exception{
		List<foot_comunity_DTO> list=new ArrayList<foot_comunity_DTO>();
		list=(List<foot_comunity_DTO>)
				sqlSession.selectList(ns+"getBBSList");
		return list;
	}
	
	public List<foot_comment_DTO> getCommentList(int parent_bbs_no)throws Exception{
		List<foot_comment_DTO> list=new ArrayList<foot_comment_DTO>();
		list=(List<foot_comment_DTO>)
				sqlSession.selectList(ns+"getCommentList", parent_bbs_no);
		return list;
	}

	public foot_like_DTO getLike(foot_like_DTO flike)throws Exception{
		foot_like_DTO fdto=null;
		fdto=(foot_like_DTO)
				sqlSession.selectOne(ns+"getLike",flike);
		return fdto;
	}
	
	public List<foot_comunity_DTO> getBBSPagingList(BBSParam param)throws Exception{
		List<foot_comunity_DTO> list=new ArrayList<foot_comunity_DTO>();
		list=(List<foot_comunity_DTO>)
				sqlSession.selectList(ns+"getBBSPagingList",param);
		return list;
	}	
	public int getBBSCount(BBSParam param) throws Exception{
		int num=0;
		num=(Integer)sqlSession.selectOne(ns+"getBBSCount",param);
		return num;
	}
	
	public foot_comment_DTO getComment(foot_comment_DTO comdto)throws Exception{
		foot_comment_DTO com=null;
		com=(foot_comment_DTO)
				sqlSession.selectOne(ns+"getComment",comdto);
		return com;
	}
	
	public foot_comunity_DTO getBBS(foot_comunity_DTO dto)throws Exception{
		foot_comunity_DTO bbs=null;
		bbs=(foot_comunity_DTO)
				sqlSession.selectOne(ns+"getBBS",dto);
		return bbs;
	}
	
	public boolean incrementReadCount(foot_comunity_DTO bbs)throws Exception{
		sqlSession.update(ns+"incrementReadCount",bbs);
		return true;
	}
	
	public boolean incrementCommentCount(foot_comunity_DTO bbs)throws Exception{
		sqlSession.update(ns+"incrementCommentCount",bbs);
		return true;
	}
	
	public boolean bbsLike(foot_like_DTO flike)throws Exception{
		sqlSession.insert(ns+"bbsLike",flike);
		return true;
	}
	
	public boolean bbsLikeCount(int bbs_no)throws Exception{
		sqlSession.update(ns+"bbsLikeCount",bbs_no);
		return true;
	}
	
	public boolean bbsLikeDel(foot_like_DTO flike)throws Exception{
		sqlSession.delete(ns+"bbsLikeDel",flike);
		return true;
	}
	
	public boolean bbsLikeCountDel(int bbs_no)throws Exception{
		sqlSession.update(ns+"bbsLikeCountDel",bbs_no);
		return true;
	}
	
	public boolean bbsLikeReadCount(foot_comunity_DTO bbs)throws Exception{
		sqlSession.update(ns+"bbsLikeReadCount",bbs);
		return true;
	}
	
	public boolean replyBBSUpdate(foot_comunity_DTO bbs)throws Exception{
		sqlSession.update(ns+"replyBBSUpdate",bbs);
		return true;
	}
	
	public boolean replyBBSInsert(foot_comunity_DTO bbs)throws Exception{
		sqlSession.insert(ns+"replyBBSInsert",bbs);
		return true;
	}
	
	public boolean updateBBS(foot_comunity_DTO bbs)throws Exception{
		sqlSession.update(ns+"updateBBS",bbs);
		return true;
	}
	
	public boolean delBBS(foot_comunity_DTO bbs)throws Exception{		
		sqlSession.update(ns+"delBBS", bbs);
		return true;
	}
	
	public boolean delComment(foot_comment_DTO comdto)throws Exception{
		sqlSession.delete(ns+"delComment",comdto);
		return true;
	}
	
	public boolean decrementCommentCount(foot_comunity_DTO bbs)throws Exception{		
		sqlSession.update(ns+"decrementCommentCount", bbs);
		return true;
	}
	
	public boolean updateComment(foot_comment_DTO comdto)throws Exception{
		sqlSession.update(ns+"updateComment",comdto);
		return true;
	}
	
}
