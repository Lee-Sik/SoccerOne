package soccer.co.DAO;

import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import soccer.co.DTO.foot_team_DTO;

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

	public List<foot_team_DTO> teamGu(String user_address) {
		// TODO Auto-generated method stub
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
	
}
