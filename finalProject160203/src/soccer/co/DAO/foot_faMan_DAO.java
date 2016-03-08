package soccer.co.DAO;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import soccer.co.DTO.foot_faMan_DTO;
import soccer.co.DTO.foot_fbooking_DTO;

@Repository
public class foot_faMan_DAO {
		
	@Autowired
	SqlSession sqlsession;
	
	public boolean faManWrite(foot_faMan_DTO dto)throws Exception{
		sqlsession.insert("faMan.faManWrite", dto);
		
		return true;
	}
	public List<foot_faMan_DTO> faManManagerList()throws Exception{
		
		List<foot_faMan_DTO> mlist = (List<foot_faMan_DTO>)sqlsession.selectList("faMan.faManManagerList");
		return mlist;
	}
	
	public List<foot_faMan_DTO> faManList(foot_faMan_DTO dto)throws Exception{
		
		List<foot_faMan_DTO> list = (List<foot_faMan_DTO>)sqlsession.selectList("faMan.faManList", dto);
		
		return list;
		
	}
	
	public boolean hitCount(int fa_man_seq)throws Exception{
		sqlsession.update("faMan.hitCount", fa_man_seq);
		return true;
	}
	
	public foot_faMan_DTO fbookingDetail(int fa_man_seq)throws Exception{
		
		foot_faMan_DTO dto = (foot_faMan_DTO)sqlsession.selectOne("faMan.faManDetail", fa_man_seq);
		return dto;
	}
	public foot_faMan_DTO preTitle(Map<String, Object> map)throws Exception{
		foot_faMan_DTO dto = (foot_faMan_DTO)sqlsession.selectOne("faMan.preTitle", map);
				return dto;
	}
	public foot_faMan_DTO nextTitle(Map<String, Object> map)throws Exception{
		foot_faMan_DTO dto = (foot_faMan_DTO)sqlsession.selectOne("faMan.nextTitle", map);
		return dto;
	}
	
	public boolean faManUpdate(foot_faMan_DTO dto)throws Exception{
		
		sqlsession.update("faMan.faManUpdate", dto);
		return true;
	}
	
	public boolean faManDelete(int fa_man_seq)throws Exception{
		sqlsession.delete("faMan.faManDelete", fa_man_seq);
		return true;
	}
	
	public int getfaManCount(foot_faMan_DTO dto)throws Exception{
		int num = 0;
		num = (int)sqlsession.selectOne("faMan.getfaManCount", dto);
		
		return num;
	}
	
	
}
