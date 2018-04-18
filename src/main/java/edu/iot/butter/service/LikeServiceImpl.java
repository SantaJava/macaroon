package edu.iot.butter.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edu.iot.butter.dao.LikeDao;
import edu.iot.butter.model.Like;

@Service
public class LikeServiceImpl implements LikeService {

	@Autowired
	LikeDao dao;

	@Override
	public boolean hasLike(Like like) throws Exception {
		return dao.getCount(like) == 1;
	}
	
	@Transactional 
	@Override
	public boolean insertLike(Like like) throws Exception {
		System.out.println("insertLike() 실행");
		return dao.insert(like) == 1;
	}

	@Override
	public boolean deleteLike(Like like) throws Exception {
		System.out.println("deleteLike() 실행");
		return dao.delete(like) == 1;
	}
}