package soccer.co.DAO;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.StringTokenizer;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import soccer.co.DTO.foot_game_record;
import soccer.co.DTO.foot_team_DTO;
import soccer.co.DTO.foot_user_DTO;

@Repository
public class foot_team_DAO {

	@Autowired
	private SqlSession sql;
	
	private String ns = "foot_team.";
	private String ns1 = "foot_user.";
	
	public boolean join(foot_team_DTO fudto) throws Exception {
			//유저 업데이트 팀명 추가 기능
			System.out.println(fudto.toString());
			int a = sql.insert(ns+"join", fudto);
			sql.update(ns1+"teamjoin_userupdate", fudto);
		
		return a==1? true:false;
	}

	@SuppressWarnings("unchecked")
	public List<String> getGu() {
		return sql.selectList(ns+"getGu");
	}

	public List<foot_team_DTO> teamGu(String user_address) {//이게 뭡니까!!
		ArrayList<String> user_add = new  ArrayList<String>();
		StringTokenizer st = new StringTokenizer(user_address,"-");
        while(st.hasMoreTokens()){   //토근이 있는동안 while문이 실행됨
            String temp = st.nextToken(); // 토근을 temp 변수에 저장
            user_add.add(temp);
        }
        String add1= user_add.get(0);
		List<foot_team_DTO> notteamGu1 = sql.selectList(ns+"notteamGu", add1);
		 add1= user_add.get(1);
		List<foot_team_DTO> notteamGu2 = sql.selectList(ns+"notteamGu", add1);
		 add1= user_add.get(2);
		List<foot_team_DTO> notteamGu3 = sql.selectList(ns+"notteamGu", add1);
		List<foot_team_DTO> notteamGu = new ArrayList<foot_team_DTO>();
		for(int i=0;i<notteamGu1.size();i++){
			notteamGu.add(notteamGu1.get(i));
		}
		for(int i=0;i<notteamGu2.size();i++){
			notteamGu.add(notteamGu2.get(i));

		}
		for(int i=0;i<notteamGu3.size();i++){
			notteamGu.add(notteamGu3.get(i));

		}
		
		return notteamGu;
	}

	public List<foot_game_record> getGameRecord(String team_name) {
		return sql.selectList(ns+"getGameRecord",team_name);
	}

	public List<foot_user_DTO> getTeamMember(String team_name) {
		List<foot_user_DTO> q = sql.selectList(ns1+"getTeamMember",team_name);
		return q;
	}

	public foot_team_DTO getTeam(foot_team_DTO team) {
		return (foot_team_DTO) sql.selectOne(ns+"getTeam",team.getTeam_name());
	}

	public boolean modifyteam(foot_team_DTO team, foot_user_DTO fudto, String originteamname) {
		// TODO Auto-generated method stub
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("originteamname", originteamname);
		map.put("team", team);
		
		sql.update(ns+"modifyteam", map);
		
		sql.update(ns1+"modifyteam1",fudto);
		return true;
	}
	
}
