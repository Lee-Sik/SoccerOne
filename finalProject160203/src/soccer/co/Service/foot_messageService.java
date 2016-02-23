package soccer.co.Service;

import java.util.ArrayList;

import soccer.co.DTO.foot_message_DTO;
import soccer.co.DTO.foot_team_DTO;
import soccer.co.DTO.foot_user_DTO;

public interface foot_messageService {

	public boolean teamapplymeg(foot_message_DTO fmdto);

	public ArrayList<foot_message_DTO> messagecheck(foot_user_DTO fudto);


}
