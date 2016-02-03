package soccer.co.DAO;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import soccer.co.DTO.BBSParam;
import soccer.co.DTO.foot_comunity_DTO;

@Repository
public class foot_comunity_DAO {
	@Autowired
	private SqlSession sqlSession;
	private String ns="BBS.";
	
	public boolean writeBBS(foot_comunity_DTO bbs) throws Exception{
		sqlSession.insert(ns+"writeBBS",bbs);
		return true;
	}
	public List<foot_comunity_DTO> getBBSList()throws Exception{
		List<foot_comunity_DTO> list=new ArrayList<foot_comunity_DTO>();
		list=(List<foot_comunity_DTO>)
				sqlSession.selectList(ns+"getBBSList");
		return list;
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
	
	
}
