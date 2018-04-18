package edu.iot.butter.dao;



import java.util.List;

import edu.iot.butter.model.Reply;

public interface ReplyDao extends BaseDao<Reply, Integer> {

	
	
	List<Reply> selectTopList(int boardId)throws Exception;
	List<Reply> selectChildList(int replyId)throws Exception;
	int deleteByUser(int replyId)throws Exception;
	int increaseReplyCnt(int replyId)throws Exception;
	
	int increaseLikeCnt(int replyId)throws Exception;
	int decreaseLikeCnt(int replyId)throws Exception;
	int insertTop(Reply reply)throws Exception;
	
}
