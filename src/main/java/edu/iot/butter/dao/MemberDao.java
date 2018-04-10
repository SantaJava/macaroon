package edu.iot.butter.dao;

import edu.iot.butter.model.Member;
import edu.iot.butter.model.Password;

public interface MemberDao extends BaseDao<Member, String>{	//인터페이스를 상속받음
	//update 이기 때문에..
	int changePassword(Password password) throws Exception;
	//관리자 호출 메서드
	int updateByAdmin(Member member) throws Exception;
	
	int changePasswordByAdmin(Password password) throws Exception;
}
