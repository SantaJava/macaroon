package edu.iot.butter.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edu.iot.butter.dao.ReplyDao;
import edu.iot.butter.model.Reply;

@Service
public class ReplyServiceImpl implements ReplyService {

	@Autowired
	ReplyDao dao;

	@Override
	public Reply getReply(int replyId) throws Exception {
		return dao.selectOne(replyId);
	}

	@Transactional
	@Override
	public int create(Reply reply, boolean hasParent) throws Exception {
		// hasParent를 통해 parentId가 있는지 없는지 파악한다.
		System.out.println("create()호출");
		boolean result;
		if (hasParent) {
			result = dao.insert(reply) == 1;
			dao.increaseReplyCnt(reply.getParentReply());
		} else {
			result = dao.insertTop(reply) == 1;
		}

		// reply.getReplyId()

		return reply.getReplyId();
	}

	@Transactional
	@Override
	public boolean update(Reply reply) throws Exception {
		return dao.update(reply) == 1;
	}

	@Transactional
	@Override
	public boolean delete(Reply reply) throws Exception {
		return dao.deleteByUser(reply.getReplyId()) == 1;
	}

	@Transactional
	@Override
	public boolean delete(int boardId) throws Exception {

		return false;
	}

	@Override
	public boolean create(Reply reply) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public List<Reply> getReplyList(int replyId) throws Exception {
		System.out.println(replyId);
		List<Reply> list = dao.selectChildList(replyId);

		return list;
	}

	// 라이크 주가본
	@Transactional
	@Override
	public int increaseLikeCnt(int replyId) throws Exception {
		return dao.increaseLikeCnt(replyId);
	}

	@Transactional
	@Override
	public int decreaseLikeCnt(int replyId) throws Exception {
		return dao.decreaseLikeCnt(replyId);
	}

}