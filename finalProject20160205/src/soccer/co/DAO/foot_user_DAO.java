package soccer.co.DAO;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import soccer.co.DTO.foot_team_DTO;
import soccer.co.DTO.foot_user_DTO;

@Repository
public class foot_user_DAO{
	
	@Autowired
	private SqlSession sqlse;
	
	
	private String ns = "foot_user.";
	private String ns1 = "foot_team.";

	public foot_user_DTO login(foot_user_DTO fudto) {
		// TODO Auto-generated method stub
		foot_user_DTO fudto1 = (foot_user_DTO) sqlse.selectOne(ns+"login", fudto);
			
		
		return fudto1;
	}
	
	
	public foot_user_DTO login1(foot_user_DTO fudto) {
		// TODO Auto-generated method stub
		foot_user_DTO fudto1 = (foot_user_DTO) sqlse.selectOne(ns+"login1", fudto);
		return fudto1;
	}
	

	public boolean join(foot_user_DTO fudto) throws Exception {
		// TODO Auto-generated method stub
		sqlse.insert(ns+"join", fudto);
		return true;
	}

	public foot_team_DTO loginteam(foot_user_DTO fudto) {
		// TODO Auto-generated method stub
		foot_team_DTO ftdto = (foot_team_DTO) sqlse.selectOne(ns1+"loginteam", fudto);
		System.out.println(fudto.toString());
		return ftdto;
	}


}
