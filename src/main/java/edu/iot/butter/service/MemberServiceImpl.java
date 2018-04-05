package edu.iot.butter.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.iot.butter.dao.MemberDao;
import edu.iot.butter.model.Login;
import edu.iot.butter.model.Member;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	MemberDao dao;
	
	
	@Override
	public Member checkLogin(Login login) {
		// TODO Auto-generated method stub
		return null;
	}
}
