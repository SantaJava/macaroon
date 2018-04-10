package edu.iot.butter.service;

import java.util.List;

import edu.iot.butter.model.Login;
import edu.iot.butter.model.Member;
import edu.iot.butter.model.Pagination;
import edu.iot.butter.model.Password;


public interface MemberService {
	
	
	
	Member checkLogin(Login login) throws Exception;

	boolean create(Member member) throws Exception;

	boolean checkUserId(String userId) throws Exception;
	
	boolean update(Member member)throws Exception;
	
	Member getMember(String userId)throws Exception;
	
	boolean changePassword(Password password)throws Exception;
	
	Pagination getPagination(int page)throws Exception;
	
	List<Member> getList(Pagination pagination)throws Exception;
	
	//admin용 서비스
	boolean changePasswordByAdmin(Password password)throws Exception;
	boolean updateByAdmin(Member member)throws Exception;
}
