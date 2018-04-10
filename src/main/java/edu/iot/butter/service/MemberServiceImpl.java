package edu.iot.butter.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edu.iot.butter.dao.MemberDao;
import edu.iot.butter.exception.LoginFailException;
import edu.iot.butter.model.Login;
import edu.iot.butter.model.Member;
import edu.iot.butter.model.Pagination;
import edu.iot.butter.model.Password;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	MemberDao dao;
	
	@Override
	public boolean checkUserId(String userId) throws Exception {
		Member m = dao.selectOne(userId);
		return m != null;
	}

	@Override
	public Member checkLogin(Login login) throws Exception {

		Member m = dao.selectOne(login.getUserId());
		if (m != null && m.getPassword().equals(login.getPassword())) {
			return m;
		}
		throw new LoginFailException("Your ID or Password is incorrect.");
	}
	
	@Transactional
	@Override
	public boolean create(Member m) throws Exception{
		int result = dao.insert(m);
		return result == 1;
	}

	@Transactional
	@Override
	public boolean update(Member m) throws Exception {
		int result = dao.update(m);
		return result==1;
	}

	@Override
	public Member getMember(String userId) throws Exception {
		return dao.selectOne(userId);
	}

	@Transactional
	@Override
	public boolean changePassword(Password password) throws Exception {		
		return dao.changePassword(password)==1 ;
	}

	@Override
	public Pagination getPagination(int page) throws Exception {
		int total = dao.getCount();
		return new Pagination(page,total);
	}

	@Override
	public List<Member> getList(Pagination pagination) throws Exception {		
		System.out.println("pagination: " + pagination);
		return dao.selectList(pagination);
	}

	@Transactional
	@Override
	public boolean changePasswordByAdmin(Password password) throws Exception {
		return dao.changePasswordByAdmin(password)== 1;
	}


	@Transactional
	@Override
	public boolean updateByAdmin(Member member) throws Exception {
		return dao.updateByAdmin(member)== 1;
	}
}
