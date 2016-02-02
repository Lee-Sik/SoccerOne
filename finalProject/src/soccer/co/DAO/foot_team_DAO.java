package soccer.co.DAO;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import soccer.co.DTO.foot_team_DTO;

@Repository
public class foot_team_DAO {

	@Autowired
	private SqlSession sql;
	
	private String ns = "foot_team.";
	
	public boolean join(foot_team_DTO fudto) throws Exception {
			int a = sql.insert(ns+"join", fudto);
		
		return a==1? true:false;
	}

	@SuppressWarnings("unchecked")
	public List<String> getGu() {
		return sql.selectList(ns+"getGu");
	}
	
}
