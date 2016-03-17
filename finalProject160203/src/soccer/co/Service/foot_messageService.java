package soccer.co.Service;

import java.util.ArrayList;

import soccer.co.DTO.foot_message_DTO;
import soccer.co.DTO.foot_team_DTO;
import soccer.co.DTO.foot_user_DTO;

public interface foot_messageService {

	public boolean message(foot_message_DTO fmdto);

	public ArrayList<foot_message_DTO> messagecheck(foot_user_DTO fudto);

	public foot_message_DTO messagedetail(foot_message_DTO fmdto);

	public boolean join(foot_user_DTO fudto);

	public boolean messageread(foot_message_DTO fmdto);

	public ArrayList<foot_message_DTO> messagecheck1(foot_user_DTO login);

	public boolean teamapply(foot_message_DTO fmdto);

	public ArrayList<foot_message_DTO> messagesendlist(foot_message_DTO fmdto);

	public boolean matching(foot_message_DTO fmdto);



}
