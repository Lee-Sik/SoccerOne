package soccer.co.Service;

import java.util.List;

import soccer.co.DTO.ZipcodeDTO;
import soccer.co.DTO.foot_sbookingReserve_DTO;
import soccer.co.DTO.foot_sbooking_DTO;
import soccer.co.DTO.foot_stadium_DTO;
import soccer.co.DTO.postDTO;



public interface foot_stadiumService {
	
	public List<ZipcodeDTO> zipcode(String dong)throws Exception;
	public boolean stadiumWrite(foot_stadium_DTO dto)throws Exception;
	public List<postDTO> post_gugun()throws Exception;
	public List<postDTO> post_result(String gugun, String addrtype)throws Exception;
	public List<foot_stadium_DTO> stadiumList(String user_email)throws Exception;
	public boolean bookingWrtie(foot_sbooking_DTO dto)throws Exception;
	public boolean stadiumDelete(int stadium_seq)throws Exception;
	public List<foot_sbooking_DTO> bookingList(foot_sbooking_DTO dto)throws Exception;
	public foot_stadium_DTO stadiumDetail(int stadium_seq)throws Exception;
	public foot_sbooking_DTO bookingDetail(int booking_seq)throws Exception;
	public boolean bookingReserve(foot_sbookingReserve_DTO dto)throws Exception;
	public int getRentalSwitch(String booking_seq,String gametime)throws Exception;
	public int getbookingCount(foot_sbooking_DTO dto)throws Exception;
	public boolean stadiumUpdate(foot_stadium_DTO dto)throws Exception;
}
